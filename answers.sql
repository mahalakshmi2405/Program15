SET SERVEROUTPUT ON;

DECLARE
    marks NUMBER := 65;
BEGIN
    IF marks >= 50 THEN
        -- Passed message
        DBMS_OUTPUT.PUT_LINE('PASS');
    ELSE
        -- Failed message
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
/
