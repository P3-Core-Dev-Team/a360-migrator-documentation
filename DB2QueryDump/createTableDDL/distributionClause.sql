CREATE TABLE ANALYZER_GOSALES_HR.RAND_BY_UNIQUE (ID BIGINT NOT NULL,
                             NAME CHAR(25) NOT NULL,
                             DESCRIPTION VARCHAR(1000),
                             PRIMARY KEY(ID, NAME)) DISTRIBUTE BY RANDOM;
  
  
  CREATE TABLE  ANALYZER_GOSALES_HR.SALES_DISTRIBUTE_CLAUSE
     (CUSTOMER   VARCHAR(80),
      REGION     CHAR(5),
      YEAR       INTEGER)
   DISTRIBUTE BY HASH (YEAR,REGION);      
 
 