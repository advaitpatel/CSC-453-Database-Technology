ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR HH24:MI:SS';

SELECT timestamp_id, timestamp_value, 
  NEW_TIME(timestamp_value, 'PST', 'CST') AS cst_time
FROM timestamp_values;

