create or replace PROCEDURE create_npl(p_codbare VARCHAR2, p_nrex NUMBER, p_gestiune NUMBER, p_update_stoc BOOLEAN DEFAULT TRUE) IS
--procedura folosita pentru a crea note plata incepand cu versiunea 2.1.1
CURSOR c_intrari(cp_cod_saga NUMBER, cp_id_furn VARCHAR2, cp_gestiune NUMBER) IS 
    SELECT * FROM intrari
        WHERE furnizor=cp_id_furn 
          and cod_saga=cp_cod_saga 
          and cantitate>0 
          and gestiune=cp_gestiune 
    FOR UPDATE OF iesiri
    ORDER BY data_nir;
    
    codsaga 	NUMBER;
    pret		NUMBER;
    denumire	VARCHAR2(100);
    id_furn		VARCHAR2(15);
    gestiune	NUMBER;
    intrari 	NUMBER;
    iesiri		NUMBER;
    descazut	NUMBER;
    posibile	NUMBER;
    tip_plata	VARCHAR2(15);
    g_TVA       NUMBER;
    l_TVA       NUMBER;
    l_TVA_Discount NUMBER;
BEGIN
 --determina procentul parametrat de TVA
 IF p_gestiune IN (1,2,4) THEN
    SELECT valoare INTO g_TVA FROM parametri WHERE nume='TVA_CARTE';
 ELSIF p_gestiune IN (3,5) THEN
    SELECT valoare INTO g_TVA FROM parametri WHERE nume='TVA_PAPETARIE';
 END IF;
 
  SELECT cod_saga, pretunitar, denumire, id_furnizor, gestiune 
    INTO codsaga, pret, denumire, id_furn, gestiune 
    FROM produs 
    WHERE coddebare=p_codbare
      AND gestiune=p_gestiune
      ;
  descazut:=p_nrex;

  FOR t_intrari IN c_intrari(codsaga, id_furn,p_gestiune)
  LOOP
  	EXIT WHEN descazut=0;
  	intrari:=t_intrari.cantitate;
  	iesiri:=t_intrari.iesiri;
    
    IF (t_intrari.tip_plata='LA VANZARE') THEN
        tip_plata := 'LA VANZARE';
    ELSIF (t_intrari.tip_plata='AVANS') THEN
        tip_plata := 'VANZARE AVANS';
    ELSIF t_intrari.tip_plata='LA TERMEN' THEN
        tip_plata := 'VANZARE TERMEN';
    ELSE
        tip_plata := 'GRESIT';
    END IF;
    
    --recalculam TVA si TVA_Discount in cazul in care procentul de TVA (legal) s-a modificat intre timp
    --recalcularea este necesara doar pentru produsele intrate pe aviz
    --pentru produsele intrate pe factura, nota de plata va pastra procentul original de TVA ( cel al documentului de intrare)
    IF (t_intrari.tip = 'AVI') AND t_intrari.procent_tva <> g_TVA THEN
        l_TVA := ROUND(((t_intrari.pret_unitar - t_intrari.discount - t_intrari.timbru) * g_TVA) / 100 ,4);
        l_TVA_Discount := ROUND((t_intrari.discount * g_TVA) /100,4);
    ELSE
        l_TVA := t_intrari.tva;
        l_TVA_Discount := t_intrari.tva_discount;
        g_TVA := t_intrari.procent_tva;
    END IF;
  	
  	IF (intrari-iesiri)>0 THEN
	  	IF (intrari - iesiri - descazut)>=0 THEN
	  		--inseram NPL  	si apoi facem update la intrari si stoc	  			
	  		INSERT INTO npl ( numar
                            , tip
                            , data
                            , cod_saga
                            , denumire
                            , cantitate
                            , pret_unitar
                            , tva
                            , timbru
                            , discount
                            , tva_discount
                            , furnizor
                            , gestiune
                            , data_emitere
                            , tip_plata
                            , procent_TVA)
                    VALUES ( t_intrari.numar
                           , t_intrari.tip
                           , t_intrari.data
                           , t_intrari.cod_saga
                           , t_intrari.denumire
                           , descazut
                           , t_intrari.pret_unitar
                           , l_TVA
                           , t_intrari.timbru
                           , t_intrari.discount
                           , l_TVA_Discount
                           , t_intrari.furnizor
                           , t_intrari.gestiune
                           , sysdate
                           , tip_plata 
                           , g_TVA);
            
	  		UPDATE intrari SET
	  			iesiri=iesiri + descazut
	  		WHERE CURRENT OF c_intrari;
            
            IF p_update_stoc THEN
                --scadem stocul
                UPDATE produs 
                    SET stoc=stoc-descazut 
                    WHERE cod_saga=codsaga;
            END IF;
	  		descazut:=0;  		
	  	ELSE
	  		--nu avem destul "spatiu" pe factura, scadem cat putem
	  		posibile:=intrari-iesiri;
	  		--inseram NPL  	si apoi facem update la intrari si stoc
	  		INSERT INTO npl( numar
                           , tip
                           , data
                           , cod_saga
                           , denumire
                           , cantitate
                           , pret_unitar
                           , tva
                           , timbru
                           , discount
                           , tva_discount
                           , furnizor
                           , gestiune
                           , data_emitere
                           , tip_plata
                           , procent_TVA)
                VALUES (   t_intrari.numar
                         , t_intrari.tip
                         , t_intrari.data
                         , t_intrari.cod_saga
                         , t_intrari.denumire
                         , posibile
                         , t_intrari.pret_unitar
                         , l_TVA
                         , t_intrari.timbru
                         , t_intrari.discount
                         , l_TVA_Discount
                         , t_intrari.furnizor
                         , t_intrari.gestiune
                         , sysdate
                         , tip_plata 
                         , g_TVA);
	  		UPDATE intrari SET
	  			iesiri=iesiri + posibile
	  		WHERE CURRENT OF c_intrari;
            
            IF p_update_stoc THEN
                --scadem stocul
                UPDATE produs 
                SET stoc=stoc-posibile 
                WHERE cod_saga=codsaga;
            END IF;
	  		descazut:=descazut-posibile;
	  	END IF;
  	END IF;
  	END LOOP;
  	
  	IF descazut>0 THEN
  		INSERT INTO zerror (id,cod_saga,pret,denumire,gestiune,data,cantitate ) 
            SELECT zerrorseq.nextval, codsaga, pret, denumire, p_gestiune, sysdate, descazut 
            FROM dual;
  	END IF;
  	COMMIT;
END;
/