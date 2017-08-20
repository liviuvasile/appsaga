clear
export ORACLE_HOME=/home/oracle/ias
LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/opmn/lib:$ORACLE_HOME/dcm/lib:$ORACLE_HOME/jre/1.4.2/lib/i386/server/:$ORACLE_HOME/jdk/jre/lib/i386/native_threads/:$HOME/appsaga/java
PATH=/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/home/oracle/bin:$ORACLE_HOME/bin:$ORACLE_HOME/opmn/bin:$ORACLE_HOME/dcm/bin:/home/oracle/ias/bin
CLASSPATH=$CLASSPATH:$HOME/appsaga/java
#FORMS_PATH=/home/oracle/appsaga/forms
#CLASSPATH=/home/oracle/ias/j2ee/OC4J_BI_Forms/applications/formsapp/formsweb/WEB-INF/lib/frmsrv.jar:/home/oracle/ias/jlib/repository.jar:/home/oracle/ias/jlib/ldapjclnt10.jar:/home/oracle/ias/jlib/debugger.jar:/home/oracle/ias/jlib/ewt3.jar:/home/oracle/ias/jlib/share.jar:/home/oracle/ias/jlib/utj.jar:/home/oracle/ias/jlib/zrclient.jar:/home/oracle/ias/reports/jlib/rwrun.jar:/home/oracle/ias/forms/java/frmwebutil.jar
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/oracle/ias/lib:/home/oracle/ias/jdk/jre/lib/i386:/home/oracle/ias/jdk/jre/lib/i386/server:/home/oracle/ias/jdk/jre/lib/i386/native_threads:/tmp/OraInstall2008-08-23_11-22-11AM/jre/1.4.2/lib/i386/client:/tmp/OraInstall2008-08-23_11-22-11AM/jre/1.4.2/lib/i386:/tmp/OraInstall2008-08-23_11-22-11AM/jre/1.4.2/../lib/i386:/usr/lib
#ORACLE_HOME=/home/oracle/ias

export TNS_ADMIN=/home/oracle/infra/network/admin
export TERM=xterm
#export DISPLAY="10.0.0.5:0.0"
export DISPLAY=":1.0"
#rm /home/oracle/appsaga/forms/*.fmx
#rm /home/oracle/appsaga/forms/*.plx
#frmcmp userid=saga/Ora911122@saga module=appsaga.fmb
#frmcmp userid=saga/Ora911122@saga module=useradmin.fmb
#frmcmp userid=saga/Ora911122@saga module=skeleton.fmb
#frmcmp userid=saga/Ora911122@saga module=password.fmb
#frmcmp userid=saga/Ora911122@saga module=autor.fmb
#frmcmp userid=saga/Ora911122@saga module=fileupload.pll module_type=library
#frmcmp userid=saga/Ora911122@saga module=editura.fmb
frmcmp userid=saga/Ora911122@saga module=produs.fmb
#frmcmp userid=saga/Ora911122@saga module=intrari.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_intrari.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_g1.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_g4.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_g5.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_g2.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_g3.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc.fmb
#frmcmp userid=saga/Ora911122@saga module=parametri.fmb
frmcmp userid=saga/Ora911122@saga module=vanzare1.fmb
frmcmp userid=saga/Ora911122@saga module=vanzare4.fmb
frmcmp userid=saga/Ora911122@saga module=vanzare5.fmb
#frmcmp userid=saga/Ora911122@saga module=factura.fmb
#frmcmp userid=saga/Ora911122@saga module=siteusers.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_retur.fmb
#frmcmp userid=saga/Ora911122@saga module=furnizor.fmb
#frmcmp userid=saga/Ora911122@saga module=retur.fmb
#frmcmp userid=saga/Ora911122@saga module=lista_intrari.fmb
#frmcmp userid=saga/Ora911122@saga module=lista_retururi.fmb
#frmcmp userid=saga/Ora911122@saga module=etichete.fmb
#frmcmp userid=saga/Ora911122@saga module=fisa_magazie.fmb
#frmcmp userid=saga/Ora911122@saga module=fisa_furnizor.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzi.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzig1.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzig4.fmb
#frmcmp userid=saga/Ora911122@saga module=zlocal.fmb
#frmcmp userid=saga/Ora911122@saga module=zerror.fmb
#frmcmp userid=saga/Ora911122@saga module=npl.fmb
#frmcmp userid=saga/Ora911122@saga module=npltermen.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_npl.fmb
#frmcmp userid=saga/Ora911122@saga module=mandate.fmb
#frmcmp userid=saga/Ora911122@saga module=achitare.fmb
#frmcmp userid=saga/Ora911122@saga module=card1.fmb
#frmcmp userid=saga/Ora911122@saga module=card4.fmb
#frmcmp userid=saga/Ora911122@saga module=modificare.fmb
#frmcmp userid=saga/Ora911122@saga module=cautare.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzi2.fmb
#frmcmp userid=saga/Ora911122@saga module=vanzare4debug.fmb
#frmcmp userid=saga/Ora911122@saga module=stocmanual.fmb
#frmcmp userid=saga/Ora911122@saga module=recalcularestoc.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_max.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_stoc_anterior.fmb
#frmcmp userid=saga/Ora911122@saga module=incadrari.fmb
#frmcmp userid=saga/Ora911122@saga module=carduri.fmb
#frmcmp userid=saga/Ora911122@saga module=newsletter.fmb
frmcmp userid=saga/Ora911122@saga module=platainplus.fmb
frmcmp userid=saga/Ora911122@saga module=stoccp.fmb
frmcmp userid=saga/Ora911122@saga module=inventar1.fmb
frmcmp userid=saga/Ora911122@saga module=arhivainventar.fmb
frmcmp userid=saga/Ora911122@saga module=inventar4.fmb
frmcmp userid=saga/Ora911122@saga module=inventar5.fmb
#frmcmp userid=saga/Ora911122@saga module=anunturi.fmb
#frmcmp userid=saga/Ora911122@saga module=raport_reduceri.fmb
#frmcmp userid=saga/Ora911122@saga module=curs_valutar.fmb
#frmcmp userid=saga/Ora911122@saga module=corectari.fmb
#frmcmp userid=saga/Ora911122@saga module=comanda_noua.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzi_lucru.fmb
#frmcmp userid=saga/Ora911122@saga module=comanda_raport.fmb
#frmcmp userid=saga/Ora911122@saga module=recomandari.fmb
#frmcmp userid=saga/Ora911122@saga module=grafice.fmb
#frmcmp userid=saga/Ora911122@saga module=produs2.fmb
#frmcmp userid=saga/Ora911122@saga module=statistici.fmb
#frmcmp userid=saga/Ora911122@saga module=recenzie.fmb
#frmcmp userid=saga/Ora911122@saga module=info.fmb
#frmcmp userid=saga/Ora911122@saga module=etichete2.fmb
frmcmp userid=saga/Ora911122@saga module=geninventar.fmb
frmcmp userid=saga/Ora911122@saga module=introinventar.fmb
#frmcmp userid=saga/Ora911122@saga module=d394.fmb
#frmcmp userid=saga/Ora911122@saga module=promotii.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_adauga.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_comenzi.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_stoc.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_urgente.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_vanzari.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_z.fmb
#frmcmp userid=saga/Ora911122@saga module=ll_arhiva_facturi.fmb
frmcmp userid=saga/Ora911122@saga module=vanzare23.fmb
#frmcmp userid=saga/Ora911122@saga module=comenzig2.fmb
frmcmp userid=saga/Ora911122@saga module=inventar2.fmb
frmcmp userid=saga/Ora911122@saga module=inventar3.fmb
