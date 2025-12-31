-- This creates a trigger that automatically fills account_ip_record 
-- whenever a row is added to accounts_sessions
DROP TRIGGER IF EXISTS log_ip_on_login;
CREATE TRIGGER log_ip_on_login
AFTER INSERT ON accounts_sessions
FOR EACH ROW
INSERT INTO account_ip_record (login_time, accid, charid, client_ip)
VALUES (NOW(), NEW.accid, NEW.charid, NEW.client_addr);