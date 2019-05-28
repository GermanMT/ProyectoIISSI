--Triggers asociados a secuencias:
CREATE OR REPLACE TRIGGER TR_Cursos
BEFORE INSERT ON Cursos
FOR EACH ROW
DECLARE
     valorSec NUMBER := 0;
BEGIN
     SELECT SEC_Cursos.CURRVAL INTO valorSec FROM DUAL;
     :NEW.Id_Curso := valorSec;
END;
/

CREATE OR REPLACE TRIGGER TR_Horario_Profesor
BEFORE INSERT ON Horario_Profesor
FOR EACH ROW
DECLARE
     valorSec NUMBER := 0;
BEGIN
     SELECT SEC_Horario_Profesor.CURRVAL INTO valorSec FROM DUAL;
     :NEW.Id_Horario := valorSec;
END;
/

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

CREATE OR REPLACE TRIGGER TR_Horario_Alumno
BEFORE INSERT ON Horario_Alumno
FOR EACH ROW
DECLARE
     valorSec NUMBER := 0;
BEGIN
     SELECT SEC_Horario_Alumno.CURRVAL INTO valorSec FROM DUAL;
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
/*
--Triger de la Regla de Negocio 1(HACER CAMBIO CON LOS TELEFONOS):
CREATE OR REPLACE TRIGGER Datos_Necesarios1
BEFORE INSERT ON Alumnos
FOR EACH ROW
DECLARE
    v_DNI_Alumno CHAR(9) := :NEW.DNI_Alumno;
    v_Nombre VARCHAR2(20) := :NEW.Nombre;
    v_Apellidos VARCHAR2(20) := :NEW.Apellidos;
    v_Telefono_Movil CHAR(9) := :NEW.Telefono_Movil;
BEGIN
    IF (v_DNI_Alumno = ' ' OR v_Nombre = ' ' OR v_Apellidos = ' ' OR v_Telefono_Movil = ' ') THEN
        RAISE_APPLICATION_ERROR(-20002,'El alumno deber aportar la información necesaria para su registro.');
    END IF;
END;
/

--Triger de la Regla de Negocio 2:
/*CREATE OR REPLACE TRIGGER Pago_Mensual
BEFORE INSERT ON Recibos
FOR EACH ROW
DECLARE
    v_Fecha_Recibo DATE := :NEW.Fecha_Recibo;
BEGIN
    IF(v_Fecha_Recibo < TO_DATE(07,'DD')) THEN
        RAISE_APPLICATION_ERROR(-20003,'El pago mensual debe realizarse con una semana de antelación.');
    END IF;
END;
/

--Triger de la Regla de Negocio 3:
CREATE OR REPLACE TRIGGER Num_Alumnos
BEFORE INSERT ON Cursos
FOR EACH ROW
DECLARE
    v_Num_Alumnos NUMBER(10,0) := :NEW.Num_Alumnos;
BEGIN
    IF(v_Num_Alumnos >12) THEN
    RAISE_APPLICATION_ERROR(-20004, 'EL número de alumnos debe estar comprendido entre 6 y 12 alumnos.');
    END IF;
END;
/

--Triger de la Regla de Negocio 4:
CREATE OR REPLACE TRIGGER Pago_Anticipado
BEFORE INSERT ON Examenes
FOR EACH ROW
DECLARE
    v_Fecha_Pago DATE := :NEW.Fecha_Pago;
    v_Fecha DATE := :NEW.Fecha;
BEGIN
    IF(v_Fecha - v_Fecha_Pago < 30) THEN
    RAISE_APPLICATION_ERROR(-20010,'El pago del examen debe realizarse con un mes de antelación.');
    END IF;
END;
/

--Triger de la Regla de Negocio 5:
CREATE OR REPLACE TRIGGER Descuento
BEFORE INSERT ON Recibos
FOR EACH ROW
DECLARE
    v_Por_Pagar NUMBER(38,0) := :NEW.Por_Pagar;
    v_Hermanos NUMBER(2,0) := :NEW.Hermanos;
BEGIN
    IF(v_Hermanos != 0) THEN
        IF(v_Por_Pagar != 50*0.9) THEN
            RAISE_APPLICATION_ERROR(-20011,'El descuento no ha sido aplicado.');
        END IF;
    END IF;
END;