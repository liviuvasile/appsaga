<?php
/*-----------------------------------------------------------------
Versiune   Data          Modificare
====================================================================
    1.9    19.07.2017    Am modificat insert_order.php 
    1.8    06.02.2015    Am modificat get_max_book_id.php si get_book_ids_by_range.php, get_book_by_id.php
    1.7    01.11.2014    Am adaugat get_stock_by_bulk_id.php
    1.6    21.09.2014    Am adaugat get_all_promos.php
    1.5    13.12.2013    Am modificat insert_order, insert_user, xml_utils.pkg
                         Am adaugar get_user_orders.php
    1.4    12.12.2013    Am modificat insert_order, insert_user
                         Am adaugat xml_utils.pkg
    1.3    09.12.2013    Am modificat insert_order
                         Am modificat get_order_by_id
                         Am modificat functii.php
    1.2    01.12.2013    Am adaugat insert_order
    1.2    30.11.2013    Am adaugat get_order_by_id
    1.2    30.11.2013    Am adaugat change_user_pass
    1.2    06.10.2013    Am modificat get_book_by_id
    1.2    06.10.2013    Am adaugat get_rate
    1.2    28.09.2013    Am adaugat insert_user
    1.1    15.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
if(!isset($_GET['k']) || ($_GET['k'] != MD5('Elisabeta16'))) die();

?>
<h2>Descrierea functiilor</h2>

<ul>
<li><a href="#get_stock_by_bulk_id">get_stock_by_bulk_id.php</a></li>
<li><a href="#get_all_promos">get_all_promos.php</a></li>
<li><a href="#get_user_orders">get_user_orders.php</a></li>
<li><a href="#insert_order">insert_order.php</a></li>
<li><a href="#get_order_by_id">get_order_by_id.php</a></li>
<li><a href="#change_user_pass">change_user_pass.php</a></li>
<li><a href="#get_rate">get_rate.php</a></li>
<li><a href="#insert_user">insert_user.php</a></li>
<li><a href="#get_all_ids">get_all_ids.php</a></li>
<li><a href="#get_all_users_ids">get_all_users_ids.php</a></li>
<li><a href="#get_author_by_id">get_author_by_id.php</a></li>
<li><a href="#get_book_by_id">get_book_by_id.php</a></li>
<li><a href="#get_domain_by_id">get_domain_by_id.php</a></li>
<li><a href="#get_lang_by_id">get_lang_by_id.php</a></li>
<li><a href="#get_publisher_by_id">get_publisher_by_id.php</a></li>
<li><a href="#get_user_by_id">get_user_by_id.php</a></li>
<li><a href="#get_max_book_id">get_max_book_id.php</a></li>
<li><a href="#get_books_ids_by_range">get_books_ids_by_range.php</a></li>
</ul>

<a id="get_stock_by_bulk_id"></a><h4>Nume: get_stock_by_bulk_id.php</h4>
<pre>
Descriere: intoarce stocul actual pentru o lista de produse
Parametri: k, ids
ids = lista de coduri saga separate prin punct si virgula
</pre> 
URL exemplu: <a href="get_stock_by_bulk_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&ids=246620;246619;246618;246472;246414;246413;246412;246411">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.7    01.11.2014    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_all_promos"></a><h4>Nume: get_all_promos.php</h4>
<pre>
Descriere: toate promotiile active
Parametri: k
</pre> 
URL exemplu: <a href="get_all_promos.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.6    21.09.2014    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_user_orders"></a><h4>Nume: get_user_orders.php</h4>
<pre>
Descriere: comenzile unui utilizator
Parametri: k, id
</pre> 
URL exemplu: <a href="get_user_orders.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=13009">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.5    13.12.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="insert_order"></a><h4>Nume: insert_order.php</h4>
<pre>
Descriere: adauga o comanda
Parametri: k, xmlb64

xml64 este codarea in base64 a unui XML de forma:

&lt;insert_order>
    &lt;ORDER>
        &lt;PAYMENT>1&lt;/PAYMENT>
        &lt;TRANSPORT>1&lt;/TRANSPORT>
        &lt;TAX>0&lt;/TAX>
        &lt;USERID>2508&lt;/USERID>
        &lt;NUME_LIVRARE>Liviu Vasile&lt;/NUME_LIVRARE>
        &lt;EMAIL>contact@liviuvasile.com&lt;/EMAIL>
        &lt;TIP_USER>1&lt;/TIP_USER>
        &lt;ADRESA>36 rue de l'Hippodrome&lt;/ADRESA>
        &lt;ORAS>Luxembourg&lt;/ORAS>
        &lt;JUDETUL/>
        &lt;TARA>Luxembourg&lt;/TARA>
        &lt;COD_POSTAL>1736&lt;/COD_POSTAL>
        &lt;TELEFON>00352661207611&lt;/TELEFON>
        &lt;DETALII/>
        &lt;DETALII_FACTURARE>Trimiteti cartile ambalate individual&lt;/DETALII_FACTURARE>
    &lt;/ORDER>
    &lt;PRODUSE>
        &lt;PRODUS>
            &lt;COD_SAGA>59190&lt;/COD_SAGA>
            &lt;PRET_REDUS>9.16&lt;/PRET_REDUS>
            &lt;PRET>9.16&lt;/PRET>
            &lt;GESTIUNE>4&lt;/GESTIUNE>
            &lt;CANTITATE>2&lt;/CANTITATE>
        &lt;/PRODUS>
        &lt;PRODUS>
            &lt;COD_SAGA>57433&lt;/COD_SAGA>
            &lt;PRET_REDUS>8.20&lt;/PRET_REDUS>
            &lt;PRET>10.35&lt;/PRET>
            &lt;GESTIUNE>4&lt;/GESTIUNE>
            &lt;CANTITATE>1&lt;/CANTITATE>
        &lt;/PRODUS>
    &lt;/PRODUSE>
    &lt;INFO_VALUTAR>
        &lt;COD_VALUTA>1&lt;/COD_VALUTA>
        &lt;CURS_VALUTAR>4.2798&lt;/CURS_VALUTAR>
        &lt;TOTAL_PRODUSE>6.20&lt;/TOTAL_PRODUSE>
        &lt;TAXE>5&lt;/TAXE>
        &lt;TOTAL_COMANDA>11.20&lt;/TOTAL_COMANDA>
    &lt;/INFO_VALUTAR>
&lt;/insert_order>

Exemplu: base64_encode(urlencode($xml))

<u>Mesaje de eroare:</u>
ERROR: XML not well formed

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

ERROR: PRODUSE section is null
ERROR: PRODUS section is null
ERROR: COD_SAGA is null on product nr. X
ERROR: PRET_REDUS is null on product nr. X
ERROR: PRET is null on product nr. X
ERROR: GESTIUNE is null on product nr. X
ERROR: CANTITATE is null on product nr. X

ERROR: INFO_VALUTAR section is null
ERROR: COD_VALUTA not in accepted range ( 1 = EUR, 2 = USD, 3 = RON )
ERROR: COD_VALUTA is null
ERROR: CURS_VALUTAR is null
ERROR: TOTAL_PRODUSE is null
ERROR: TAXE is null
ERROR: TOTAL_COMANDA is null

ERROR: Database error at command 1 :err
ERROR: Database error at command 2 : err
ERROR: Database error at command 3 : err
</pre> 
URL exemplu: <a href="insert_order.php?k=001c8e4c375bf5336ddd37b97e7a0f25&xmlb64=
JTNDaW5zZXJ0X29yZGVyJTNFJTBEJTBBKysrKyUzQ09SREVSJTNFJTBEJTBBKysrKysrKyslM0NQQVlNRU5UJTNFMSUzQyUyRlBBWU1FTlQlM0UlMEQlMEErKysrKysrKyUzQ1RSQU5TUE9SVCUzRTElM0MlMkZUUkFOU1BPUlQlM0UlMEQlMEErKysrKysrKyUzQ1RBWCUzRTAlM0MlMkZUQVglM0UlMEQlMEErKysrKysrKyUzQ1VTRVJJRCUzRTI1MDglM0MlMkZVU0VSSUQlM0UlMEQlMEErKysrKysrKyUzQ05VTUVfTElWUkFSRSUzRUxpdml1K1Zhc2lsZSUzQyUyRk5VTUVfTElWUkFSRSUzRSUwRCUwQSsrKysrKysrJTNDRU1BSUwlM0Vjb250YWN0JTQwbGl2aXV2YXNpbGUuY29tJTNDJTJGRU1BSUwlM0UlMEQlMEErKysrKysrKyUzQ1RJUF9VU0VSJTNFMSUzQyUyRlRJUF9VU0VSJTNFJTBEJTBBKysrKysrKyslM0NBRFJFU0ElM0UzNitydWUrZGUrbCUyN0hpcHBvZHJvbWUlM0MlMkZBRFJFU0ElM0UlMEQlMEErKysrKysrKyUzQ09SQVMlM0VMdXhlbWJvdXJnJTNDJTJGT1JBUyUzRSUwRCUwQSsrKysrKysrJTNDSlVERVRVTCUyRiUzRSUwRCUwQSsrKysrKysrJTNDVEFSQSUzRUx1eGVtYm91cmclM0MlMkZUQVJBJTNFJTBEJTBBKysrKysrKyslM0NDT0RfUE9TVEFMJTNFMTczNiUzQyUyRkNPRF9QT1NUQUwlM0UlMEQlMEErKysrKysrKyUzQ1RFTEVGT04lM0UwMDM1MjY2MTIwNzYxMSUzQyUyRlRFTEVGT04lM0UlMEQlMEErKysrKysrKyUzQ0RFVEFMSUklMkYlM0UlMEQlMEErKysrKysrKyUzQ0RFVEFMSUlfRkFDVFVSQVJFJTNFVHJpbWl0ZXRpK2NhcnRpbGUrYW1iYWxhdGUraW5kaXZpZHVhbCUzQyUyRkRFVEFMSUlfRkFDVFVSQVJFJTNFJTBEJTBBKysrKyUzQyUyRk9SREVSJTNFJTBEJTBBKysrKyUzQ1BST0RVU0UlM0UlMEQlMEErKysrKysrKyUzQ1BST0RVUyUzRSUwRCUwQSsrKysrKysrKysrKyUzQ0NPRF9TQUdBJTNFNTkxOTAlM0MlMkZDT0RfU0FHQSUzRSUwRCUwQSsrKysrKysrKysrKyUzQ1BSRVRfUkVEVVMlM0U5LjE2JTNDJTJGUFJFVF9SRURVUyUzRSUwRCUwQSsrKysrKysrKysrKyUzQ1BSRVQlM0U5LjE2JTNDJTJGUFJFVCUzRSUwRCUwQSsrKysrKysrKysrKyUzQ0dFU1RJVU5FJTNFNCUzQyUyRkdFU1RJVU5FJTNFJTBEJTBBKysrKysrKysrKysrJTNDQ0FOVElUQVRFJTNFMiUzQyUyRkNBTlRJVEFURSUzRSUwRCUwQSsrKysrKysrJTNDJTJGUFJPRFVTJTNFJTBEJTBBKysrKysrKyslM0NQUk9EVVMlM0UlMEQlMEErKysrKysrKysrKyslM0NDT0RfU0FHQSUzRTU3NDMzJTNDJTJGQ09EX1NBR0ElM0UlMEQlMEErKysrKysrKysrKyslM0NQUkVUX1JFRFVTJTNFOC4yMCUzQyUyRlBSRVRfUkVEVVMlM0UlMEQlMEErKysrKysrKysrKyslM0NQUkVUJTNFMTAuMzUlM0MlMkZQUkVUJTNFJTBEJTBBKysrKysrKysrKysrJTNDR0VTVElVTkUlM0U0JTNDJTJGR0VTVElVTkUlM0UlMEQlMEErKysrKysrKysrKyslM0NDQU5USVRBVEUlM0UxJTNDJTJGQ0FOVElUQVRFJTNFJTBEJTBBKysrKysrKyslM0MlMkZQUk9EVVMlM0UlMEQlMEErKysrJTNDJTJGUFJPRFVTRSUzRSUwRCUwQSsrKyslM0NJTkZPX1ZBTFVUQVIlM0UlMEQlMEErKysrKysrKyUzQ0NPRF9WQUxVVEElM0UxJTNDJTJGQ09EX1ZBTFVUQSUzRSUwRCUwQSsrKysrKysrJTNDQklCTElPX0VVUiUzRTQuMjc5OCUzQyUyRkJJQkxJT19FVVIlM0UlMEQlMEErKysrKysrKyUzQ0JJQkxJT19VU0QlM0UyLjY5MTQlM0MlMkZCSUJMSU9fVVNEJTNFJTBEJTBBKysrKysrKyslM0NUT1RBTF9QUk9EVVNFJTNFNi4yMCUzQyUyRlRPVEFMX1BST0RVU0UlM0UlMEQlMEErKysrKysrKyUzQ1RBWEUlM0U1JTNDJTJGVEFYRSUzRSUwRCUwQSsrKysrKysrJTNDVE9UQUxfQ09NQU5EQSUzRTExLjIwJTNDJTJGVE9UQUxfQ09NQU5EQSUzRSUwRCUwQSsrKyslM0MlMkZJTkZPX1ZBTFVUQVIlM0UlMEQlMEElM0MlMkZpbnNlcnRfb3JkZXIlM0U=">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.9    19.07.2017    Modificari taguri pt comenzi prin card:
                         BIBLIO_EUR si BIBLIO_USD dispar, fiind inlocuite de CURS_VALUTAR
                         Functia este retrocompatibila (inca putem utiliza BIBLIO_EUR si BIBLIO_USD, dar fara CURS_VALUTAR)
                         ---
                         Nou mesaj de eroare: COD_VALUTA not in accepted range ( 1 = EUR, 2 = USD, 3 = RON )
                         --
    1.5    13.12.2013    Functia este compatibila Oracle 10g
    1.4    12.12.2013    Functia este compatibila PHP4
    1.3    09.12.2013    Functia este completa ( poate fi apelata )
    1.2    01.12.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="get_all_ids"></a><h4>Nume: get_all_ids.php</h4>
<pre>
Descriere: toate id-urile de carti 
ATENTIE: Functia returneaza toate cartile, indiferent de stocul lor. Fisierul generat poate fi mare.
        O carte este identificata unic prin cod_saga; din punctul de vedere al siteului,
        o carte ar trebui identificata unic prin ISBN. Unui ISBN pot corespunde mai multe coduri saga,
        pentru ca aceeasi carte poate intra in gestiune de mai multe ori, la preturi diferite.
        Site-ul ar trebui sa afiseze ceva de genul: 
            stoc = sum(stoc) where isbn=p_isbn
            pret = max(pret) where isbn=p_isbn and stoc>0
Parametri: k
</pre> 
URL exemplu: <a href="get_all_ids.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_order_by_id"></a><h4>Nume: get_order_by_id.php</h4>
<pre>
Descriere: detaliile unei comenzi
Parametri: k,id
</pre> 
URL exemplu: <a href="get_order_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=1171388416">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.3    09.12.2013    Functia get_order a fost mutata in functii.php
    1.2    30.11.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="change_user_pass"></a><h4>Nume: change_user_pass.php</h4>
<pre>
Descriere: schimba parola unui utilizator
Parametri: k,id,md5pass
</pre> 
URL exemplu: <a href="change_user_pass.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=51855&md5pass=3affd2965601843584333ca5a523680b">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.2    30.11.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="get_rate"></a><h4>Nume: get_rate.php</h4>
<pre>
Descriere: cursul valutar
Parametri: k
</pre> 
URL exemplu: <a href="get_rate.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.2    06.10.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="insert_user"></a><h4>Nume: insert_user.php</h4>
<pre>
Descriere: adauga un utilizator
Parametri: k, xmlb64

xml64 este codarea in base64 a unui XML de forma:

&lt;insert_user>
&lt;USERNAME>george.georgescu&lt;/USERNAME>
&lt;EMAIL>george.georgescu@gmail.com&lt;/EMAIL>
&lt;PASSWORD_MD5>001c8e4c375bf5336ddd37b97e7a0f25&lt;/PASSWORD_MD5>
&lt;LANGUAGE>RO&lt;/LANGUAGE>
&lt;/insert_user>

Exemplu: base64_encode(urlencode($xml))

<u>Mesaje de eroare:</u>
ERROR: XML not well formed
ERROR: username is null
ERROR: email is null
ERROR: password is null
ERROR: language is null or not in acceptable values
ERROR: username is already taken
ERROR: email is already taken
</pre> 
URL exemplu: <a href="insert_user.php?k=001c8e4c375bf5336ddd37b97e7a0f25&xmlb64=JTNDaW5zZXJ0X3VzZXIlM0UlMEQlMEElM0NVU0VSTkFNRSUzRWdlb3JnZS5nZW9yZ2VzY3UlM0MlMkZVU0VSTkFNRSUzRSUwRCUwQSUzQ0VNQUlMJTNFZ2VvcmdlLmdlb3JnZXNjdSU0MGdtYWlsLmNvbSUzQyUyRkVNQUlMJTNFJTBEJTBBJTNDUEFTU1dPUkRfTUQ1JTNFMDAxYzhlNGMzNzViZjUzMzZkZGQzN2I5N2U3YTBmMjUlM0MlMkZQQVNTV09SRF9NRDUlM0UlMEQlMEElM0NMQU5HVUFHRSUzRVJPJTNDJTJGTEFOR1VBR0UlM0UlMEQlMEElM0MlMkZpbnNlcnRfdXNlciUzRQ===">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.5    13.12.2013    Functia este compatibila Oracle 10g
    1.4    12.12.2013    Functia este compatibila PHP4
    1.2    28.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="get_all_ids"></a><h4>Nume: get_all_ids.php</h4>
<pre>
Descriere: toate id-urile de carti 
ATENTIE: Functia returneaza toate cartile, indiferent de stocul lor. Fisierul generat poate fi mare.
        O carte este identificata unic prin cod_saga; din punctul de vedere al siteului,
        o carte ar trebui identificata unic prin ISBN. Unui ISBN pot corespunde mai multe coduri saga,
        pentru ca aceeasi carte poate intra in gestiune de mai multe ori, la preturi diferite.
        Site-ul ar trebui sa afiseze ceva de genul: 
            stoc = sum(stoc) where isbn=p_isbn
            pret = max(pret) where isbn=p_isbn and stoc>0
Parametri: k
</pre> 
URL exemplu: <a href="get_all_ids.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_all_users_ids"></a><h4>Nume: get_all_users_ids.php</h4>
<pre>
Descriere: xml cu toate id-urile de utilizator
Parametri: k
</pre> 
URL exemplu: <a href="get_all_users_ids.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    15.09.2013    Fisierul a fost creat
	                     Am adaugat header text/xml UTF-8
-----------------------------------------------------------------*/
</pre>

