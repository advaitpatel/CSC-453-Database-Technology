CONNECT ex/ex;

CREATE DIRECTORY script_dir AS 'C:/murach/oracle_sql/scripts/ch18';

INSERT INTO scripts VALUES 
(1, BFILENAME('script_dir', 'fig18_02.sql'));

INSERT INTO scripts VALUES 
(2, BFILENAME('script_dir', 'fig18_03.sql'));

COMMIT;