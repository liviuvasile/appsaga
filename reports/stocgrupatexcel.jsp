<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="stocgrupatexcel" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="STOCGRUPATEXCEL" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforeReportHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
</head>
<body bgcolor="#ffffff">

]]>
    </beforeReportHtmlEscape>
    <afterPageHtmlEscape>
    <![CDATA[<hr size=5 noshade>
]]>
    </afterPageHtmlEscape>
    <beforeFormHtmlEscape>
    <![CDATA[<html dir=&Direction>
<body bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
]]>
    </beforeFormHtmlEscape>
    <pageNavigationHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
<TITLE>Oracle HTML Navigator</TITLE>
<SCRIPT type="text/javascript" LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" action="" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM>
</body></html>]]>
    </pageNavigationHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <userParameter name="P_USERID" datatype="character" width="40"
     defaultWidth="0" defaultHeight="0"/>
    <userParameter name="P_GESTIUNE" datatype="character" width="40"
     defaultWidth="0" defaultHeight="0"/>
    <dataSource name="Q_1">
      <select canParse="no">
      <![CDATA[select 
a.furnizor, b.denumire as nume_furnizor, to_number(to_char(a.data, 'YYYY')) as an,
a.tip, a.numar, a.data, 
a.cod_saga, a.gestiune, a.intrari, a.iesiri, a.stoc, upper(c.denumire) as produs, round(c.pretmagazin,2) as pretmagazin, round(c.pretunitar,2) as pretunitar, a.userid
from
(( raport_stoc a left join furnizor b on a.furnizor=b.codfiscal ) left join produs c on a.cod_saga=c.cod_saga)
where a.userid=:P_USERID and a.gestiune=:P_GESTIUNE
order by nume_furnizor, an, numar, produs]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_COD_SAGA">
        <displayInfo x="1.19421" y="1.94995" width="1.61169" height="1.62695"
        />
        <dataItem name="COD_SAGA" oracleDatatype="number" columnOrder="19"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Cod">
          <dataDescriptor expression="COD_SAGA"
           descriptiveExpression="COD_SAGA" order="7" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PRODUS" datatype="vchar2" columnOrder="24" width="100"
         defaultWidth="100000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Denumire">
          <dataDescriptor expression="PRODUS" descriptiveExpression="PRODUS"
           order="12" width="100"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PRETUNITAR" oracleDatatype="number" columnOrder="26"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Pret Unitar">
          <dataDescriptor expression="PRETUNITAR"
           descriptiveExpression="PRETUNITAR" order="14"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="PRETMAGAZIN" oracleDatatype="number" columnOrder="25"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Pret Magazin">
          <dataDescriptor expression="PRETMAGAZIN"
           descriptiveExpression="PRETMAGAZIN" order="13"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="INTRARI" oracleDatatype="number" columnOrder="21"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Intrari">
          <dataDescriptor expression="INTRARI" descriptiveExpression="INTRARI"
           order="9" oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="STOC" oracleDatatype="number" columnOrder="23"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Stoc">
          <dataDescriptor expression="STOC" descriptiveExpression="STOC"
           order="11" oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FURNIZOR" datatype="vchar2" columnOrder="13"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Furnizor">
          <dataDescriptor expression="FURNIZOR"
           descriptiveExpression="FURNIZOR" order="1" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="NUME_FURNIZOR" datatype="vchar2" columnOrder="14"
         width="50" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Nume Furnizor">
          <dataDescriptor expression="NUME_FURNIZOR"
           descriptiveExpression="NUME_FURNIZOR" order="2" width="50"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="AN" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="An">
          <dataDescriptor expression="AN" descriptiveExpression="AN" order="3"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TIP" datatype="vchar2" columnOrder="16" width="3"
         defaultWidth="30000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Tip">
          <dataDescriptor expression="TIP" descriptiveExpression="TIP"
           order="4" width="3"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="NUMAR" oracleDatatype="number" columnOrder="17"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Numar">
          <dataDescriptor expression="NUMAR" descriptiveExpression="NUMAR"
           order="5" oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DATA" datatype="date" oracleDatatype="date"
         columnOrder="18" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Data">
          <dataDescriptor expression="DATA" descriptiveExpression="DATA"
           order="6" oracleDatatype="date" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="GESTIUNE" oracleDatatype="number" columnOrder="20"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Gestiune">
          <dataDescriptor expression="GESTIUNE"
           descriptiveExpression="GESTIUNE" order="8" oracleDatatype="number"
           width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="IESIRI" oracleDatatype="number" columnOrder="22"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Iesiri">
          <dataDescriptor expression="IESIRI" descriptiveExpression="IESIRI"
           order="10" oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="USERID" oracleDatatype="number" columnOrder="27"
         width="22" defaultWidth="20000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Userid">
          <dataDescriptor expression="USERID" descriptiveExpression="USERID"
           order="15" oracleDatatype="number" width="22" scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_COD_SAGA_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="5.31250" height="0.37500"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"/>
      </frame>
      <repeatingFrame name="R_G_COD_SAGA" source="G_COD_SAGA"
       printDirection="down" minWidowRecords="1" columnMode="no">
        <geometryInfo x="0.00000" y="0.18750" width="7.50000" height="0.18750"
        />
        <generalLayout verticalElasticity="expand"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="TableCell"/>
        <field name="F_COD_SAGA" source="COD_SAGA" minWidowLines="1"
         spacing="0" alignment="start">
          <font face="helvetica" size="10"/>
          <geometryInfo x="0.00000" y="0.18750" width="1.00000"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
        <field name="F_PRODUS" source="PRODUS" minWidowLines="1" spacing="0"
         alignment="start">
          <font face="helvetica" size="10"/>
          <geometryInfo x="1.00000" y="0.18750" width="2.68750"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
        <field name="F_PRETUNITAR" source="PRETUNITAR" minWidowLines="1"
         formatMask="NNNNNNNN0.00" spacing="0" alignment="end">
          <font face="helvetica" size="10"/>
          <geometryInfo x="3.81250" y="0.18750" width="1.37500"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
        <field name="F_PRETMAGAZIN" source="PRETMAGAZIN" minWidowLines="1"
         formatMask="NNNNNNNN0.00" spacing="0" alignment="end">
          <font face="helvetica" size="10"/>
          <geometryInfo x="5.18750" y="0.18750" width="1.37500"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
        <field name="F_INTRARI" source="INTRARI" minWidowLines="1" spacing="0"
         alignment="end">
          <font face="helvetica" size="10"/>
          <geometryInfo x="6.56250" y="0.18750" width="0.43750"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
        <field name="F_STOC" source="STOC" minWidowLines="1" spacing="0"
         alignment="end">
          <font face="helvetica" size="10"/>
          <geometryInfo x="7.00000" y="0.18750" width="0.31250"
           height="0.18750"/>
          <generalLayout verticalElasticity="expand"/>
        </field>
      </repeatingFrame>
      <frame name="M_G_COD_SAGA_HDR">
        <geometryInfo x="0.00000" y="0.00000" width="7.50000" height="0.18750"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="TableHeading"/>
        <text name="B_COD_SAGA" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="0.00000" y="0.00000" width="1.00000"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="TableHeading"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Cod]]>
            </string>
          </textSegment>
        </text>
        <text name="B_PRODUS" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="1.00000" y="0.00000" width="2.68750"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="r25g50b75"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Denumire]]>
            </string>
          </textSegment>
        </text>
        <text name="B_PRETUNITAR" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="3.81250" y="0.00000" width="1.37500"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="TableHeading"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Pret Unitar]]>
            </string>
          </textSegment>
        </text>
        <text name="B_PRETMAGAZIN" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="5.18750" y="0.00000" width="1.37500"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="TableHeading"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Pret Magazin]]>
            </string>
          </textSegment>
        </text>
        <text name="B_INTRARI" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="6.56250" y="0.00000" width="0.43750"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="TableHeading"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Intrari]]>
            </string>
          </textSegment>
        </text>
        <text name="B_STOC" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="7.00000" y="0.00000" width="0.31250"
           height="0.18750"/>
          <visualSettings fillBackgroundColor="TableHeading"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <string>
            <![CDATA[Stoc]]>
            </string>
          </textSegment>
        </text>
      </frame>
    </body>
    <margin>
      <text name="B_OR$BODY_SECTION" minWidowLines="1">
        <textSettings spacing="0"/>
        <geometryInfo x="3.83313" y="0.25000" width="0.83374" height="0.16675"
        />
        <textSegment>
          <font face="Courier New" size="10"/>
          <string>
          <![CDATA[Stoc excel]]>
          </string>
        </textSegment>
      </text>
    </margin>
  </section>
  </layout>
  <colorPalette>
    <color index="190" displayName="TextColor" value="#ff0000"/>
    <color index="191" displayName="TableHeading" value="#999999"/>
    <color index="192" displayName="TableCell" value="#eaeaea"/>
    <color index="193" displayName="Totals" value="#d6d6d6"/>
  </colorPalette>
  <reportPrivate defaultReportType="tabular" versionFlags2="0"
   templateName="rwgray" sectionTitle="Stoc excel"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

