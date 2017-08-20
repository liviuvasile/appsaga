truncate table scanner;
drop index scanCODidx;
create index scanCODidx ON scanner(cod_saga);
declare
	f utl_file.file_type;
	myline varchar2(200);
	rest varchar2(200);
	j number;
	codbare varchar2(13);
	nrex varchar2(10);
	p_gestiune number;
	CURSOR c1(pg number) IS SELECT cod_saga, id_furnizor, gestiune FROM inventar WHERE
		gestiune=pg and arhivat is null
		FOR UPDATE of stoc_gestiune;
	t c1%ROWTYPE;
	gstoc  NUMBER;
	CURSOR c2(pg number) IS SELECT cod_saga, id_furnizor, gestiune FROM inventar WHERE
  		gestiune=pg and arhivat is null
  		FOR UPDATE of stoc_cp;
	y c2%ROWTYPE;
	CURSOR c3(pg number) IS SELECT cod_saga, id_furnizor, gestiune FROM inventar WHERE
		gestiune=pg and arhivat is null
		FOR UPDATE of stoc_inventar;
	z c3%ROWTYPE;
	CURSOR c4(pg number) IS SELECT cod_saga, id_furnizor, gestiune FROM inventar WHERE
		gestiune=pg and arhivat is null
		FOR UPDATE of stoc_ll;
	w c4%ROWTYPE;
    
/* Versiune         Data          Modificare
---------------------------------------------------------------------------------------------
   2.1.0            12/02/2015    Am renuntat la stoc_ll si am corectat update-ul de furnizor
*/
begin
p_gestiune:=&1;
--introducere produse
delete from inventar where gestiune=p_gestiune and arhivat is null;
insert into inventar (COD_SAGA,DENUMIRE,PRETMAGAZIN,PRETUNITAR,CODDEBARE,
	ARETVA,ID_FURNIZOR,GESTIUNE,STOC_GESTIUNE,STOC_CP,STOC_INVENTAR)
select COD_SAGA,DENUMIRE,PRETMAGAZIN,PRETUNITAR,CODDEBARE,
	ARETVA,ID_FURNIZOR,GESTIUNE,0,0, 0
from produs
where gestiune=p_gestiune;
commit;
update inventar set nume=(select nvl(max(denumire),'==NECUNOSCUT==') from furnizor where codfiscal=id_furnizor)
where gestiune=p_gestiune and arhivat is null; --2.1.0
commit;
--calculare stoc gestiune
OPEN c1(p_gestiune);
LOOP
	FETCH c1 INTO t;
	EXIT WHEN c1%NOTFOUND;
	select nvl(sum(cantitate-iesiri),0) into gstoc
		from intrari where furnizor=t.id_furnizor and cod_saga=t.cod_saga and gestiune=t.gestiune and cantitate>0;
	if gstoc<0 then
		gstoc:=0;
	end if;
	UPDATE inventar SET stoc_gestiune=gstoc
		WHERE CURRENT OF c1;
END LOOP;
CLOSE c1;
COMMIT;
--calculare stoc CP
OPEN c2(p_gestiune);
LOOP
	FETCH c2 INTO y;
	EXIT WHEN c2%NOTFOUND;
	select nvl(sum(cantitate),0) into gstoc
		from comanda
		where cod_saga=y.cod_saga and gestiune=y.gestiune and stare in ('RACHITATA','RCONFIRMATA','RTRIMISA','VACHITATA','VCONFIRMATA','VTRIMISA','PACHITATA','PCONFIRMATA','PTRIMISA');
	if gstoc<0 then
		gstoc:=0;
	end if;
	UPDATE inventar SET stoc_cp=gstoc
		WHERE CURRENT OF c2;
END LOOP;
CLOSE c2;
COMMIT;
--calculare stoc LL
/*2.1.0
OPEN c4(p_gestiune);
LOOP
	FETCH c4 into w;
	EXIT WHEN c4%NOTFOUND;
	select count(*) into gstoc
		from lalouise
		where cod_saga=w.cod_saga and nr_factura=57098  and data_borderou is not null and data_refuz is null;
	UPDATE inventar SET stoc_ll=gstoc
		WHERE CURRENT OF c4;
END LOOP;
CLOSE c4;
COMMIT;
*/

--introducere produse scanner
f := utl_file.fopen('INVENTAR','FISIERINVENTAR.TXT','R');
LOOP
	utl_file.get_line(f,myline);
	codbare:=substr(myline,1,13);
	codbare:=replace(codbare, chr(10), '');
	codbare:=replace(codbare, chr(13), '');
	exit when codbare is null or codbare='';
	rest:=substr(myline,15);
	j:=instr(rest,';');
	rest:=replace(rest, chr(10), '');
	rest:=replace(rest, chr(13), '');
	nrex:=to_number(substr(rest,j+1));	
	insert into scanner(coddebare, stoc) values (codbare, nrex);	
END LOOP;
commit;
utl_file.fclose(f);
--calculam codurile saga
UPDATE scanner SET cod_saga=to_number(substr(coddebare,4,9));
COMMIT;
--introducere stoc scanner
OPEN c3(p_gestiune);
LOOP
        FETCH c3 INTO z;
        EXIT WHEN c3%NOTFOUND;
        select nvl(sum(stoc),0) into gstoc
                from scanner where cod_saga=z.cod_saga;
        UPDATE inventar SET stoc_inventar=gstoc
                WHERE CURRENT OF c3;
END LOOP;
CLOSE c3;
COMMIT;
end;
/
exit
