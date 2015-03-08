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
CREATE PROCEDURE super_procedure_OUT (OUT res VARCHAR(256), IN p1 INT)
    BEGIN
        DECLARE a, b INT DEFAULT 5;
        DECLARE c VARCHAR(45) DEFAULT 'HELLO';
        DECLARE i INT DEFAULT 0;

        # IF
        IF p1 < 0 THEN
            SET res = CONCAT('RESULT', a , b, ' ', c);
        ELSE
            # CASE
            CASE p1
                WHEN 0 THEN
                SET res = p1 + 1;
                WHEN 1 THEN
                SET res = p1 * 2;
                WHEN 2 THEN
                SET res = p1 / 2;
                WHEN 3 THEN
                SET res = p1 -3;
            ELSE
                # WHILE
                WHILE i < 10 DO
                    SET i = i + 1;
                END WHILE;
                SET res = CONCAT('SUPER', i);
            END CASE;
        END IF;



    END|

DELIMITER ;

CALL super_procedure_OUT(@a, 3);
SELECT @a;