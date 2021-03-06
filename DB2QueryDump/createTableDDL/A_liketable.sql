   CREATE TABLE "ANALYZER_GOSALES_HR"."A_EMP_DATA"
     (PROJNO   CHAR(6)      NOT NULL,
      PROJNAME VARCHAR(24)  NOT NULL,
      DEPTNO   CHAR(3)      NOT NULL,
      RESPEMP  CHAR(6)      NOT NULL,
      PRSTAFF  DECIMAL(5,2)         ,
      PRSTDATE DATE                 ,
      PRENDATE DATE                 ,
      MAJPROJ  CHAR(6)      NOT NULL);
      
   CREATE TABLE "ANALYZER_GOSALES_HR"."A_EMP_DATA_LIKETAB1" LIKE "ANALYZER_GOSALES_HR"."A_EMP_DATA" INCLUDING COLUMN DEFAULTS; 
   
   
   CREATE TABLE "ANALYZER_GOSALES_HR"."A_EMP_DATA_LIKETAB2" LIKE "ANALYZER_GOSALES_HR"."A_EMP_DATA" EXCLUDING DEFAULTS EXCLUDING IDENTITY COLUMN ATTRIBUTES; 