<HEAD>
  <TITLE> Raport stoc </TITLE>
  <rw:style id="rwgray102">
<link rel="StyleSheet" type="text/css" href="css/rwgray.css">
</rw:style>

  <META http-equiv="Content-Type" content="application/vnd.ms-excel; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">
<rw:dataArea id="MGCODSAGAGRPFR100">
<table class="OraTable">
<caption> Stoc excel </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBCODSAGA100" asArray="no"/> class="OraColumnHeader"> Cod </th>
   <th <rw:id id="HBPRODUS100" asArray="no"/> class="OraColumnHeader"> Denumire </th>
   <th <rw:id id="HBPRETUNITAR100" asArray="no"/> class="OraColumnHeader"> Pret Unitar </th>
   <th <rw:id id="HBPRETMAGAZIN100" asArray="no"/> class="OraColumnHeader"> Pret Magazin </th>
   <th <rw:id id="HBINTRARI100" asArray="no"/> class="OraColumnHeader"> Intrari </th>
   <th <rw:id id="HBSTOC100" asArray="no"/> class="OraColumnHeader"> Stoc </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RGCODSAGA1001" src="G_COD_SAGA">
   <tr>
    <td <rw:headers id="HFCODSAGA100" src="HBCODSAGA100"/> class="OraCellNumber"><rw:field id="FCODSAGA100" src="COD_SAGA" nullValue="&nbsp;"> F_COD_SAGA </rw:field></td>
    <td <rw:headers id="HFPRODUS100" src="HBPRODUS100"/> class="OraCellText"><rw:field id="FPRODUS100" src="PRODUS" nullValue="&nbsp;"> F_PRODUS </rw:field></td>
    <td <rw:headers id="HFPRETUNITAR100" src="HBPRETUNITAR100"/> class="OraCellNumber"><rw:field id="FPRETUNITAR100" src="PRETUNITAR" nullValue="&nbsp;"> F_PRETUNITAR </rw:field></td>
    <td <rw:headers id="HFPRETMAGAZIN100" src="HBPRETMAGAZIN100"/> class="OraCellNumber"><rw:field id="FPRETMAGAZIN100" src="PRETMAGAZIN" nullValue="&nbsp;"> F_PRETMAGAZIN </rw:field></td>
    <td <rw:headers id="HFINTRARI100" src="HBINTRARI100"/> class="OraCellNumber"><rw:field id="FINTRARI100" src="INTRARI" nullValue="&nbsp;"> F_INTRARI </rw:field></td>
    <td <rw:headers id="HFSTOC100" src="HBSTOC100"/> class="OraCellNumber"><rw:field id="FSTOC100" src="STOC" nullValue="&nbsp;"> F_STOC </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
</table>
</rw:dataArea> <!-- id="MGCODSAGAGRPFR100" -->
<!-- End of Data Area Generated by Reports Developer -->
      </DIV>
    </TD>
  </TR>
</TABLE>

<P>
  <BR>
</P>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ff0000" colSpan=2 class="OraColumnHeader"><IMG alt="" border=0 height=4 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ffffff">&nbsp;</TD>
    <TD align=right bgColor="#ffffff">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>

</HTML>

<!--
</rw:report>
-->
