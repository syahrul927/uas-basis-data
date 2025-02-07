--------------------------------------------------------
--  File created - Monday-January-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence INVOICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VIGNETTE"."INVOICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JENISSEPEDA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "VIGNETTE"."JENISSEPEDA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table JENISSEPEDA
--------------------------------------------------------

  CREATE TABLE "VIGNETTE"."JENISSEPEDA" 
   (	"JENISID" NUMBER(*,0), 
	"NAMAJENIS" VARCHAR2(20 BYTE), 
	"DESKRIPSI" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SEPEDA
--------------------------------------------------------

  CREATE TABLE "VIGNETTE"."SEPEDA" 
   (	"SEPEDAID" VARCHAR2(100 BYTE), 
	"JENISID" NUMBER(*,0), 
	"NAMASEPEDA" VARCHAR2(30 BYTE), 
	"ISACTIVE" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TB_USER
--------------------------------------------------------

  CREATE TABLE "VIGNETTE"."TB_USER" 
   (	"USERID" VARCHAR2(200 BYTE), 
	"NAMA" VARCHAR2(30 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"ISACTIVE" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TRANSACTION
--------------------------------------------------------

  CREATE TABLE "VIGNETTE"."TRANSACTION" 
   (	"TRANSACTIONID" VARCHAR2(30 BYTE), 
	"USERID" VARCHAR2(200 BYTE), 
	"SEPEDAID" VARCHAR2(100 BYTE), 
	"STARTEDDATE" TIMESTAMP (6), 
	"ENDDATE" TIMESTAMP (6), 
	"STATUS" NUMBER(*,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for View SEPEDAACTIVE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "VIGNETTE"."SEPEDAACTIVE" ("NAMASEPEDA", "SEPEDAID", "NAMAJENIS") AS 
  SELECT s.namasepeda, s.sepedaid, j.namajenis FROM SEPEDA s right join JENISSEPEDA j on s.jenisid = j.jenisid where ISACTIVE = 1
;
REM INSERTING into VIGNETTE.JENISSEPEDA
SET DEFINE OFF;
Insert into VIGNETTE.JENISSEPEDA (JENISID,NAMAJENIS,DESKRIPSI) values ('1','MTB','MOUNTAIN BIKE IS THE BEST');
REM INSERTING into VIGNETTE.SEPEDA
SET DEFINE OFF;
Insert into VIGNETTE.SEPEDA (SEPEDAID,JENISID,NAMASEPEDA,ISACTIVE) values ('37567B2249AC407CA3E4E26FA26BCE3F','1','Flame Cycle','1');
REM INSERTING into VIGNETTE.TB_USER
SET DEFINE OFF;
Insert into VIGNETTE.TB_USER (USERID,NAMA,PHONE,PASSWORD,ISACTIVE) values ('syahrul927','Syahrul Ataufik','0895333302590','syahrul927','0');
REM INSERTING into VIGNETTE.TRANSACTION
SET DEFINE OFF;
Insert into VIGNETTE.TRANSACTION (TRANSACTIONID,USERID,SEPEDAID,STARTEDDATE,ENDDATE,STATUS) values ('INV/20201301/I/0000000013','syahrul927','37567B2249AC407CA3E4E26FA26BCE3F',to_timestamp('13-01-2020 12.51.44,000000000','DD-MM-RRRR HH24.MI.SSXFF'),to_timestamp('13-01-2020 01.40.04,000000000','DD-MM-RRRR HH24.MI.SSXFF'),'0');
--------------------------------------------------------
--  DDL for Index TRANSAKSI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VIGNETTE"."TRANSAKSI_PK" ON "VIGNETTE"."TRANSACTION" ("TRANSACTIONID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SEPEDA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VIGNETTE"."SEPEDA_PK" ON "VIGNETTE"."SEPEDA" ("SEPEDAID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VIGNETTE"."CUSTOMER_PK" ON "VIGNETTE"."TB_USER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index JENISSEPEDA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VIGNETTE"."JENISSEPEDA_PK" ON "VIGNETTE"."JENISSEPEDA" ("JENISID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger INVOICE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VIGNETTE"."INVOICE_TRG" 
BEFORE INSERT ON TRANSACTION
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
 IF INSERTING THEN
      SELECT CREATE_INVOICE() INTO :NEW.TRANSACTIONID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "VIGNETTE"."INVOICE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JENISSEPEDA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VIGNETTE"."JENISSEPEDA_TRG" 
BEFORE INSERT ON JENISSEPEDA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.JENISID IS NULL THEN
      SELECT JENISSEPEDA_SEQ.NEXTVAL INTO :NEW.JENISID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "VIGNETTE"."JENISSEPEDA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEPEDA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "VIGNETTE"."SEPEDA_TRG" 
BEFORE INSERT ON SEPEDA
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
 IF INSERTING THEN
      SELECT SYS_GUID() INTO :NEW.SEPEDAID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "VIGNETTE"."SEPEDA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Function CREATE_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "VIGNETTE"."CREATE_INVOICE" 
RETURN VARCHAR2
IS
Invoice varchar(30);
seq int;
BEGIN
Select invoice_seq.nextval into seq from sys.dual;
Select 'INV/'||(SELECT TO_CHAR(CURRENT_DATE,  'yyyyddmm') from sys.dual)||'/'||generateRomawi((SELECT TO_CHAR(CURRENT_DATE, 'MM') from sys.dual))||'/'||LPAD(seq, 10, '0')  into Invoice from sys.dual;
Return replace(Invoice, ' ', '');
End create_invoice;

/
--------------------------------------------------------
--  DDL for Function GENERATEROMAWI
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "VIGNETTE"."GENERATEROMAWI" (m IN INT)
RETURN char
Is 
romawi char(4);
BEGIN 
CASE 
When m = 1 OR m =01
then romawi := 'I';
When  m = 2 OR  m = 02
then romawi := 'II' ;
When  m = 3 OR  m = 03
then romawi := 'III' ;
When  m = 4 OR  m = 04
then romawi := 'IV' ;
When m =  5  OR m =  05
then romawi := 'V' ;
When  m = 6 OR  m = 06
then romawi := 'VI' ;
When  m = 7  OR m =  07
then romawi := 'VII' ;
When  m = 8  OR m =  08
then romawi := 'VIII' ;
When  m = 9  OR  m = 09
then romawi := 'IX' ;
When m =  10 
then romawi := 'X' ;

When  m = 11 
then romawi := 'XI' ;

When m =  12 
then romawi := 'XII' ;

ELSE  romawi := 'NULL'; 

END CASE ;
RETURN romawi;
END generateRomawi;

/
--------------------------------------------------------
--  Constraints for Table SEPEDA
--------------------------------------------------------

  ALTER TABLE "VIGNETTE"."SEPEDA" ADD CONSTRAINT "SEPEDA_PK" PRIMARY KEY ("SEPEDAID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "VIGNETTE"."SEPEDA" MODIFY ("ISACTIVE" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."SEPEDA" MODIFY ("NAMASEPEDA" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."SEPEDA" MODIFY ("JENISID" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."SEPEDA" MODIFY ("SEPEDAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "VIGNETTE"."TRANSACTION" ADD CONSTRAINT "TRANSAKSI_PK" PRIMARY KEY ("TRANSACTIONID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "VIGNETTE"."TRANSACTION" MODIFY ("STARTEDDATE" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TRANSACTION" MODIFY ("SEPEDAID" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TRANSACTION" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TRANSACTION" MODIFY ("TRANSACTIONID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TB_USER
--------------------------------------------------------

  ALTER TABLE "VIGNETTE"."TB_USER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "VIGNETTE"."TB_USER" MODIFY ("ISACTIVE" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TB_USER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TB_USER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TB_USER" MODIFY ("NAMA" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."TB_USER" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JENISSEPEDA
--------------------------------------------------------

  ALTER TABLE "VIGNETTE"."JENISSEPEDA" ADD CONSTRAINT "JENISSEPEDA_PK" PRIMARY KEY ("JENISID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "VIGNETTE"."JENISSEPEDA" MODIFY ("NAMAJENIS" NOT NULL ENABLE);
  ALTER TABLE "VIGNETTE"."JENISSEPEDA" MODIFY ("JENISID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "VIGNETTE"."TRANSACTION" ADD CONSTRAINT "FK_SEPEDAID" FOREIGN KEY ("SEPEDAID")
	  REFERENCES "VIGNETTE"."SEPEDA" ("SEPEDAID") ENABLE;
  ALTER TABLE "VIGNETTE"."TRANSACTION" ADD CONSTRAINT "FK_USERID" FOREIGN KEY ("USERID")
	  REFERENCES "VIGNETTE"."TB_USER" ("USERID") ENABLE;
