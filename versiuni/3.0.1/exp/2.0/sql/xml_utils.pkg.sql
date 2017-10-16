CREATE OR REPLACE PACKAGE xml_utils IS
/*-----------------------------------------------------------------
Versiune   Data          Modificare
====================================================================
    2.0    14.10.2017    Daca modul de plata e RAMBURS, valuta e intotdeauna RON
    1.9    19.07.2017    Implementare plata prin CARD (retrocompatibil)
    1.5    13.12.2013    Am adaugat functii compatibile cu Oracle 10g
    1.4    12.12.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
    PROCEDURE insert_user10g( input IN CLOB, output OUT VARCHAR2);
    PROCEDURE insert_order10g( input IN CLOB, output OUT VARCHAR2);
END xml_utils;
/

CREATE OR REPLACE PACKAGE BODY xml_utils IS

/****************************************************************************/
/*                                                                          */
/*                         insert_user10g                                   */
/*                                                                          */
/****************************************************************************/

PROCEDURE insert_user10g(input IN CLOB, output OUT VARCHAR2) IS
    l_xml       XMLTYPE;
    l_userid    NUMBER;
    l_count     NUMBER;
    
    CURSOR c_user(cp_xml XMLTYPE) IS
    SELECT 
            ExtractValue ( EXTRACT(xml, '/insert_user/USERNAME'), 'USERNAME') username,
            ExtractValue ( EXTRACT(xml, '/insert_user/EMAIL'), 'EMAIL') email,
            ExtractValue ( EXTRACT(xml, '/insert_user/PASSWORD_MD5'), 'PASSWORD_MD5') password_md5,
            ExtractValue ( EXTRACT(xml, '/insert_user/LANGUAGE'), 'LANGUAGE') language
        FROM 
        (SELECT cp_xml xml FROM dual);
   
    l_user c_user%rowtype;
BEGIN
    output := NULL;    
    BEGIN
        l_xml := XMLTYPE(input);
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR: XML not well formed';
    END;
    
    --validate insert_user branch
    /*
        ERROR: XML not well formed
        ERROR: insert_user section is null
        ERROR: username is null
        ERROR: email is null
        ERROR: password is null
        ERROR: language is null 
        ERROR: language is not in acceptable values
        ERROR: username is already taken
        ERROR: email is already taken
    */
    IF output IS NULL THEN
    BEGIN
        OPEN c_user(l_xml);
        FETCH c_user into l_user;
        IF c_user%NOTFOUND THEN
            CLOSE c_user;
            output := 'ERROR: insert_user section is null';
        ELSE
            CLOSE c_user;
            IF l_user.username is null THEN
                output := 'ERROR: username is null';
            ELSIF l_user.email is null THEN
                output := 'ERROR: email is null';
            ELSIF l_user.password_md5 is null THEN
                output := 'ERROR: password is null';
            ELSIF l_user.language is null THEN
                output := 'ERROR: language is null';
            ELSE
                IF l_user.language NOT IN ('RO', 'EN', 'FR') OR length(l_user.language)>2 THEN
                    output := 'ERROR: language is not in acceptable values';
                END IF;
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;

    IF output IS NULL THEN
    BEGIN
        SELECT count(*) into l_count FROM site_users WHERE upper(username)=upper(l_user.username);
        IF l_count>0 THEN
            output :='ERROR: username is already taken';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
    
    IF output IS NULL THEN
    BEGIN
        SELECT count(*) into l_count FROM site_users WHERE upper(email)=upper(l_user.email);
        IF l_count>0 THEN
            output :='ERROR: email is already taken';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
    
    --try to insert the data
    IF output IS NULL THEN
    BEGIN
        SELECT siteuserseq.nextval INTO l_userid FROM dual;
        INSERT INTO site_users      
        (userid, username, email, pass, registerdate, lastvisitdate,limba)
        VALUES (l_userid,l_user.username, l_user.email,l_user.password_md5,sysdate,sysdate,l_user.language);
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
   
    IF output IS NULL THEN
            output := 'OK'||l_userid;
            COMMIT;
    END IF;
END insert_user10g;

