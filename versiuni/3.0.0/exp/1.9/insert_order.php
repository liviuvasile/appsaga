<?php
/*-----------------------------------------------------------------
Versiune   Data          Modificare
====================================================================
    1.9    19.07.2017    Noi taguri in XML
    1.5    13.12.2013    Functia este compatibila Oracle 10g
    1.4    12.12.2013    Functia este compatibila PHP4
    1.3    09.12.2013    Functia este completa ( poate fi apelata din PHP5)
    1.2    28.09.2013    Fisierul a fost creat
-----------------------------------------------------------------*/
if(!isset($_GET['k']) || ($_GET['k'] != MD5('Elisabeta16'))) die();

if(!isset($_GET['xmlb64']) ){
	if( !isset($_POST['xmlb64'])) {
		die();
	}
}
//if(!isset($_GET['xmlb64'])) die();


define ( "VALID_SAGA" , "1" );
require_once("definitii.php");
require_once("functii.php");

$xmlb64 =  $_GET['xmlb64'];
if(isset($_POST['xmlb64'])){
	$xmlb64 =  $_POST['xmlb64'];
}
$xml=urldecode(base64_decode($xmlb64));

$cmdid = time();
list ($ret, $result ) = @ora_procedure("xml_utils.insert_order10g", "<PHP><ID>$cmdid</ID>$xml</PHP>");

if (substr($result,0,2)=='OK')
{
    $output = get_order(substr($result,2));
    }
else
    {
        $output = "<insert_order><status>$result</status></insert_order>";
    }

header("Content-type: text/xml"); //1.1
echo "<?xml version='1.0' encoding='UTF-8'?>"; //1.1
echo $output;

?>