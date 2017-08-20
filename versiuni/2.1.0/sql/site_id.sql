DROP TABLE site_export
/

CREATE TABLE site_export
(
    SITE_ID     NUMBER,
    COD_SAGA    NUMBER,
    OPERATIE    VARCHAR2(6),
    ISBN        VARCHAR2(15),
    CREATED     DATE
    )
/

ALTER TABLE site_export ADD CONSTRAINT site_export_pk PRIMARY KEY ( SITE_ID )
/

CREATE INDEX site_export_cod_saga_idx ON site_export ( COD_SAGA)
/

DROP SEQUENCE site_export_seq
/

CREATE SEQUENCE site_export_seq START WITH 1 INCREMENT BY 1 ORDER NOCYCLE NOCACHE
/

CREATE OR REPLACE TRIGGER site_export_bir
 BEFORE INSERT
 ON site_export
 FOR EACH ROW
BEGIN
   :new.created := sysdate();
  IF :new.site_id IS NULL THEN       
    SELECT site_export_seq.NEXTVAL into :NEW.site_id from   dual;  
  END IF;
END;
/
