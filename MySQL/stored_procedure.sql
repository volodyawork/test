USE var;
DELIMITER |
DROP PROCEDURE IF EXISTS super_procedure|
CREATE PROCEDURE super_procedure (IN p1 VARCHAR(256))
    BEGIN
        SELECT CONCAT(p1, ' HELLO');
    END|

DELIMITER ;

CALL super_procedure('1234');

#====================
USE var;
DELIMITER |
DROP PROCEDURE IF EXISTS super_procedure_OUT|
CREATE PROCEDURE super_procedure_OUT (OUT res VARCHAR(256))
    BEGIN
        SET res = 'RESULT';
    END|

DELIMITER ;

CALL super_procedure_OUT(@a);
SELECT @a;