--------------------------typed tables-----------------
---------example 1
    CREATE TYPE ANALYZER_GOSALES_HR.A_Person_t AS 
      (Name VARCHAR(20), 
      Age INT)
      INSTANTIABLE
      REF USING VARCHAR(13) FOR BIT DATA
      MODE DB2SQL;

CREATE TABLE ANALYZER_GOSALES_HR.A_Person OF ANALYZER_GOSALES_HR.A_Person_t
      (REF IS Oid USER GENERATED);

--------------EXAMPLE 2
----PERSON TYPE
 CREATE TYPE "ANALYZER_GOSALES_HR"."A_PERSON_TYPE" AS 
      (Name VARCHAR(20), 
       Address VARCHAR(225),
      Age INT
      )
      INSTANTIABLE
      REF USING VARCHAR(13) FOR BIT DATA
      MODE DB2SQL;

CREATE TABLE "ANALYZER_GOSALES_HR"."A_PERSONDATA" OF "ANALYZER_GOSALES_HR"."A_PERSON_TYPE"
      (REF IS Oid USER GENERATED);

------EMPLOYEE TYPE
 CREATE TYPE "ANALYZER_GOSALES_HR"."A_EMPLOYEE_T" UNDER "ANALYZER_GOSALES_HR"."A_PERSON_TYPE" AS 
      (Dept VARCHAR(20), 
       Salary BIGINT,
       SerialNum INT
      )
      INSTANTIABLE
      MODE DB2SQL;
      
CREATE TABLE "ANALYZER_GOSALES_HR"."A_EMP1" OF "ANALYZER_GOSALES_HR"."A_EMPLOYEE_T"
      (REF IS Oid USER GENERATED);
 

CREATE TABLE "ANALYZER_GOSALES_HR"."A_EMPLOYEE_DATA" OF "ANALYZER_GOSALES_HR"."A_EMPLOYEE_T" UNDER "ANALYZER_GOSALES_HR"."A_PERSONDATA"
      INHERIT SELECT PRIVILEGES
      (SerialNum WITH OPTIONS NOT NULL
       );

----------student type
CREATE TYPE "ANALYZER_GOSALES_HR"."A_STUDENT_T" UNDER "ANALYZER_GOSALES_HR"."A_PERSON_TYPE" AS
      (GPA VARCHAR(20), 
       SerialNum INT
       
      )
      INSTANTIABLE
      MODE DB2SQL;

CREATE TABLE "ANALYZER_GOSALES_HR"."A_Student" OF "ANALYZER_GOSALES_HR"."A_STUDENT_T" UNDER "ANALYZER_GOSALES_HR"."A_PERSONDATA"
      INHERIT SELECT PRIVILEGES
      (
      CONSTRAINT check_job
      CHECK (GPA < 6)
      );

------------MANAGER TYPE 
 CREATE TYPE "ANALYZER_GOSALES_HR"."A_MANAGER_USER_TYPE" UNDER "ANALYZER_GOSALES_HR"."A_EMPLOYEE_T"  AS 
      (BONUS BIGINT,
       ID VARCHAR(15)
      )
      INSTANTIABLE
      MODE DB2SQL;

CREATE TABLE "ANALYZER_GOSALES_HR"."A_Manager" OF "ANALYZER_GOSALES_HR"."A_MANAGER_USER_TYPE" UNDER "ANALYZER_GOSALES_HR"."A_EMPLOYEE_DATA"
      INHERIT SELECT PRIVILEGES;
      

-------------------ARCHITECT TYPE
CREATE TYPE "ANALYZER_GOSALES_HR"."A_ARCHITECT_T1" AS 
      (STOCKOPTION VARCHAR(20)
      )
      INSTANTIABLE
      REF USING VARCHAR(13) FOR BIT DATA
      MODE DB2SQL;
      

CREATE TABLE ANALYZER_GOSALES_HR.A_ARCHITECT_DATA OF ANALYZER_GOSALES_HR.A_ARCHITECT_T1
      (REF IS Oid USER GENERATED, STOCKOPTION WITH OPTIONS NOT NULL,CONSTRAINT C1 UNIQUE(STOCKOPTION));
      
---------------------ARCHITECT TYPE 2-------

CREATE TYPE "ANALYZER_GOSALES_HR"."A_ARCHITECT_TYPE2" UNDER  "ANALYZER_GOSALES_HR"."A_EMPLOYEE_T"
      AS 
      (STOCKOPTION VARCHAR(20)
      )
      INSTANTIABLE
      MODE DB2SQL;
      
CREATE TABLE "ANALYZER_GOSALES_HR"."A_ARCHITECT" OF "ANALYZER_GOSALES_HR"."A_ARCHITECT_TYPE2" HIERARCHY "ANALYZER_GOSALES_HR"."A_EMPLOYEE__DATA_HIERARCHY"
(REF IS Oid USER GENERATED);

CREATE TABLE"ANALYZER_GOSALES_HR"."A_ARCHITECTDATA" OF "ANALYZER_GOSALES_HR"."A_ARCHITECT_TYPE2" UNDER "ANALYZER_GOSALES_HR"."A_EMPLOYEE_DATA"  INHERIT SELECT PRIVILEGES;



