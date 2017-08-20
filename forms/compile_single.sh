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
frmcmp userid=saga/Ora911122@saga module=promotii.fmb