/****************************************************************************/
/*                                                                          */
/*                         insert_order10g                                  */
/*                                                                          */
/****************************************************************************/
PROCEDURE insert_order10g(input IN CLOB, output OUT VARCHAR2) IS
    l_xml       XMLTYPE;
    l_username  VARCHAR2(25);
    l_produse   NUMBER := 0;
    l_total     NUMBER := 0;
    
    CURSOR c_id(cp_xml XMLTYPE) IS
    SELECT  ExtractValue ( EXTRACT(xml, '/PHP/ID'), 'ID') id
            FROM 
            (SELECT cp_xml xml FROM dual);
    l_id c_id%rowtype;
   
    CURSOR c_total_comanda(cp_xml XMLTYPE) IS
        SELECT 
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/PAYMENT'),     'PAYMENT')      payment,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/TRANSPORT'),   'TRANSPORT')    transport,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/TAX'),         'TAX')          tax,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/USERID'),      'USERID')       userid,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/NUME_LIVRARE'),'NUME_LIVRARE') nume_livrare,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/EMAIL'),       'EMAIL')        email,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/TIP_USER'),    'TIP_USER')     tip_user,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/ADRESA'),      'ADRESA')       adresa,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/ORAS'),        'ORAS')         oras,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/JUDETUL'),     'JUDETUL')      judetul,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/TARA'),        'TARA')         tara,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/COD_POSTAL'),  'COD_POSTAL')   cod_postal,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/TELEFON'),     'TELEFON')      telefon,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/DETALII'),     'DETALII')      detalii,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/ORDER/DETALII_FACTURARE'), 'DETALII_FACTURARE') detalii_facturare
        FROM 
        (SELECT cp_xml xml FROM dual);
    l_tc c_total_comanda%rowtype;
    
    CURSOR c_comanda(cp_xml XMLTYPE) IS
        SELECT 
          ExtractValue ( EXTRACT(produs, '/PRODUS/COD_SAGA'),   'COD_SAGA')     cod_saga,
          ExtractValue ( EXTRACT(produs, '/PRODUS/PRET_REDUS'), 'PRET_REDUS')   pret_redus,
          ExtractValue ( EXTRACT(produs, '/PRODUS/PRET'),       'PRET')         pret,
          ExtractValue ( EXTRACT(produs, '/PRODUS/GESTIUNE'),   'GESTIUNE')     gestiune,
          ExtractValue ( EXTRACT(produs, '/PRODUS/CANTITATE'),  'CANTITATE')    cantitate
           FROM 
           ( 
           SELECT VALUE(p) produs
           FROM (SELECT cp_xml xml FROM dual), 
           TABLE(XMLSEQUENCE(EXTRACT(xml, '/PHP/insert_order/PRODUSE/*'))) p ) produse
           ;
    l_c c_comanda%rowtype;
    
    CURSOR c_valuta(cp_xml XMLTYPE) IS
    SELECT  
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/COD_VALUTA'),   'COD_VALUTA')   cod_valuta,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/CURS_VALUTAR'),   'CURS_VALUTAR')   curs_valutar, --1.9
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/BIBLIO_EUR'),   'BIBLIO_EUR')   biblio_eur,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/BIBLIO_USD'),   'BIBLIO_USD')   biblio_usd,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/TOTAL_PRODUSE'),'TOTAL_PRODUSE') total_produse,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/TAXE'),         'TAXE')         taxe,
            ExtractValue ( EXTRACT(xml, '/PHP/insert_order/INFO_VALUTAR/TOTAL_COMANDA'),'TOTAL_COMANDA') total_comanda
            FROM 
            (SELECT cp_xml xml FROM dual);
    l_v c_valuta%rowtype;