<a id="get_author_by_id"></a><h4>Nume: get_author_by_id.php</h4>
<pre>
Descriere: detaliile unui autor ( cu parametrul id= ID_AUTOR1, 2 sau 3 din get_book_by_id )
Parametri: k, id
</pre> 
URL exemplu: <a href="get_author_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=737">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_book_by_id"></a><h4>Nume: get_book_by_id.php</h4>
<pre>
Descriere: detaliile unei carti ( cu parametrul id = COD_SAGA din get_all_ids )
ATENTIE: functia contine si imaginea cartilor codificata base64;
  pentru cartile relativ noi ( introduse in ultimii 3 ani ), imaginea va fi la rezolutie buna.
  pentru cartile mai vechi, imaginile vor fi destul de mici.
Parametri: k, id
</pre> 
URL exemplu: <a href="get_book_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=224237">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.8    06.02.2015    Am schimbat headerul la ISO-8859-1
    1.2    06.10.2013    Am adaugat pret_discount si gestiune
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
                         Am inlocuit xmlforest cu xmlconcat(xmlelement)
                            astfel toate campurile sunt prezente, 
                            chiar daca au valori nule
                         Am adaugat imaginea la fisierul generat (base64)
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_domain_by_id"></a><h4>Nume: get_domain_by_id.php</h4>
<pre>
Descriere: detaliile unei incadrari ( cu parametrul id= INCADRARE din get_book_by_id)
Parametri: k, id
</pre> 
URL exemplu: <a href="get_domain_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=48">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
                         Am inlocuit xmlforest cu xmlconcat(xmlelement)
                            astfel toate campurile sunt prezente, 
                            chiar daca au valori nule
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>


