-- use the EX connection
CONNECT ex/ex;

CREATE TABLE timestamp_values
(
  timestamp_id         NUMBER        PRIMARY KEY,
  timestamp_value      TIMESTAMP(6),
  timestamp_wltz_value TIMESTAMP WITH LOCAL TIME ZONE,
  timestamp_wtz_value  TIMESTAMP WITH TIME ZONE
);

INSERT INTO timestamp_values
VALUES (1, LOCALTIMESTAMP(3), CURRENT_TIMESTAMP(3), CURRENT_TIMESTAMP(3));

SELECT * FROM timestamp_values;