BEGIN
    output := NULL;    
    BEGIN
        l_xml := XMLTYPE(input);
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR: XML not well formed';
    END;
    --get the ID
    BEGIN
        OPEN c_id(l_xml);
        FETCH c_id INTO l_id;
        CLOSE c_id;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR: cannot get the ID';
    END;
   
    --validate ORDER branch
    /*
        ERROR: ORDER section is null
        ERROR: PAYMENT is null
        ERROR: TRANSPORT is null
        ERROR: TAX is null
        ERROR: USERID is null
        ERROR: NUME_LIVRARE is null
        ERROR: EMAIL is null
        ERROR: TIP_USER is null
        ERROR: ADRESA is null
        ERROR: ORAS is null
        ERROR: TARA is null
    */
    IF output IS NULL THEN
    BEGIN
        OPEN c_total_comanda(l_xml);
        FETCH c_total_comanda into l_tc;
        IF c_total_comanda%NOTFOUND THEN
            CLOSE c_total_comanda;
            output := 'ERROR: ORDER section is null';
        ELSE
            CLOSE c_total_comanda;
            IF l_tc.payment is null THEN
                output := 'ERROR: PAYMENT is null';
            ELSIF l_tc.transport is null THEN
                output := 'ERROR: TRANSPORT is null';
            ELSIF l_tc.tax is null THEN
                output := 'ERROR: TAX is null';
            ELSIF l_tc.userid is null THEN
                output := 'ERROR: USERID is null';
            ELSIF l_tc.nume_livrare is null THEN
                output := 'ERROR: NUME_LIVRARE is null';
            ELSIF l_tc.email is null THEN
                output := 'ERROR: EMAIL is null';
            ELSIF l_tc.tip_user is null THEN
                output := 'ERROR: TIP_USER is null';
            ELSIF l_tc.adresa is null THEN
                output := 'ERROR: ADRESA is null';
            ELSIF l_tc.oras is null THEN
                --1.9 output := 'ERROR: ORAS is null';
                l_tc.oras := 'NECUNOSCUT'; --1.9
            ELSIF l_tc.tara is null THEN
                output := 'ERROR: TARA is null';
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
    
    --get the username
    IF output IS NULL THEN
        BEGIN
            SELECT username INTO l_username FROM site_users WHERE userid=l_tc.userid;
        EXCEPTION
            WHEN OTHERS THEN
                output := 'ERROR: Specified user does not exist';
        END;
    END IF;
    
    --validate PRODUSE branch and calculate the total
    /*
        ERROR: PRODUSE section is null
        ERROR: PRODUS section is null
        ERROR: COD_SAGA is null on product nr. X
        ERROR: PRET_REDUS is null on product nr. X
        ERROR: PRET is null on product nr. X
        ERROR: GESTIUNE is null on product nr. X
        ERROR: CANTITATE is null on product nr. X
    */
    IF output IS NULL THEN
    BEGIN
        OPEN c_comanda(l_xml);
        LOOP
            FETCH c_comanda into l_c;
            EXIT WHEN c_comanda%NOTFOUND;
  
            IF l_c.cod_saga is null THEN
                output := 'ERROR: COD_SAGA is null on product nr. '||l_produse;
            ELSIF l_c.pret_redus is null THEN
                output := 'ERROR: PRET_REDUS is null on product nr.'||l_produse;
            ELSIF l_c.pret is null THEN
                output := 'ERROR: PRET is null on product nr.'||l_produse;
            ELSIF l_c.gestiune is null THEN
                output := 'ERROR: GESTIUNE is null on product nr.'||l_produse;
            ELSIF l_c.cantitate is null THEN
                output := 'ERROR: CANTITATE is null on product nr.'||l_produse;
            END IF;
            l_produse := l_produse+1;
            l_total := l_total + l_c.pret_redus * l_c.cantitate;
        END LOOP;
        CLOSE c_comanda;
        
        IF l_produse=0 THEN
            output := 'ERROR: PRODUSE section is null';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;

    --validate INFO_VALUTAR branch
    /*
        ERROR: INFO_VALUTAR section is null
        ERROR: COD_VALUTA is null
        ERROR: CURS_VALUTAR is null
        ERROR: TOTAL_PRODUSE is null
        ERROR: TAXE is null
        ERROR: TOTAL_COMANDA is null
    */
    IF output IS NULL THEN
    BEGIN
        OPEN c_valuta(l_xml);
        FETCH c_valuta into l_v;
        
        IF c_valuta%NOTFOUND THEN
            CLOSE c_valuta;
            output := 'ERROR: INFO_VALUTAR section is null';
        ELSE
            CLOSE c_valuta;
            IF l_v.cod_valuta is null THEN
                output := 'ERROR: COD_VALUTA is null';
            -->1.9
            ELSIF NVL(l_v.cod_valuta,5) NOT IN (1,2,3) THEN
                output := 'ERROR: COD_VALUTA not in accepted range';
            ELSIF l_v.curs_valutar is null  and l_v.biblio_eur is null and l_v.biblio_usd is null THEN
                output := 'ERROR: CURS_VALUTAR is null';
            --<1.9
            /* 1.9
            ELSIF l_v.biblio_eur is null THEN
                output := 'ERROR: BIBLIO_EUR is null';
            ELSIF l_v.biblio_usd is null THEN
                output := 'ERROR: BIBLIO_USD is null';
            */
            ELSIF l_v.total_produse is null THEN
                output := 'ERROR: TOTAL_PRODUSE is null';
            ELSIF l_v.taxe is null THEN
                output := 'ERROR: TAXE is null';
            ELSIF l_v.total_comanda is null THEN
                output := 'ERROR: TOTAL_COMANDA is null';
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
    
    
    --try to insert the data
    IF output IS NULL THEN
    BEGIN
        --header
        INSERT INTO total_comanda
        (ID,PAYMENT,TRANSPORT,PRET_TOTAL,STARE,DATA_INTRODUCERII,USERID,USERNAME,EMAIL,TIP_USER,
        NUME_LIVRARE,ADRESA,ORAS,JUDETUL, TARA,COD_POSTAL,TELEFON,DETALII,DETALII_FACTURARE,
        GREUTATE, TAXE, REDUCERE)
        VALUES 
        (l_id.id,l_tc.payment,l_tc.transport,l_total,'NOUA',sysdate,l_tc.userid,l_username,l_tc.email,l_tc.tip_user,
        l_tc.nume_livrare,l_tc.adresa,l_tc.oras, l_tc.judetul, l_tc.tara,l_tc.cod_postal,l_tc.telefon,l_tc.detalii,l_tc.detalii_facturare,
        0,0,0);
        
        --produse
        OPEN c_comanda(l_xml);
        LOOP
            FETCH c_comanda into l_c;
            EXIT WHEN c_comanda%NOTFOUND;
            INSERT INTO comanda
            (id, userid, cod_saga, pret, pret_initial, gestiune, cantitate, stare)
            VALUES 
            (l_id.id, l_tc.userid, l_c.cod_saga, l_c.pret_redus, l_c.pret, l_c.gestiune, l_c.cantitate, 'NOUA');
        END LOOP;
        CLOSE c_comanda;
        
        -->1.9
        --2.0 IF l_v.cod_valuta <>3 THEN
        -->2.0
        IF l_tc.payment = 1 THEN
            l_v.cod_valuta := 3;
        END IF;
        --<2.0
        IF l_v.curs_valutar is null THEN
            SELECT decode(l_v.cod_valuta,1,curs,2,curs_usd,1)
              INTO l_v.curs_valutar
              FROM curs_valutar
             WHERE id=(SELECT max(id) FROM curs_valutar);
        END IF;
        
        IF l_v.biblio_eur IS NULL THEN
            SELECT curs
              INTO l_v.biblio_eur
              FROM curs_valutar
             WHERE id=(SELECT max(id) FROM curs_valutar);
        END IF;
        
        IF l_v.biblio_usd IS NULL THEN
            SELECT curs_usd
              INTO l_v.biblio_usd
              FROM curs_valutar
             WHERE id=(SELECT max(id) FROM curs_valutar);
        END IF;
        --<1.9
        --info valuta
        INSERT INTO comanda_euro
        (id, curs, taxe, valoare, total, curs_usd, cod_valuta)
        VALUES 
        (l_id.id, l_v.biblio_eur, l_v.taxe, l_v.total_produse, l_v.total_comanda, l_v.biblio_usd, l_v.cod_valuta);
        --2.0 END IF; --1.9
     EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            output := 'ERROR:'||sqlerrm;    
    END;
    END IF;
   
    IF output IS NULL THEN
            output := 'OK'||l_id.id;
            COMMIT;
    END IF;
END insert_order10g;

END xml_utils;
/