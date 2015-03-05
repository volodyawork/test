DELIMITER |
DROP PROCEDURE IF EXISTS super_procedure|
CREATE PROCEDURE super_procedure ()
BEGIN
    SELECT 'Hello World!';
END|

DELIMITER ;

CALL super_procedure();