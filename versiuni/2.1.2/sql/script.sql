CREATE TABLE PROMOTII_BULK 
(
 ISBN              VARCHAR2(15)  
,COD_SAGA          NUMBER        
,PRET              NUMBER        
,PRET_INITIAL      NUMBER        
,TITLU             VARCHAR2(250) 
,STOC              NUMBER
,USER_ID           NUMBER
,SELECTED          NUMBER
)
/



CREATE TABLE SAGA_LOG 
   (ID       NUMBER
   ,LOG_TEXT CLOB   
   )
/
  
CREATE OR REPLACE PROCEDURE SagaLog (p_text IN CLOB) IS
PRAGMA AUTONOMOUS_TRANSACTION;
n NUMBER;
BEGIN
 SELECT NVL(MAX(id),0)+1 INTO n FROM SAGA_LOG;
 
 INSERT INTO SAGA_LOG
 VALUES
 (n, p_text);
--
 COMMIT;
END SagaLog;
/