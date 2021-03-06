-----------------------example1
   CREATE TABLE ANALYZER_GOSALES_HR.A_DOCUMENTS_PARTTITION_CLAUSE(
    ID INTEGER,
    CONTENTS CLOB
  )
 PARTITION BY RANGE
  (
    ID NULLS LAST
  )
 (STARTING 1 INCLUSIVE ENDING 1000 EXCLUSIVE EVERY 10 ) IN A_T1 INDEX IN A_T2 LONG IN A_T3;


--------------------example2      
      
       CREATE TABLESPACE A_LARGE_TBSP1
  MANAGED BY AUTOMATIC STORAGE;
     
     CREATE TABLESPACE A_LARGE_TBSP2
  MANAGED BY AUTOMATIC STORAGE;
     
      CREATE TABLESPACE A_TBSP1
  MANAGED BY AUTOMATIC STORAGE;
     
      CREATE TABLESPACE A_LARGE_TBSP3
  MANAGED BY AUTOMATIC STORAGE;
     CREATE TABLE ANALYZER_GOSALES_HR.A_DOCUMENTS1
     (
    ID INTEGER,
    CONTENTS CLOB
  )
     LONG IN A_LARGE_TBSP1, A_LARGE_TBSP2
     PARTITION BY RANGE
  (ID)
       (
    STARTING 1 ENDING 100 IN A_TBSP1 LONG IN A_LARGE_TBSP3,
    STARTING 101 ENDING 1000 EVERY 100
  );
        
        
-----------------------example3        
     CREATE TABLE ANALYZER_GOSALES_HR.A_ACCESSNUMBERS
     (
    AREA INTEGER,
    EXCHANGE INTEGER
  )
     PARTITION BY RANGE
  (
    AREA NULLS LAST,
    EXCHANGE NULLS FIRST
  )
       (STARTING (1,1) ENDING (10,100),
        STARTING (11,1) ENDING (MAXVALUE,MAXVALUE));
        
------------------------example4        
        
    CREATE TABLE GOALES_HR.A_RATIO
     (PERCENT INTEGER)
     PARTITION BY RANGE
  (PERCENT)
       (STARTING (MINVALUE) ENDING (MAXVALUE));



--------------------------example5       
          CREATE TABLE ANALYZER_GOSALES_HR.A_RATIO1
     (PERCENT INTEGER)
     PARTITION BY RANGE
  (PERCENT)
       (STARTING 0 EXCLUSIVE ENDING 100 INCLUSIVE);
       
------------example6       

 CREATE TABLESPACE A_TBSP11
  MANAGED BY AUTOMATIC STORAGE;
     
  CREATE TABLESPACE A_TBSPX
  MANAGED BY AUTOMATIC STORAGE;
  
   CREATE TABLESPACE A_TBSP31
  MANAGED BY AUTOMATIC STORAGE;
     
   CREATE TABLESPACE A_TBSP21
  MANAGED BY AUTOMATIC STORAGE;   
     
   CREATE TABLESPACE A_TBSP22
  MANAGED BY AUTOMATIC STORAGE;
   
    CREATE TABLESPACE A_TBSP32
  MANAGED BY AUTOMATIC STORAGE;
     
     
   CREATE TABLE ANALYZER_GOSALES_HR.A_DOCUMENTS_PARTIITON_CLAUSE
   (
    ID        INTEGER,
    CONTENTS  XML
  )  INDEX IN A_TBSPX
   PARTITION BY
  (
    ID NULLS LAST
  )
   (
    STARTING FROM 1 INCLUSIVE ENDING AT 100 INCLUSIVE IN A_TBSP11 INDEX IN A_TBSP21 LONG IN A_TBSP31,
    STARTING FROM 101 INCLUSIVE ENDING AT 200 INCLUSIVE IN A_TBSP21 INDEX IN A_TBSP22 LONG IN A_TBSP32
  );
    
--------------example7    

   
    CREATE TABLESPACE A_TBSP12
  MANAGED BY AUTOMATIC STORAGE;
     
       CREATE TABLE ANALYZER_GOSALES_HR.A_SALES_PARTITION_CLAUSE
   (
    SID     INTEGER,
    AMOUNT  INTEGER
  )  INDEX IN A_TBSPX
   PARTITION BY RANGE
  (
    SID NULLS LAST
  )
   (
    STARTING FROM 1 INCLUSIVE ENDING AT 100 INCLUSIVE IN A_TBSP11 INDEX IN A_TBSP21,
    STARTING FROM 101 INCLUSIVE ENDING AT 200 INCLUSIVE IN A_TBSP12 INDEX IN A_TBSP22
  );
    

        
        
        