<?php
/*-----------------------------------------------------------------
Versiune   Data          Modificare 
====================================================================
    1.1    15.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
if(!isset($_GET['k']) || ($_GET['k'] != MD5('Elisabeta16'))) die();

?>
<h2>Descrierea functiilor</h2>

Vezi <a href="descriere.php?k=001c8e4c375bf5336ddd37b97e7a0f25"/>aici</a>.

<h2>Versiunea 1.9</h2>
<pre>
==============================================================================
Data: 18.07.2017 - 20.07.2017
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    insert_order.php            1.9         k,xmlb64
==============================================================================
</pre>

<h2>Versiunea 1.8</h2>
<pre>
==============================================================================
Data: 06.02.2015
Timp: 1h30min 
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    get_max_book_id.php         1.8         k
    get_book_ids_by_range.php   1.8         k, min, max
    get_book_by_id.php          1.8         k, id
==============================================================================
</pre>


<h2>Versiunea 1.7</h2>
<pre>
==============================================================================
Data: 01.10.2014
Timp: 1h30min ( get_stock_by_bulk_id.php )
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere noi                    Versiune    Parametri
    get_stock_by_bulk_id.php      1.7         k,ids
==============================================================================
</pre>

<h2>Versiunea 1.6</h2>
<pre>
==============================================================================
Data: 21.09.2014
Timp: 0h30min ( get_all_promos.php )
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere noi                    Versiune    Parametri
    get_all_promos.php         1.6         k
==============================================================================
</pre>

<h2>Versiunea 1.5</h2>
<pre>
==============================================================================
Data: 13.12.2013
Timp: 2h00min ( xml_utils.pkg.sql )
      0h15min ( get_user_orders.php )
      0h00min ( insert_user.php )
      0h00min ( insert_order.php )
      0h15min ( instalare + teste )
      -------
      2h30min
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    insert_order.php            1.5         k,xmlb64
    insert_user.php             1.5         k,xmlb64
    xml_utils.pkg.sql           1.5         N/A
Fisiere noi:
    get_user_orders.php         1.5         k,id
==============================================================================
</pre>

<h2>Versiunea 1.4</h2>
<pre>
==============================================================================
Data: 10.12.2013, 11.12.2013, 12.12.2013
Timp: 3h00min ( insert_order.php, xml_utils.pkg.sql )
      1h00min ( insert_user.php,  xml_utils.pkg.sql )
      0h05min ( get_user_by_id.php )
      2h15min ( functii.php )
      0h15min ( documentatie )
      0h15min ( instalare + teste )
      -------
      6h50min
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    insert_order.php            1.4         k,xmlb64
    insert_user.php             1.4         k,xmlb64
    get_user_by_id.php          1.4         k,id
    functii.php                 1.4         N/A
Fisiere noi
    xml_utils.pkg.sql           1.4         N/A
==============================================================================
</pre>


<h2>Versiunea 1.3</h2>
<pre>
==============================================================================
Data: 09.12.2013
Timp: 4h00min ( insert_order.php )
      0h00min ( functii.php )
      0h00min ( get_order_by_id.php )
      0h15min ( documentatie )
      0h15min ( instalare + teste )
      -------
      4h30min
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    get_order_by_id.php         1.3         k,id
    insert_order.php            1.3         k,xmlb64
    functii.php                 1.3         N/A
==============================================================================
</pre>

<h2>Versiunea 1.2</h2>
<pre>
==============================================================================
Data: 28.09.2013, 15.10.2013, 06.10.2013, 30.11.2013
Timp: 1h30min ( insert_user.php )
      0h10min ( get_rate.php )
      0h15min ( get_book_by_id.php )
      0h15min ( documentatie )
      0h20min ( change_user_pass.php )
      1h25min ( get_order_by_id.php )
      0h40min ( insert_order.php )
      -------
      4h35min
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere noi                    Versiune    Parametri
    insert_user.php             1.2         k,xmlb64
    get_rate.php                1.2         k
    change_user_pass.php        1.2         k,id,b64pass
    get_order_by_id.php         1.2         k,id
    insert_order.php            1.2         k,xmlb64
Fisiere modificate             Versiune    Parametri
    get_book_by_id.php          1.2         k, id
==============================================================================
</pre>


<h2>Versiunea 1.1</h2>
<pre>
==============================================================================
Versiune: 1.1
Data: 10.09.2013, 15.09.2013, 16.09.2013
Timp:   30min ( header + UTF8)
      1h00min ( get_book_by_id.php )
        30min ( teste )
        20min ( get_all_user_ids, get_user_by_id + teste )
        20min ( about.php, descriere.php )
         5min ( get_stock_by_id.php )
         5min ( get_max_book_id.php )
      8h30min ( configurarea serverului de test, export DB & media, import, instalare + teste )
      --------
     11h20min
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Fisiere modificate             Versiune    Parametri
    get_all_ids.php             1.1         k
    get_author_by_id.php        1.1         k, id
    get_book_by_id.php          1.1         k, id
    get_domain_by_id.php        1.1         k, id
    get_lang_by_id.php          1.1         k, id
    get_publisher_by_id.php     1.1         k, id
Fisiere noi:
    get_all_users_ids.php       1.1         k
    get_user_by_id.php          1.1         k, id
    about.php                   1.1         k
    descriere.php               1.1         k
    get_stock_by_id.php         1.1         k, id
    get_max_book_id.php         1.1         k
    get_book_ids_by_range.php   1.1         k, min, max
==============================================================================
</pre>

<h2>Versiunea 1.0</h2>
<pre>
==============================================================================
Data: 29.08.2013
Timp: 5h
------------------------------------------------------------------------------
Descriere:
------------------------------------------------------------------------------
Scrierea functiilor de baza si testea lor.

Fisiere modificate             Versiune    Parametri
    definitii.php               1.0         N/A
    functii.php                 1.0         N/A
    get_all_ids.php             1.0         k
    get_author_by_id.php        1.0         k, id
    get_book_by_id.php          1.0         k, id
    get_domain_by_id.php        1.0         k, id
    get_lang_by_id.php          1.0         k, id
    get_publisher_by_id.php     1.0         k, id
==============================================================================
</pre>

<h2>Versiunea 0.1</h2>
<pre>
==============================================================================
Data:     28.08.2013
Timp:     8h
------------------------------------------------------------------------------
Descriere: 
------------------------------------------------------------------------------
- Instalarea unui server cu o baza de date Oracle
- Exportul bazei de date Bibliostar
- Importul bazei pe serverul de lucru
- Instalarea unui webserver cu php /mysql
==============================================================================
</pre>