<a id="get_lang_by_id"></a><h4>Nume: get_lang_by_id.php</h4>
<pre>
Descriere: denumirea limbii in care e scrisa cartea ( cu parametrul id= ID_LIMBA din get_book_by_id )
Parametri: k, id
</pre> 
URL exemplu: <a href="get_lang_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=1">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.1    10.09.2013    Am adaugat header text/xml UTF-8
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_publisher_by_id"></a><h4>Nume: get_publisher_by_id.php</h4>
<pre>
Descriere: detaliile unei edituri ( cu parametrul id= ID_EDITURA din get_book_by_id )
Parametri: k, id
</pre> 
URL exemplu: <a href="get_publisher_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=165">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
	1.1    10.09.2013    Am adaugat header text/xml UTF-8
    1.0    29.08.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_user_by_id"></a><h4>Nume: get_user_by_id.php</h4>
<pre>
Descriere: detaliile unui utilizator ( cu parametrul id= USERID din get_all_users_ids )
Parametri: k, id
</pre> 
URL exemplu: <a href="get_user_by_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25&id=375">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.4    12.12.2013    Functia get_user a fost mutata in functii.php
    1.1    15.09.2013    Fisierul a fost creat
                         Am adaugat header text/xml UTF-8
-----------------------------------------------------------------*/
</pre>


