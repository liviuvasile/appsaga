--corecteaza codul fiscal in tabelele INVENTAR, PRODUS si CP_INVENTAR
--versiunea 2.1.0 din 05.02.2015
DECLARE
    CURSOR prod_to_update IS
        select cod_saga, gestiune,idf, denumire from 
            furnizor,
            (select max(furnizor) idf, intrari.cod_saga, intrari.gestiune
                from intrari
                  ,
                ( select cod_saga, gestiune from INVENTAR where id_furnizor is null
                  union
                  select cod_saga, gestiune from PRODUS where id_furnizor is null
                  union
                  SELECT cod_saga, gestiune FROM CP_INVENTAR WHERE ID_FURNIZOR is null
                  ) idf_null
               where intrari.cod_saga=idf_null.cod_saga and intrari.gestiune=idf_null.gestiune
            group by intrari.cod_saga, intrari.gestiune) recalc
            where furnizor.codfiscal=idf
                -->conditii superflue, dar failsafe
                AND idf is not null
                AND gestiune is not null
                AND cod_saga is not null
                --<
            ;
    r_prod prod_to_update%rowtype;
    i number;
BEGIN
    OPEN prod_to_update;
    LOOP
        FETCH prod_to_update INTO r_prod;
        EXIT WHEN prod_to_update%NOTFOUND;
        
        UPDATE INVENTAR SET id_furnizor=r_prod.idf WHERE cod_saga=r_prod.cod_saga and gestiune=r_prod.gestiune AND id_furnizor IS NULL;
        i := SQL%ROWCOUNT; 
        IF i > 0 THEN
            dbms_output.put_line('Codul '||r_prod.cod_saga||' a fost modificat pe '||i||' linii in tabelul INVENTAR cu furnizorul '||r_prod.idf||' '||r_prod.denumire);
        END IF;
        
        UPDATE PRODUS SET id_furnizor=r_prod.idf WHERE cod_saga=r_prod.cod_saga and gestiune=r_prod.gestiune AND id_furnizor IS NULL;
        i := SQL%ROWCOUNT;
        IF i > 0 THEN
            dbms_output.put_line('Codul '||r_prod.cod_saga||' a fost modificat pe '||i||' linii in tabelul PRODUS cu furnizorul '||r_prod.idf||' '||r_prod.denumire);
        END IF;
        
        UPDATE CP_INVENTAR SET id_furnizor=r_prod.idf WHERE cod_saga=r_prod.cod_saga and gestiune=r_prod.gestiune AND id_furnizor IS NULL;
        i := SQL%ROWCOUNT;
        IF i > 0 THEN
            dbms_output.put_line('Codul '||r_prod.cod_saga||' a fost modificat pe '||i||' linii in tabelul CP_INVENTAR cu furnizorul '||r_prod.idf||' '||r_prod.denumire);
        END IF;
    END LOOP;
    --ROLLBACK;
    COMMIT;
END;
/