#http://dev.mysql.com/doc/refman/5.5/en/trigger-syntax.html
USE var;
CREATE TABLE IF NOT EXISTS account (acct_num INT, amount DECIMAL(10,2));

# BEFORE | AFTER         UPDATE | DELETE | CREATE
# OLD.col  | NEW.col

delimiter //
DROP TRIGGER IF EXISTS upd_check //
CREATE TRIGGER upd_check BEFORE UPDATE ON account
FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SET NEW.amount = 0;
    ELSEIF NEW.amount > 100 THEN
        SET NEW.amount = 100;
    END IF;
END;//
delimiter ;

INSERT INTO account (acct_num, amount) VALUE (1,20);
INSERT INTO account (acct_num, amount) VALUE (2,101);

SET SQL_SAFE_UPDATES = 0;

UPDATE account SET amount = -1 WHERE acct_num = 1;
UPDATE account SET amount = 101 WHERE acct_num = 2;

#--------------------------

