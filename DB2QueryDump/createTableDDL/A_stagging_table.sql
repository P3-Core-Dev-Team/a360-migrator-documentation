   
   CREATE TABLE ANALYZER_GOSALES_HR.A_TO1(ID INT  NOT NULL);
   CREATE TABLE ANALYZER_GOSALES_HR.A_TO2(ID INT  NOT NULL);
   
   CREATE TABLE ANALYZER_GOSALES_HR.A_TO3(
    ID,
    COUNT
  ) 
   AS (
  SELECT ID, COUNT(*)
  FROM TABLE 
   ( (
  SELECT ID
  FROM ANALYZER_GOSALES_HR.A_TO1) UNION ALL (
  SELECT ID
  FROM ANALYZER_GOSALES_HR.A_TO2)) AS A (ID)
  GROUP BY A. ID) DATA INITIALLY DEFERRED REFRESH DEFERRED  ENABLE QUERY OPTIMIZATION MAINTAINED BY SYSTEM;
   
      CREATE TABLE ANALYZER_GOSALES_HR.A_ST1 FOR ANALYZER_GOSALES_HR.A_TO3 PROPAGATE IMMEDIATE;