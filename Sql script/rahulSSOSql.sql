--------------------------------------------------------
--  File created - Monday-October-24-2011   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RAHUL_GROUP_RESOURCE
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" 
   (	"GROUP_ID" VARCHAR2(25 CHAR), 
	"R_ID" NUMBER(5,0), 
	"READ" CHAR(1 CHAR), 
	"READ_WRITE" CHAR(1 CHAR), 
	"EXECUTE" CHAR(1 CHAR), 
	"MOD" CHAR(1 CHAR)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_GROUP_RESOURCES
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_GROUP_RESOURCES" 
   (	"GROUP_NAME" VARCHAR2(20 BYTE), 
	"RES_ID" NUMBER, 
	"READ" VARCHAR2(1 BYTE), 
	"WRITE" VARCHAR2(1 BYTE), 
	"EXECUTE" VARCHAR2(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_GROUPS
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_GROUPS" 
   (	"GROUP_NAME" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_GROUPUSERS
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_GROUPUSERS" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"GROUP_NAME" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_RESOURCES
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_RESOURCES" 
   (	"RES_ID" NUMBER, 
	"RES_NAME" VARCHAR2(20 BYTE), 
	"PATH" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_USER
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_USER" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"COMMON_NAME" VARCHAR2(20 BYTE), 
	"SUR_NAME" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Table RAHUL_USER_RESOURCE
--------------------------------------------------------

  CREATE TABLE "MARKDEV"."RAHUL_USER_RESOURCE" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"RES_ID" NUMBER, 
	"READ" VARCHAR2(1 BYTE), 
	"WRITE" VARCHAR2(1 BYTE), 
	"EXECUTE" VARCHAR2(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index PSP21
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."PSP21" ON "MARKDEV"."RAHUL_GROUP_RESOURCE" ("GROUP_ID", "R_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index RAHUL_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."RAHUL_GROUPS_PK" ON "MARKDEV"."RAHUL_GROUPS" ("GROUP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index RAHUL_GROUPUSERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."RAHUL_GROUPUSERS_PK" ON "MARKDEV"."RAHUL_GROUPUSERS" ("USER_ID", "GROUP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index RAHUL_RESOURCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."RAHUL_RESOURCES_PK" ON "MARKDEV"."RAHUL_RESOURCES" ("RES_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index RAHUL_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."RAHUL_USER_PK" ON "MARKDEV"."RAHUL_USER" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  DDL for Index RAHUL_USER_RESOURCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKDEV"."RAHUL_USER_RESOURCE_PK" ON "MARKDEV"."RAHUL_USER_RESOURCE" ("USER_ID", "RES_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA" ;
--------------------------------------------------------
--  Constraints for Table RAHUL_GROUP_RESOURCE
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD CONSTRAINT "PSP21" PRIMARY KEY ("GROUP_ID", "R_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD CHECK (read in('y','n')) ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD CHECK (read_write in('y','n')) ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD CHECK (execute in('y','n')) ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD CHECK (mod in('y','n')) ENABLE;
--------------------------------------------------------
--  Constraints for Table RAHUL_GROUP_RESOURCES
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCES" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCES" MODIFY ("RES_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAHUL_GROUPS
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUPS" ADD CONSTRAINT "RAHUL_GROUPS_PK" PRIMARY KEY ("GROUP_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUPS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAHUL_GROUPUSERS
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUPUSERS" ADD CONSTRAINT "RAHUL_GROUPUSERS_PK" PRIMARY KEY ("USER_ID", "GROUP_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUPUSERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUPUSERS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAHUL_RESOURCES
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_RESOURCES" ADD CONSTRAINT "RAHUL_RESOURCES_PK" PRIMARY KEY ("RES_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_RESOURCES" MODIFY ("RES_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_RESOURCES" MODIFY ("RES_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_RESOURCES" MODIFY ("PATH" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAHUL_USER
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_USER" ADD CONSTRAINT "RAHUL_USER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_USER" MODIFY ("COMMON_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_USER" MODIFY ("SUR_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RAHUL_USER_RESOURCE
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_USER_RESOURCE" ADD CONSTRAINT "RAHUL_USER_RESOURCE_PK" PRIMARY KEY ("USER_ID", "RES_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SLMDATA"  ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_USER_RESOURCE" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MARKDEV"."RAHUL_USER_RESOURCE" MODIFY ("RES_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table RAHUL_GROUP_RESOURCE
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD FOREIGN KEY ("GROUP_ID")
	  REFERENCES "MARKDEV"."PIYUSH_GROUP" ("GROUP_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCE" ADD FOREIGN KEY ("R_ID")
	  REFERENCES "MARKDEV"."PIYUSH_RESOURCE" ("R_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RAHUL_GROUP_RESOURCES
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCES" ADD CONSTRAINT "RAHUL_GROUP_RESOURCES_K_FK1" FOREIGN KEY ("GROUP_NAME")
	  REFERENCES "MARKDEV"."RAHUL_GROUPS" ("GROUP_NAME") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUP_RESOURCES" ADD CONSTRAINT "RAHUL_GROUP_RESOURCES_K_FK2" FOREIGN KEY ("RES_ID")
	  REFERENCES "MARKDEV"."RAHUL_RESOURCES" ("RES_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RAHUL_GROUPUSERS
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_GROUPUSERS" ADD CONSTRAINT "RAHUL_GROUPUSERS_KISHOR_FK1" FOREIGN KEY ("GROUP_NAME")
	  REFERENCES "MARKDEV"."RAHUL_GROUPS" ("GROUP_NAME") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_GROUPUSERS" ADD CONSTRAINT "RAHUL_GROUPUSERS_KISHOR_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "MARKDEV"."RAHUL_USER" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RAHUL_USER_RESOURCE
--------------------------------------------------------

  ALTER TABLE "MARKDEV"."RAHUL_USER_RESOURCE" ADD CONSTRAINT "RAHUL_USER_RESOURCE_KIS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "MARKDEV"."RAHUL_USER" ("USER_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MARKDEV"."RAHUL_USER_RESOURCE" ADD CONSTRAINT "RAHUL_USER_RESOURCE_KIS_FK2" FOREIGN KEY ("RES_ID")
	  REFERENCES "MARKDEV"."RAHUL_RESOURCES" ("RES_ID") ON DELETE CASCADE ENABLE;