<a id="get_max_book_id"></a><h4>Nume: get_max_book_id.php</h4>
<pre>
Descriere: id-ul maxim de carte ( SITE_ID )
Parametri: k
</pre> 
URL exemplu: <a href="get_max_book_id.php?k=001c8e4c375bf5336ddd37b97e7a0f25">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.8    06.02.2015    Functia nu mai retuneaza maximul de cod_saga, ci maximul de SITE_ID
    1.1    16.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>

<a id="get_books_ids_by_range"></a><h4>Nume: get_book_ids_by_range.php</h4>
<pre>
Descriere: returneaza operatiunile efectuate pe id-uri de carte (SITE_ID) dintr-un interval dat; functia returneaza si capetele intervalului
Parametri: k, min, max

Coduri de operatii folosite:
ADD    - cartea a fost adaugata
UPD    - cartea a fost modificata
TXTUPD - textul cartii (descrierea) a fost modificata
DEL    - cartea a fost stearsa (codul saga respectiv, nu tot ISBN-ul)
IMGDEL - imaginea cartii a fost stearsa
</pre> 
URL exemplu: <a href="get_book_ids_by_range.php?k=001c8e4c375bf5336ddd37b97e7a0f25&min=1&max=10">click</a>
<pre>
Versiune   Data          Modificare
====================================================================
    1.8    06.02.2015    Functia utilizeaza noul tabel site_export;
                         Parametrii min si max nu mai sunt coduri saga, ci coduri site_id
    1.1    16.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
</pre>
<pre>




























</pre>