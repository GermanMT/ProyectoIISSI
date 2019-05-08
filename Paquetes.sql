--Función auxiliar:
CREATE OR REPLACE FUNCTION ASSERT_EQUALS (v_Salida BOOLEAN, salidaEsperada BOOLEAN)
    RETURN VARCHAR2
    IS
    BEGIN
      IF (v_Salida = salidaEsperada) THEN
        RETURN 'ÉXITO';
      ELSE
        RETURN 'FALLO';
      END IF;
END;
/

--Cabeceras de las pruebas:
--Tabla Recibos:
CREATE OR REPLACE PACKAGE PCK_Recibos AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar 
      (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, v_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE, v_Pagado IN Recibos.Pagado%TYPE,
      v_Por_Pagar IN Recibos.Por_Pagar%TYPE, v_Hermanos IN Recibos.Hermanos%TYPE, v_Forma_Pago IN Recibos.Forma_Pago%TYPE,
      v_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
      (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, v_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE, v_Pagado IN Recibos.Pagado%TYPE,
      v_Por_Pagar IN Recibos.Por_Pagar%TYPE, v_Hermanos IN Recibos.Hermanos%TYPE, v_Forma_Pago IN Recibos.Forma_Pago%TYPE,
      v_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar
      (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Alumnos:
CREATE OR REPLACE PACKAGE PCK_Alumnos AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar 
        (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE,
        v_Edad IN Alumnos.Edad%TYPE, v_Telefono_Fijo IN Alumnos.Telefono_Fijo%TYPE, v_Telefono_Movil IN Alumnos.Telefono_Movil%TYPE,
        v_Email IN Alumnos.Email%TYPE,v_Nombre_Padre_Madre IN Alumnos.Nombre_Padre_Madre%TYPE,
        v_Localidad IN Alumnos.Localidad%TYPE, v_Id_Recibo IN Alumnos.Id_Recibo%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
    (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE,
    v_Edad IN Alumnos.Edad%TYPE, v_Telefono_Fijo IN Alumnos.Telefono_Fijo%TYPE, v_Telefono_Movil IN Alumnos.Telefono_Movil%TYPE,
    v_Email IN Alumnos.Email%TYPE,v_Nombre_Padre_Madre IN Alumnos.Nombre_Padre_Madre%TYPE,
    v_Localidad IN Alumnos.Localidad%TYPE, v_Id_Recibo IN Alumnos.Id_Recibo%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Profesores.
CREATE OR REPLACE PACKAGE PCK_Profesores AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar
      (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, v_Nombre IN Profesores.Nombre%TYPE, 
      v_Apellidos IN Profesores.Apellidos%TYPE, v_Edad IN Profesores.Edad%TYPE,v_Telefono_Movil IN Profesores.Telefono_Movil%TYPE,
      v_Telefono_Fijo IN Profesores.Telefono_Fijo%TYPE, v_Email IN Profesores.Email%TYPE, v_Localidad IN Profesores.Localidad%TYPE,
      v_Nivel_Ingles IN Profesores.Nivel_Ingles%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
    (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, v_Nombre IN Profesores.Nombre%TYPE,
      v_Apellidos IN Profesores.Apellidos%TYPE, v_Edad IN Profesores.Edad%TYPE,v_Telefono_Movil IN Profesores.Telefono_Movil%TYPE,
      v_Telefono_Fijo IN Profesores.Telefono_Fijo%TYPE, v_Email IN Profesores.Email%TYPE, v_Localidad IN Profesores.Localidad%TYPE,
      v_Nivel_Ingles IN Profesores.Nivel_Ingles%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Horarios:
CREATE OR REPLACE PACKAGE PCK_Horarios AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar
        (nombrePrueba VARCHAR2, v_Hora_Inicio IN Horarios.Hora_Inicio%TYPE, v_Hora_Fin IN Horarios.Hora_Fin%TYPE, v_Dia IN Horarios.Dia%TYPE, 
        v_Id_Horario IN Horarios.Id_Horario%TYPE, v_DNI_Profesor IN Horarios.DNI_Profesor%TYPE, v_DNI_Alumno IN Horarios.DNI_Alumno%TYPE, 
        v_Id_Curso IN Horarios.Id_Curso%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
        (nombrePrueba VARCHAR2, v_Hora_Inicio IN Horarios.Hora_Inicio%TYPE, v_Hora_Fin IN Horarios.Hora_Fin%TYPE, v_Dia IN Horarios.Dia%TYPE, 
        v_Id_Horario IN Horarios.Id_Horario%TYPE, v_DNI_Profesor IN Horarios.DNI_Profesor%TYPE, v_DNI_Alumno IN Horarios.DNI_Alumno%TYPE, 
        v_Id_Curso IN Horarios.Id_Curso%TYPE ,salidaEsperada BOOLEAN);
    PROCEDURE Eliminar
        (nombrePrueba VARCHAR2, v_Id_Horario IN Horarios.Id_Horario%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Cursos_Alumnos:
CREATE OR REPLACE PACKAGE PCK_Cursos_Alumnos AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar
        (nombrePrueba VARCHAR2, v_Fecha_Alta IN Cursos_Alumnos.Fecha_Alta%TYPE, v_Fecha_Baja IN Cursos_Alumnos.Fecha_Baja%TYPE, 
        v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, v_DNI_Alumno IN Cursos_Alumnos.DNI_Alumno%TYPE, v_Id_Curso IN Cursos_Alumnos.Id_Curso%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
        (nombrePrueba VARCHAR2, v_Fecha_Alta IN Cursos_Alumnos.Fecha_Alta%TYPE, v_Fecha_Baja IN Cursos_Alumnos.Fecha_Baja%TYPE, 
        v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, v_DNI_Alumno IN Cursos_Alumnos.DNI_Alumno%TYPE, v_Id_Curso IN Cursos_Alumnos.Id_Curso%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Eliminar
        (nombrePrueba VARCHAR2, v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, salidaEsperada BOOLEAN);
END;
/
/*
--Tabla Curso_Profesores.
CREATE OR REPLACE PACKAGE PCK_CursoProfesores AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar 
      (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, 
      v_DNI_Profesor IN Cursos_Profesores.DNI_Profesor%TYPE, v_Id_Curso IN Cursos_Profesores.Id_Curso%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar 
      (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, 
      v_DNI_Profesor IN Cursos_Profesores.DNI_Profesor%TYPE, v_Id_Curso IN Cursos_Profesores.Id_Curso%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, salidaEsperada BOOLEAN);
END;
/
*/
--Tabla Cursos:
CREATE OR REPLACE PACKAGE PCK_Cursos AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE insertar
        (nombrePrueba VARCHAR2, v_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE, v_Fecha_Fin IN Cursos.Fecha_Fin%TYPE, v_Num_Alumnos IN Cursos.Num_Alumnos%TYPE, 
         v_Id_Curso IN Cursos.Id_Curso%Type, v_Id_Academia IN Cursos.Id_Academia%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar
        (nombrePrueba VARCHAR2, v_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE, v_Fecha_Fin IN Cursos.Fecha_Fin%TYPE, v_Num_Alumnos IN Cursos.Num_Alumnos%TYPE, 
         v_Id_Curso IN Cursos.Id_Curso%Type, v_Id_Academia IN Cursos.Id_Academia%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar
        (nombrePrueba VARCHAR2, v_Id_Curso IN Cursos.Id_Curso%Type, salidaEsperada BOOLEAN);
END;
/

--Tabla Academias:
CREATE OR REPLACE PACKAGE PCK_Academias AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar
        (nombrePrueba VARCHAR2, v_Lugar IN Academias.Lugar%TYPE, v_Aulas IN Academias.Aulas%TYPE, v_Id_Academia IN Academias.Id_Academia%TYPE,
        v_Telefono IN Academias.Telefono%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
        (nombrePrueba VARCHAR2, v_Lugar IN Academias.Lugar%TYPE, v_Aulas IN Academias.Aulas%TYPE, v_Id_Academia IN Academias.Id_Academia%TYPE,
        v_Telefono IN Academias.Telefono%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE Eliminar
        (nombrePrueba VARCHAR2, v_Id_Academia IN Academias.Id_Academia%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Examenes
CREATE OR REPLACE PACKAGE PCK_Examenes AS
    PROCEDURE Inicializar;
    PROCEDURE Consultar;
    PROCEDURE Insertar
        (nombrePrueba VARCHAR2, v_Tipo_Examen IN EXAMENES.TIPO_EXAMEN%TYPE,v_Nivel_Examen IN EXAMENES.NIVEL_EXAMEN%TYPE, v_Fecha_Pago IN EXAMENES.FECHA_PAGO%TYPE,
        v_Lugar IN EXAMENES.LUGAR%TYPE, v_Fecha IN EXAMENES.FECHA%TYPE, v_Id_Curso IN EXAMENES.ID_CURSO%TYPE, v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE
        ,salidaEsperada BOOLEAN);
    PROCEDURE Actualizar
        (nombrePrueba VARCHAR2, v_Tipo_Examen IN EXAMENES.TIPO_EXAMEN%TYPE,v_Nivel_Examen IN EXAMENES.NIVEL_EXAMEN%TYPE, v_Fecha_Pago IN EXAMENES.FECHA_PAGO%TYPE,
        v_Lugar IN EXAMENES.LUGAR%TYPE, v_Fecha IN EXAMENES.FECHA%TYPE, v_Id_Curso IN EXAMENES.ID_CURSO%TYPE, v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE
        ,salidaEsperada BOOLEAN);
    PROCEDURE Eliminar
        (nombrePrueba VARCHAR2, v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE ,salidaEsperada BOOLEAN);
END;
/
--Cuerpo de los paquetes:
--Tabla Recibos:
CREATE OR REPLACE PACKAGE BODY PCK_Recibos
AS
    CURSOR C IS
        SELECT * FROM Recibos;
    v_Salida BOOLEAN := TRUE;
    v_Recibos Recibos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Recibos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
      OPEN C;
      FETCH C INTO v_Recibos;
          DBMS_OUTPUT.PUT_LINE(RPAD('Id Recibo:', 25) || RPAD('Fecha Recibo:', 25) || RPAD('Pagado:', 25) || RPAD('Por Pagar:', 25)|| RPAD('Hermanos:', 25)
           || RPAD('Forma Pago:', 25) || RPAD('Cuenta Bancaria:', 25));
          DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
      WHILE C%FOUND LOOP
          DBMS_OUTPUT.PUT_LINE(RPAD(v_Recibos.Id_Recibo, 25) || RPAD(v_Recibos.Fecha_Recibo, 25) || RPAD(v_Recibos.Pagado, 25) || RPAD(v_Recibos.Por_Pagar, 25)
          || RPAD(v_Recibos.Hermanos, 25) || RPAD(v_Recibos.Forma_Pago, 25) || RPAD(v_Recibos.Cuenta_Bancaria, 25));
      FETCH C INTO v_Recibos;
      END LOOP;
      CLOSE C;
END Consultar;
PROCEDURE Insertar (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, v_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE, 
v_Pagado IN Recibos.Pagado%TYPE, v_Por_Pagar IN Recibos.Por_Pagar%TYPE, v_Hermanos IN Recibos.Hermanos%TYPE,
v_Forma_Pago IN Recibos.Forma_Pago%TYPE, v_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          INSERT INTO Recibos(ID_RECIBO, FECHA_RECIBO, PAGADO, POR_PAGAR,HERMANOS, FORMA_PAGO, CUENTA_BANCARIA) 
          VALUES (v_Id_Recibo, v_Fecha_Recibo, v_Pagado, v_Por_Pagar, v_Hermanos, v_Forma_Pago, v_Cuenta_Bancaria);
          SELECT * INTO v_Recibos FROM Recibos WHERE Id_Recibo = v_Id_Recibo;
          IF(v_Recibos.Fecha_Recibo != v_Fecha_Recibo AND v_Recibos.Pagado != v_Pagado AND v_Recibos.Por_Pagar != v_Por_Pagar
           AND v_Recibos.Hermanos != v_Hermanos AND v_Recibos.Forma_Pago != v_Forma_Pago) AND v_Recibos.Cuenta_Bancaria != v_Cuenta_Bancaria THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END Insertar;
PROCEDURE Actualizar (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, v_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE, 
v_Pagado IN Recibos.Pagado%TYPE, v_Por_Pagar IN Recibos.Por_Pagar%TYPE, v_Hermanos IN Recibos.Hermanos%TYPE,
v_Forma_Pago IN Recibos.Forma_Pago%TYPE, v_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          UPDATE Recibos SET Fecha_Recibo = v_Fecha_Recibo, Pagado = v_Pagado, Por_Pagar = v_Por_Pagar, Hermanos = v_Hermanos, Forma_Pago = v_Forma_Pago , Cuenta_Bancaria = v_Cuenta_Bancaria 
          WHERE Id_Recibo = v_Id_Recibo;
          SELECT * INTO v_Recibos FROM Recibos WHERE Id_Recibo = v_Id_Recibo;
          IF(v_Recibos.Fecha_Recibo != v_Fecha_Recibo AND v_Recibos.Pagado != v_Pagado AND v_Recibos.Por_Pagar != v_Por_Pagar  AND v_Recibos.Hermanos != v_Hermanos 
          AND v_Recibos.Forma_Pago != v_Forma_Pago AND v_Recibos.Cuenta_Bancaria != v_Cuenta_Bancaria) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END Actualizar;
PROCEDURE Eliminar (nombre_Prueba VARCHAR2, v_Id_Recibo IN Recibos.Id_Recibo%TYPE, salidaEsperada BOOLEAN)
      IS
          v_NumRecibos NUMBER := 0;
      BEGIN
          DELETE FROM Recibos WHERE Id_Recibo = v_Id_Recibo;
          SELECT COUNT(*) INTO v_NumRecibos FROM Recibos WHERE Id_Recibo = v_Id_Recibo;
          IF (v_NumRecibos != 0) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombre_Prueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END Eliminar;
END;
/

-- Cuerpo Alumno.
CREATE OR REPLACE PACKAGE BODY PCK_Alumnos
AS
CURSOR C IS
    SELECT * FROM Alumnos;
    v_Salida BOOLEAN := TRUE;
    v_Alumnos Alumnos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Alumnos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
    OPEN C;
    FETCH C INTO v_Alumnos;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Edad:', 25) || 
    RPAD('Teléfono Fijo:', 25) || RPAD('Teléfono Movil:', 25) || RPAD('Email:', 25) || RPAD('Nombre Padre o Madre:', 25) || RPAD('Localidad:', 25) 
    || RPAD('Id Recibo:', 25));
    DBMS_OUTPUT.PUT_LINE(LPAD('-', 150, '-'));
    WHILE C%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI_Alumno, 25) || RPAD(v_Alumnos.Nombre, 25) || RPAD(v_Alumnos.Apellidos, 25) || RPAD(v_Alumnos.Edad, 25) ||
    RPAD(v_Alumnos.Telefono_Fijo, 25) || RPAD(v_Alumnos.Telefono_Movil) || RPAD(v_Alumnos.Email, 25) || RPAD(v_Alumnos.Nombre_Padre_Madre, 25) 
    || RPAD(v_Alumnos.Localidad, 25) || RPAD(v_Alumnos.Id_Recibo, 25));
    FETCH C INTO v_Alumnos;
    END LOOP;
    CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE,
        v_Edad IN Alumnos.Edad%TYPE, v_Telefono_Fijo IN Alumnos.Telefono_Fijo%TYPE, v_Telefono_Movil IN Alumnos.Telefono_Movil%TYPE, 
        v_Email IN Alumnos.Email%TYPE, v_Nombre_Padre_Madre IN Alumnos.Nombre_Padre_Madre%TYPE, v_Localidad IN Alumnos.Localidad%TYPE,
        v_Id_Recibo IN Alumnos.Id_Recibo%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Alumnos (DNI_ALUMNO, NOMBRE, APELLIDOS, EDAD, TELEFONO_FIJO, TELEFONO_MOVIL, EMAIL, NOMBRE_PADRE_MADRE, LOCALIDAD, ID_RECIBO)
        VALUES (v_DNI_ALUMNO, v_NOMBRE, v_APELLIDOS, v_EDAD, v_TELEFONO_FIJO, v_TELEFONO_MOVIL, v_EMAIL, v_NOMBRE_PADRE_MADRE, v_LOCALIDAD, v_ID_RECIBO);
        SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI_ALUMNO = v_DNI_ALUMNO;
        IF v_Alumnos.NOMBRE != v_NOMBRE AND v_Alumnos.APELLIDOS != v_APELLIDOS AND v_Alumnos.EDAD != v_EDAD AND v_Alumnos.TELEFONO_FIJO != v_TELEFONO_FIJO
        AND v_Alumnos.TELEFONO_MOVIL != v_TELEFONO_MOVIL AND v_Alumnos.EMAIL != v_EMAIL AND v_Alumnos.NOMBRE_PADRE_MADRE != v_NOMBRE_PADRE_MADRE
        AND v_Alumnos.LOCALIDAD != v_LOCALIDAD AND v_Alumnos.ID_RECIBO != v_ID_RECIBO
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE,
    v_Edad IN Alumnos.Edad%TYPE, v_Telefono_Fijo IN Alumnos.Telefono_Fijo%TYPE, v_Telefono_Movil IN Alumnos.Telefono_Movil%TYPE, 
    v_Email IN Alumnos.Email%TYPE, v_Nombre_Padre_Madre IN Alumnos.Nombre_Padre_Madre%TYPE, v_Localidad IN Alumnos.Localidad%TYPE,
    v_Id_Recibo IN Alumnos.Id_Recibo%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
UPDATE Alumnos SET NOMBRE = v_NOMBRE, APELLIDOS = v_APELLIDOS, EDAD = v_EDAD, TELEFONO_FIJO = v_TELEFONO_FIJO, TELEFONO_MOVIL= v_TELEFONO_MOVIL,
EMAIL = v_EMAIL, NOMBRE_PADRE_MADRE = v_NOMBRE_PADRE_MADRE,  LOCALIDAD = v_LOCALIDAD, ID_RECIBO = v_ID_RECIBO WHERE DNI_ALUMNO = v_DNI_ALUMNO;
SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI_ALUMNO = v_DNI_ALUMNO;
IF v_Alumnos.NOMBRE != v_NOMBRE AND v_Alumnos.APELLIDOS != v_APELLIDOS AND v_Alumnos.EDAD != v_EDAD 
AND v_Alumnos.TELEFONO_FIJO != v_TELEFONO_FIJO AND v_Alumnos.TELEFONO_MOVIL != v_TELEFONO_MOVIL AND v_Alumnos.EMAIL != v_EMAIL 
AND v_Alumnos.NOMBRE_PADRE_MADRE != NOMBRE_PADRE_MADRE AND v_Alumnos.LOCALIDAD != v_LOCALIDAD AND v_Alumnos.ID_RECIBO != v_ID_RECIBO
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE, salidaEsperada BOOLEAN)
IS
      v_NumAlumnos NUMBER := 0;
BEGIN
      DELETE FROM Alumnos WHERE DNI_ALUMNO = v_DNI_ALUMNO;
      SELECT COUNT (*) INTO v_NumAlumnos FROM Alumnos WHERE DNI_ALUMNO = v_DNI_ALUMNO;
      IF v_NumAlumnos != 0 THEN 
          v_Salida := FALSE;
          END IF;
          COMMIT;
            DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
              EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                    ROLLBACK;
      END Eliminar;
END;
/

--Tabla Profesores:
CREATE OR REPLACE PACKAGE BODY PCK_Profesores
AS
CURSOR C IS
    SELECT * FROM Profesores;
    v_Salida BOOLEAN := TRUE;
    v_Profesores Profesores%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
   DELETE FROM Profesores;
END Inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Profesores;
DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Edad:', 25) || RPAD('Teléfono Movil:', 25) 
|| RPAD('Teléfono Fijo:', 25) || RPAD('Email:', 25) || RPAD('Localidad:', 25) || RPAD('Nivel Ingles:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI_Profesor, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) 
|| RPAD(v_Profesores.Edad, 25) || RPAD(v_Profesores.Telefono_Movil, 25) || RPAD(v_Profesores.Telefono_Fijo) || RPAD(v_Profesores.Email, 25) ||
RPAD(v_Profesores.Localidad, 25) || RPAD(v_Profesores.Nivel_Ingles, 25));
FETCH C INTO v_Profesores;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE,
      v_Edad IN Profesores.Edad%TYPE, v_Telefono_Movil IN Profesores.Telefono_Movil%TYPE, v_Telefono_Fijo IN Profesores.Telefono_Fijo%TYPE, 
      v_Email IN Profesores.Email%TYPE, v_Localidad IN Profesores.Localidad%TYPE, v_Nivel_Ingles IN Profesores.Nivel_Ingles%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
  INSERT INTO Profesores (DNI_PROFESOR, NOMBRE, APELLIDOS, EDAD, TELEFONO_MOVIL, TELEFONO_FIJO, EMAIL, LOCALIDAD , NIVEL_INGLES) 
  VALUES (v_DNI_PROFESOR, v_NOMBRE, v_APELLIDOS, v_EDAD, v_TELEFONO_MOVIL, v_TELEFONO_FIJO, v_EMAIL, v_LOCALIDAD,
  v_NIVEL_INGLES);
  SELECT * INTO v_Profesores FROM Profesores WHERE DNI_PROFESOR = v_DNI_PROFESOR;
  IF v_Profesores.NOMBRE != v_NOMBRE AND v_Profesores.APELLIDOS != v_APELLIDOS AND v_Profesores.EDAD != v_EDAD 
   AND v_Profesores.TELEFONO_MOVIL != v_TELEFONO_MOVIL AND v_Profesores.TELEFONO_FIJO != v_TELEFONO_FIJO AND v_Profesores.EMAIL != v_EMAIL
   AND v_Profesores.LOCALIDAD != v_LOCALIDAD AND v_Profesores.NIVEL_INGLES != v_NIVEL_INGLES
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE,
      v_Edad IN Profesores.Edad%TYPE, v_Telefono_Movil IN Profesores.Telefono_Movil%TYPE, v_Telefono_Fijo IN Profesores.Telefono_Fijo%TYPE, 
      v_Email IN Profesores.Email%TYPE, v_Localidad IN Profesores.Localidad%TYPE, 
      v_Nivel_Ingles IN Profesores.Nivel_Ingles%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
UPDATE Profesores SET NOMBRE = v_NOMBRE, APELLIDOS = v_APELLIDOS, EDAD = v_EDAD,
TELEFONO_MOVIL = v_TELEFONO_MOVIL, TELEFONO_FIJO = v_TELEFONO_FIJO, EMAIL = v_EMAIL, LOCALIDAD = v_LOCALIDAD, NIVEL_INGLES = v_NIVEL_INGLES WHERE DNI_PROFESOR = v_DNI_PROFESOR;
SELECT * INTO v_Profesores FROM Profesores WHERE DNI_PROFESOR = v_DNI_PROFESOR;
 IF v_Profesores.NOMBRE != v_NOMBRE AND v_Profesores.APELLIDOS != v_APELLIDOS AND v_Profesores.EDAD != v_EDAD 
  AND v_Profesores.TELEFONO_MOVIL != v_TELEFONO_MOVIL AND v_Profesores.TELEFONO_FIJO != v_TELEFONO_FIJO AND v_Profesores.EMAIL != v_EMAIL
  AND v_Profesores.LOCALIDAD != v_LOCALIDAD AND v_Profesores.NIVEL_INGLES != v_NIVEL_INGLES
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE, salidaEsperada BOOLEAN)
IS
      v_NumProfesores NUMBER := 0;
BEGIN
      DELETE FROM Profesores WHERE DNI_PROFESOR = v_DNI_PROFESOR;
      SELECT COUNT (*) INTO v_NumProfesores FROM Profesores WHERE DNI_PROFESOR = v_DNI_PROFESOR;
      IF v_NumProfesores != 0 THEN 
          v_Salida := FALSE;
          END IF;
          COMMIT;
            DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
              EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                    ROLLBACK;
      END Eliminar;
END;
/

-- Tabla Horarios:
CREATE OR REPLACE PACKAGE BODY PCK_Horarios
AS
    CURSOR C IS
        SELECT * FROM Horarios;
    v_Salida BOOLEAN := TRUE;
    v_Horarios Horarios%ROWTYPE;
PROCEDURE inicializar
    IS
    BEGIN
        DELETE FROM Horarios;
    END inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Horarios;
DBMS_OUTPUT.PUT_LINE(RPAD('Id Curso:', 25) || RPAD('Id Horario:', 25) || RPAD('Hora Inicio:', 25) || RPAD('Hora Fin:', 25) 
|| RPAD('Dia:', 25) || RPAD('DNI:',25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 150, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Horarios.Id_Curso, 25) || RPAD(v_Horarios.Id_Horario, 25) || RPAD(v_Horarios.Hora_Inicio, 25)
|| RPAD(v_Horarios.Hora_Fin, 25) || RPAD(v_Horarios.Dia, 25) || RPAD(v_Horarios.DNI_Profesor, 25) || RPAD(v_Horarios.DNI_Alumno, 25));
FETCH C INTO v_Horarios;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE insertar (nombrePrueba VARCHAR2, v_Hora_Inicio IN Horarios.Hora_Inicio%TYPE, v_Hora_Fin IN Horarios.Hora_Fin%TYPE, 
v_Dia IN Horarios.Dia%TYPE, v_Id_Horario IN Horarios.Id_Horario%TYPE, v_DNI_Profesor IN Horarios.DNI_Profesor%TYPE, 
v_DNI_Alumno IN Horarios.DNI_Alumno%TYPE, v_Id_Curso IN Horarios.Id_Curso%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          INSERT INTO Horarios(HORA_INICIO, HORA_FIN, DIA, ID_HORARIO, DNI_PROFESOR, DNI_ALUMNO, ID_CURSO) 
          VALUES (v_Hora_Inicio, v_Hora_Fin, v_Dia, v_Id_Horario, v_DNI_Profesor, v_DNI_Alumno, v_Id_Curso);
          SELECT * INTO v_Horarios FROM Horarios WHERE Id_Horario = v_Id_Horario;
          IF(v_Horarios.Hora_Inicio != v_Hora_Inicio AND v_Horarios.Hora_Fin != v_Hora_Fin AND v_Horarios.Dia != v_Dia AND v_Horarios.DNI_Profesor != v_DNI_Profesor AND v_Horarios.DNI_Alumno != v_DNI_Alumno AND v_Horarios.Id_Curso != v_Id_Curso) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END insertar;
PROCEDURE actualizar (nombrePrueba VARCHAR2, v_Hora_Inicio IN Horarios.Hora_Inicio%TYPE, v_Hora_Fin IN Horarios.Hora_Fin%TYPE, 
v_Dia IN Horarios.Dia%TYPE, v_Id_Horario IN Horarios.Id_Horario%TYPE, v_DNI_Profesor IN Horarios.DNI_Profesor%TYPE, 
v_DNI_Alumno IN Horarios.DNI_Alumno%TYPE, v_Id_Curso IN Horarios.Id_Curso%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          UPDATE Horarios SET Hora_Inicio = v_Hora_Inicio, Hora_Fin = v_Hora_Fin, Dia = v_Dia, DNI_Profesor = v_DNI_Profesor, DNI_Alumno = v_DNI_Alumno, Id_Curso = v_Id_Curso WHERE Id_Horario = v_Id_Horario;
          SELECT * INTO v_Horarios FROM Horarios WHERE Id_Horario = v_Id_Horario;
          IF(v_Horarios.Hora_Inicio != v_Hora_Inicio AND v_Horarios.Hora_Fin != v_Hora_Fin AND v_Horarios.Dia != v_Dia AND v_Horarios.DNI_Profesor != v_DNI_Profesor AND v_Horarios.DNI_Alumno != v_DNI_Alumno AND v_Horarios.Id_Curso != v_Id_Curso) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END actualizar;
PROCEDURE eliminar (nombrePrueba VARCHAR2, v_Id_Horario IN Horarios.Id_Horario%TYPE, salidaEsperada BOOLEAN)
      IS
          v_NumHorarios NUMBER := 0;
      BEGIN
          DELETE FROM Horarios WHERE Id_Horario = v_Id_Horario;
          SELECT COUNT(*) INTO v_NumHorarios FROM Horarios WHERE Id_Horario = v_Id_Horario;
          IF (v_NumHorarios != 0) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END eliminar;
END;
/

--Curso Alumno
CREATE OR REPLACE PACKAGE BODY PCK_Cursos_Alumnos
AS
CURSOR C IS
    SELECT * FROM Cursos_Alumnos;
    v_Salida BOOLEAN := TRUE;
    v_Cursos_Alumnos Cursos_Alumnos%ROWTYPE;
PROCEDURE Inicializar
IS
BEGIN
   DELETE FROM Cursos_Alumnos;
END Inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Cursos_Alumnos;
DBMS_OUTPUT.PUT_LINE(RPAD('DNI Alumno:', 25) || RPAD('Id Curso Alumno:', 25) || RPAD('Fecha Alta:', 25) || RPAD('Fecha Baja:', 25) || RPAD('Id Curso:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 125, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Cursos_Alumnos.DNI_Alumno, 25) || RPAD(v_Cursos_Alumnos.Id_Curso_Alumno, 25) || RPAD(v_Cursos_Alumnos.Fecha_Alta, 25) || RPAD(v_Cursos_Alumnos.Fecha_Baja, 25) || RPAD(v_Cursos_Alumnos.Id_Curso, 25));
FETCH C INTO v_Cursos_Alumnos;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE Insertar 
(nombrePrueba VARCHAR2, v_Fecha_Alta IN Cursos_Alumnos.Fecha_Alta%TYPE, v_Fecha_Baja IN Cursos_Alumnos.Fecha_Baja%TYPE, 
v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, v_DNI_Alumno IN Cursos_Alumnos.DNI_Alumno%TYPE, v_Id_Curso IN Cursos_Alumnos.Id_Curso%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
INSERT INTO Cursos_Alumnos (ID_CURSO_ALUMNO, FECHA_ALTA, FECHA_BAJA, DNI_ALUMNO, ID_CURSO) VALUES (v_ID_CURSO_ALUMNO, v_FECHA_ALTA, v_FECHA_BAJA, v_DNI_ALUMNO, v_ID_CURSO);
SELECT * INTO v_Cursos_Alumnos FROM Cursos_Alumnos WHERE ID_CURSO_ALUMNO = v_ID_CURSO_ALUMNO;
IF v_Cursos_Alumnos.FECHA_ALTA != v_FECHA_ALTA AND v_Cursos_Alumnos.FECHA_BAJA != v_FECHA_BAJA AND v_Cursos_Alumnos.DNI_ALUMNO != v_DNI_ALUMNO AND v_Cursos_Alumnos.ID_CURSO != v_ID_CURSO
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Fecha_Alta IN Cursos_Alumnos.Fecha_Alta%TYPE, v_Fecha_Baja IN Cursos_Alumnos.Fecha_Baja%TYPE, 
v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, v_DNI_Alumno IN Cursos_Alumnos.DNI_Alumno%TYPE, v_Id_Curso IN Cursos_Alumnos.Id_Curso%TYPE, salidaEsperada BOOLEAN)
IS
BEGIN
UPDATE Cursos_Alumnos SET FECHA_ALTA = v_FECHA_ALTA, FECHA_BAJA = v_FECHA_BAJA, DNI_ALUMNO = v_DNI_ALUMNO, ID_CURSO = v_ID_CURSO WHERE ID_CURSO_ALUMNO = v_ID_CURSO_ALUMNO;
SELECT * INTO v_Cursos_Alumnos FROM Cursos_Alumnos WHERE ID_CURSO_ALUMNO = v_ID_CURSO_ALUMNO;
IF v_Cursos_Alumnos.FECHA_ALTA != v_FECHA_ALTA AND v_Cursos_Alumnos.FECHA_BAJA != v_FECHA_BAJA AND v_Cursos_Alumnos.DNI_ALUMNO != v_DNI_ALUMNO AND v_Cursos_Alumnos.ID_CURSO != v_ID_CURSO
   THEN v_Salida := FALSE;
   END IF;
   COMMIT;
   DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
   EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
          ROLLBACK;
END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE, salidaEsperada BOOLEAN)
IS
     v_NumCursoAlumno NUMBER := 0;
BEGIN
      DELETE FROM Cursos_Alumnos WHERE ID_CURSO_ALUMNO = v_ID_CURSO_ALUMNO;
      SELECT COUNT (*) INTO v_NumCursoAlumno FROM Cursos_Alumnos WHERE ID_CURSO_ALUMNO = v_ID_CURSO_ALUMNO;
      IF v_NumCursoAlumno != 0 THEN 
          v_Salida := FALSE;
          END IF;
          COMMIT;
            DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
              EXCEPTION
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                    ROLLBACK;
      END Eliminar;
END;
/
/*
--Tabla Curso_Profesor:
CREATE OR REPLACE PACKAGE BODY PCK_CursoProfesores
AS
    CURSOR C IS
        SELECT * FROM Cursos_Profesores;
    v_Salida BOOLEAN := TRUE;
    v_Cursos_Profesores Cursos_Profesores%ROWTYPE;
PROCEDURE inicializar
    IS
    BEGIN
        DELETE FROM Cursos_Profesores;
    END inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Cursos_Profesores;
DBMS_OUTPUT.PUT_LINE(RPAD('DNI Profesor:', 25) || RPAD('Id Curso Profesor:', 25) || RPAD('Id Curso:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Cursos_Profesores.DNI_Profesor, 25) || RPAD(v_Cursos_Profesores.Id_Curso_Profesor, 25) || RPAD(v_Cursos_Profesores.Id_Curso, 25));
FETCH C INTO v_Cursos_Profesores;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE insertar (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, 
v_DNI_Profesor IN Cursos_Profesores.DNI_Profesor%TYPE, v_Id_Curso IN Cursos_Profesores.Id_Curso%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          INSERT INTO Cursos_Profesores(ID_CURSO_PROFESOR, DNI_PROFESOR, ID_CURSO) 
          VALUES (v_Id_Curso_Profesor, v_DNI_Profesor, v_Id_Curso);
          SELECT * INTO v_Cursos_Profesores FROM Cursos_Profesores WHERE Id_Curso_Profesor = v_Id_Curso_Profesor;
          IF(v_Cursos_Profesores.Id_Curso_Profesor != v_Id_Curso_Profesor AND v_Cursos_Profesores.DNI_Profesor != v_DNI_Profesor AND v_Cursos_Profesores.Id_Curso != v_Id_Curso) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END insertar;
PROCEDURE actualizar (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, 
v_DNI_Profesor IN Cursos_Profesores.DNI_Profesor%TYPE, v_Id_Curso IN Cursos_Profesores.Id_Curso%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          UPDATE Cursos_Profesores SET Id_Curso_Profesor = v_Id_Curso_Profesor, DNI_Profesor = v_DNI_Profesor, Id_Curso = v_Id_Curso WHERE Id_Curso_Profesor = v_Id_Curso_Profesor;
          SELECT * INTO v_Cursos_Profesores FROM Cursos_Profesores WHERE Id_Curso_Profesor = v_Id_Curso_Profesor;
          IF(v_Cursos_Profesores.Id_Curso_Profesor != v_Id_Curso_Profesor AND v_Cursos_Profesores.DNI_Profesor != v_DNI_Profesor AND v_Cursos_Profesores.Id_Curso != v_Id_Curso) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END actualizar;
PROCEDURE eliminar (nombrePrueba VARCHAR2, v_Id_Curso_Profesor IN Cursos_Profesores.Id_Curso_Profesor%TYPE, salidaEsperada BOOLEAN)
      IS
          v_NumCursosProfesores NUMBER := 0;
      BEGIN
          DELETE FROM Cursos_Profesores WHERE Id_Curso_Profesor = v_Id_Curso_Profesor;
          SELECT COUNT(*) INTO v_NumCursosProfesores FROM Cursos_Profesores WHERE Id_Curso_Profesor = v_Id_Curso_Profesor;
          IF (v_NumCursosProfesores != 0) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END eliminar;
END;
/
*/
--Tabla Cursos:
CREATE OR REPLACE PACKAGE BODY PCK_Cursos
AS
    CURSOR C IS
        SELECT * FROM Cursos;
    v_Salida BOOLEAN := TRUE;
    v_Cursos Cursos%ROWTYPE;
PROCEDURE inicializar
    IS
    BEGIN
        DELETE FROM Cursos;
    END inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Cursos;
DBMS_OUTPUT.PUT_LINE(RPAD('Id Curso:', 25) ||  RPAD('Fecha Inicio:', 25) || RPAD('Fecha Fin:', 25) || RPAD('Número de alumnos:', 25) || RPAD('Academia:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 125, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Cursos.Id_Curso, 25) ||  RPAD(v_Cursos.Fecha_Inicio, 25) || RPAD(v_Cursos.Fecha_Fin, 25) || RPAD(v_Cursos.Num_Alumnos, 25) || RPAD(v_Cursos.Id_Academia, 25));
FETCH C INTO v_Cursos;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE insertar (nombrePrueba VARCHAR2, v_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE, v_Fecha_Fin IN Cursos.Fecha_Fin%TYPE, v_Num_Alumnos IN Cursos.Num_Alumnos%TYPE, 
         v_Id_Curso IN Cursos.Id_Curso%Type, v_Id_Academia IN Cursos.Id_Academia%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          INSERT INTO Cursos(FECHA_INICIO, FECHA_FIN, NUM_ALUMNOS, ID_CURSO, ID_ACADEMIA) 
          VALUES (v_Fecha_Inicio, v_Fecha_Fin, v_Num_Alumnos, v_Id_Curso, v_Id_Academia);
          SELECT * INTO v_Cursos FROM Cursos WHERE Id_Curso = v_Id_Curso;
          IF(v_Cursos.Fecha_Inicio != v_Fecha_Inicio AND v_Cursos.Fecha_Fin != v_Fecha_Fin AND v_Cursos.Num_Alumnos != v_Num_Alumnos AND v_Cursos.Id_Curso != v_Id_Curso AND v_Cursos.Id_Academia != v_Id_Academia) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END insertar;
PROCEDURE actualizar (nombrePrueba VARCHAR2, v_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE, v_Fecha_Fin IN Cursos.Fecha_Fin%TYPE, 
        v_Num_Alumnos IN Cursos.Num_Alumnos%TYPE, v_Id_Curso IN Cursos.Id_Curso%Type, v_Id_Academia IN Cursos.Id_Academia%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          UPDATE Cursos SET Fecha_Inicio = v_Fecha_Inicio, Fecha_Fin = v_Fecha_Fin, Num_Alumnos = v_Num_Alumnos, Id_Curso = v_Id_Curso, Id_Academia = v_Id_Academia WHERE Id_Curso = v_Id_Curso;
          SELECT * INTO v_Cursos FROM Cursos WHERE Id_Curso = v_Id_Curso;
          IF(v_Cursos.Fecha_Inicio != v_Fecha_Inicio AND v_Cursos.Fecha_Fin != v_Fecha_Fin AND v_Cursos.Num_Alumnos != v_Num_Alumnos AND v_Cursos.Id_Curso != v_Id_Curso AND v_Cursos.Id_Academia != v_Id_Academia) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END actualizar;
PROCEDURE eliminar (nombrePrueba VARCHAR2, v_Id_Curso IN Cursos.Id_Curso%TYPE, salidaEsperada BOOLEAN)
      IS
          v_NumCursos NUMBER := 0;
      BEGIN
          DELETE FROM Cursos WHERE Id_Curso = v_Id_Curso;
          SELECT COUNT(*) INTO v_NumCursos FROM Cursos WHERE Id_Curso = v_Id_Curso;
          IF (v_NumCursos != 0) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END eliminar;
END;
/

--Tabla Academias:
CREATE OR REPLACE PACKAGE BODY PCK_Academias
AS
    CURSOR C IS
        SELECT * FROM Academias;
    v_Salida BOOLEAN := TRUE;
    v_Academias Academias%ROWTYPE;
PROCEDURE inicializar
    IS
    BEGIN
        DELETE FROM Academias;
    END inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Academias;
DBMS_OUTPUT.PUT_LINE(RPAD('Id Academia:', 25) || RPAD('Lugar:', 25) || RPAD('Numero de aulas:', 25) || RPAD('Teléfono:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Academias.Id_Academia, 25) || RPAD(v_Academias.Lugar, 25) || RPAD(v_Academias.Aulas, 25) || RPAD(v_Academias.Telefono, 25));
FETCH C INTO v_Academias;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Lugar IN Academias.Lugar%TYPE, v_Aulas IN Academias.Aulas%TYPE, v_Id_Academia IN Academias.Id_Academia%TYPE,
v_Telefono IN Academias.Telefono%TYPE,salidaEsperada BOOLEAN)
      IS
      BEGIN
          INSERT INTO Academias(LUGAR, AULAS, ID_ACADEMIA, TELEFONO) 
          VALUES (v_Lugar, v_Aulas, v_Id_Academia, v_Telefono);
          SELECT * INTO v_Academias FROM Academias WHERE Id_Academia = v_Id_Academia;
          IF(v_Academias.Lugar != v_Lugar AND v_Academias.Aulas != v_Aulas AND v_Academias.Telefono != v_Telefono) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Lugar IN Academias.Lugar%TYPE, v_Aulas IN Academias.Aulas%TYPE, v_Id_Academia IN Academias.Id_Academia%TYPE,
v_Telefono IN Academias.Telefono%TYPE, salidaEsperada BOOLEAN)
      IS
      BEGIN
          UPDATE Academias SET Lugar = v_Lugar, Aulas = v_Aulas, Id_Academia = v_Id_Academia, Telefono = v_Telefono WHERE Id_Academia = v_Id_Academia;
          SELECT * INTO v_Academias FROM Academias WHERE Id_Academia = v_Id_Academia;
          IF(v_Academias.Lugar != v_Lugar AND v_Academias.Aulas != v_Aulas AND v_Academias.Telefono != v_Telefono) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Id_Academia IN Academias.Id_Academia%TYPE, salidaEsperada BOOLEAN)
      IS
          v_NumAcademias NUMBER := 0;
      BEGIN
          DELETE FROM Academias WHERE Id_Academia = v_Id_Academia;
          SELECT COUNT(*) INTO v_NumAcademias FROM Academias WHERE Id_Academia = v_Id_Academia;
          IF (v_NumAcademias != 0) THEN
              v_Salida := FALSE;
          END IF;
          COMMIT;
          DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(v_Salida, salidaEsperada));
          EXCEPTION
              WHEN OTHERS THEN
                  DBMS_OUTPUT.PUT_LINE(nombrePrueba || ':' || ASSERT_EQUALS(FALSE, salidaEsperada));
                  ROLLBACK;
      END eliminar;
END;
/

--Tabla Examenes
CREATE OR REPLACE PACKAGE BODY PCK_Examenes
    AS
    CURSOR C IS
        SELECT * FROM Examenes;
    v_Salida BOOLEAN := TRUE;
    v_Examenes Examenes%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Examenes;
    END Inicializar;
PROCEDURE Consultar
IS
BEGIN
OPEN C;
FETCH C INTO v_Examenes;
DBMS_OUTPUT.PUT_LINE(RPAD('Id Curso:', 25) || RPAD('Id Examen:', 25) || RPAD('Nivel Examen:', 25) || RPAD('Tipo Examen:', 25) || RPAD('Fecha Pago:', 25)
|| RPAD('Fecha Examen:', 25)|| RPAD('Lugar:', 25));
DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
WHILE C%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(v_Examenes.Id_Curso, 25) || RPAD(v_Examenes.Id_Examen, 25) || RPAD(v_Examenes.Nivel_Examen, 25) || RPAD(v_Examenes.Tipo_Examen, 25)
|| RPAD(v_Examenes.Fecha_Pago, 25) || RPAD(v_Examenes.Fecha, 25) || RPAD(v_Examenes.Lugar, 25));
FETCH C INTO v_Examenes;
END LOOP;
CLOSE C;
END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Tipo_Examen IN EXAMENES.TIPO_EXAMEN%TYPE, v_Nivel_Examen IN EXAMENES.NIVEL_EXAMEN%TYPE,
v_Fecha_Pago IN EXAMENES.FECHA_PAGO%TYPE, v_Lugar IN EXAMENES.LUGAR%TYPE, v_Fecha IN EXAMENES.FECHA%TYPE, v_Id_Curso IN EXAMENES.ID_CURSO%TYPE,
v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Examenes (TIPO_EXAMEN, NIVEL_EXAMEN, FECHA_PAGO, LUGAR, FECHA, ID_CURSO, ID_EXAMEN)
        VALUES (v_Tipo_Examen, v_Nivel_Examen, v_Fecha_Pago, v_Lugar, v_Fecha, v_Id_Curso, v_Id_Examen);
        SELECT * INTO v_Examenes FROM Examenes WHERE Id_Examen = v_Id_Examen;
        IF v_Examenes.Tipo_Examen != v_Tipo_Examen AND v_Examenes.Nivel_Examen != v_Nivel_Examen AND v_Examenes.Fecha_Pago != v_Fecha_Pago
        AND v_Examenes.Lugar != v_Lugar AND v_Examenes.Fecha != v_Fecha AND v_Examenes.Id_Curso != v_Id_Curso THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Tipo_Examen IN EXAMENES.TIPO_EXAMEN%TYPE, v_Nivel_Examen IN EXAMENES.NIVEL_EXAMEN%TYPE,
v_Fecha_Pago IN EXAMENES.FECHA_PAGO%TYPE, v_Lugar IN EXAMENES.LUGAR%TYPE, v_Fecha IN EXAMENES.FECHA%TYPE, v_Id_Curso IN EXAMENES.ID_CURSO%TYPE,
v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
    UPDATE Examenes SET Tipo_Examen = v_Tipo_Examen, Nivel_Examen = v_Nivel_Examen, Fecha_Pago = v_Fecha_Pago, Lugar = v_Lugar,
    Fecha = v_Fecha, Id_Curso = v_Id_Curso WHERE Id_Examen = v_Id_Examen;
     SELECT * INTO v_Examenes FROM Examenes WHERE Id_Examen = v_Id_Examen;
        IF v_Examenes.Tipo_Examen != v_Tipo_Examen AND v_Examenes.Nivel_Examen != v_Nivel_Examen AND v_Examenes.Fecha_Pago != v_Fecha_Pago
        AND v_Examenes.Lugar != v_Lugar AND v_Examenes.Fecha != v_Fecha AND v_Examenes.Id_Curso != v_Id_Curso THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2,  v_Id_Examen IN EXAMENES.ID_EXAMEN%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumExamenes NUMBER := 0;
    BEGIN
        DELETE FROM Examenes WHERE Id_Examen = v_Id_Examen;
        IF v_NumExamenes != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
          WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
              ROLLBACK;
    END Eliminar;
END;
/