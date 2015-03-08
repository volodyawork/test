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
        DECLARE a, b INT DEFAULT 5;
        DECLARE c VARCHAR(45) DEFAULT 'HELLO';
        SET res = CONCAT('RESULT', a , b, ' ', c);
    END|

DELIMITER ;

CALL super_procedure_OUT(@a);
SELECT @a;