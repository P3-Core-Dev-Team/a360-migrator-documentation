-----------------EXAMPLE 1
     
CREATE TABLE ANALYZER_GOSALES_HR.A_DEPT_TABLE_OPTIONS
      (DEPTNO    CHAR(3)           NOT NULL,
       DEPTNAME  VARCHAR(36)       NOT NULL,
       MGRNO     CHAR(6)                   ,
       ADMRDEPT  CHAR(3)           NOT NULL,
       LOCATION  CHAR(16)                  ,
       PRIMARY KEY (DEPTNO)                )
 COMPRESS YES ADAPTIVE 
 VALUE COMPRESSION
 WITH RESTRICT ON DROP
NOT LOGGED INITIALLY
CCSID UNICODE;



