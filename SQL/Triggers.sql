--Triggers asociados a secuencias:
CREATE OR REPLACE TRIGGER TR_Horario_Curso
BEFORE INSERT ON Horario_Curso
FOR EACH ROW
DECLARE
     valorSec NUMBER := 0;
BEGIN
     SELECT SEC_Horario_Curso.CURRVAL INTO valorSec FROM DUAL;
     :NEW.Id_Horario := valorSec;
END;
/

CREATE OR REPLACE TRIGGER TR_Recibos
BEFORE INSERT ON Recibos
FOR EACH ROW
DECLARE
     valorSec NUMBER := 0;
BEGIN
     SELECT SEC_Recibos.CURRVAL INTO valorSec FROM DUAL;
     :NEW.Id_Recibo := valorSec;
END;
/