CREATE OR REPLACE PROCEDURE INSERTAR_ALUMNO 
  (P_DNI IN Alumnos.DNI_Alumno%TYPE,
   P_NOM IN Alumnos.Nombre%TYPE,
   P_APE IN Alumnos.Apellidos%TYPE,
   P_EDAD IN Alumnos.Edad%TYPE,
   P_LOCALIDAD IN Alumnos.Localidad%TYPE,
   P_MOVIL IN Alumnos.Telefono_Movil%TYPE,
   P_FIJO IN Alumnos.Telefono_Fijo%TYPE,
   P_EMAIL IN Alumnos.Email%TYPE,
   P_PADMAD IN Alumnos.Nombre_Padre_Madre%TYPE,
   P_USUARIO IN Alumnos.Usuario%TYPE,
   P_PASS IN Alumnos.Pass%TYPE
   ) IS
BEGIN
  INSERT INTO Alumnos(DNI_Alumno,Nombre,Apellidos,Edad,Localidad ,Telefono_Movil,Telefono_Fijo,Email,Nombre_Padre_Madre,Usuario,Pass)
  VALUES (P_DNI,P_NOM,P_APE,P_EDAD,P_LOCALIDAD,P_MOVIL,P_FIJO,P_EMAIL,P_PADMAD,P_USUARIO,P_PASS);
END;
/

CREATE OR REPLACE PROCEDURE INSERTAR_RECIBO
  (p_Id_Recibo IN Recibos.Id_Recibo%TYPE,
   P_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE,
   P_Por_Pagar IN Recibos.Por_Pagar%TYPE,
   P_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE,
   P_Hermanos IN Recibos.Hermanos%TYPE,
   P_DNI_Alumno IN Recibos.DNI_Alumno%TYPE,
   P_Forma_Pago IN Recibos.Forma_Pago%TYPE
   ) IS
BEGIN
  INSERT INTO Recibos(Id_Recibo,Fecha_Recibo,Por_Pagar,Cuenta_Bancaria,Hermanos,DNI_Alumno,Forma_Pago)
  VALUES (p_Id_Recibo,P_Fecha_Recibo,P_Por_Pagar,P_Cuenta_Bancaria,P_Hermanos,P_DNI_Alumno,P_Forma_Pago);
END;
/

BEGIN
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/05/29',500.00,  '', 0, '21015236K', 'efectivo');
COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE INSERTAR_RECIBO
  (p_Id_Recibo IN Recibos.Id_Recibo%TYPE,
   P_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE,
   P_Por_Pagar IN Recibos.Por_Pagar%TYPE,
   P_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE,
   P_Hermanos IN Recibos.Hermanos%TYPE,
   P_DNI_Alumno IN Recibos.DNI_Alumno%TYPE,
   P_Forma_Pago IN Recibos.Forma_Pago%TYPE
   ) IS
BEGIN
  INSERT INTO Recibos(Id_Recibo,Fecha_Recibo,Por_Pagar,Cuenta_Bancaria,Hermanos,DNI_Alumno,Forma_Pago)
  VALUES (p_Id_Recibo,P_Fecha_Recibo,P_Por_Pagar,P_Cuenta_Bancaria,P_Hermanos,P_DNI_Alumno,P_Forma_Pago);
END;
/

BEGIN
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/05/29',500.00,  '', 0, '21015236K', 'efectivo');
COMMIT;
END;
/

--Procedimiento del Requisito Funcional 1:
create or replace PROCEDURE Cuota_Mensual (v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE)
IS
  CURSOR C IS 
    SELECT DNI_Alumno, Nombre, Pagado, Por_Pagar, Hermanos FROM Alumnos NATURAL JOIN Recibos
    WHERE (DNI_Alumno = v_DNI_Alumno);
    v_Alumnos C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Alumnos;
  DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:',25) || RPAD('Pagado:', 25) || RPAD('Por_Pagar:',25));
  WHILE C%FOUND LOOP
    IF (v_Alumnos.Hermanos = 0) THEN
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI_Alumno,25) || RPAD(v_Alumnos.Nombre,25) || RPAD(v_Alumnos.Pagado, 25) || RPAD(v_Alumnos.Por_Pagar,25));
    ELSE 
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI_Alumno,25) || RPAD(v_Alumnos.Nombre,25) || RPAD(v_Alumnos.Pagado, 25) || RPAD(v_Alumnos.Por_Pagar - v_Alumnos.Por_Pagar*0.1,25));
    END IF;
  FETCH C INTO v_Alumnos;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 2:
create or replace PROCEDURE Lista_Registro (v_Id_Academia IN Academias.Id_Academia%TYPE)
IS
CURSOR C IS
  SELECT Id_Academia, DNI_Alumno FROM Academias NATURAL JOIN Cursos NATURAL JOIN Cursos_Alumnos
  WHERE Id_Academia = v_Id_Academia;
  v_Academias C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Academias;
  DBMS_OUTPUT.PUT_LINE(RPAD('DNI del alumno: ',20) || RPAD('Id de la academia: ', 20));
  WHILE C%FOUND LOOP
    IF(v_Academias.DNI_Alumno = null) THEN
    DBMS_OUTPUT.PUT_LINE('No hay alumnos en la academia');
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Academias.DNI_Alumno, 20) || RPAD(v_Academias.Id_Academia, 20));
    END IF;
  FETCH C INTO v_Academias;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 3:
create or replace PROCEDURE Control_Pago (v_DNI_Alumno IN Alumnos.DNI_Alumno%TYPE)
IS
  CURSOR C IS 
    SELECT DNI_Alumno, Forma_Pago, Cuenta_Bancaria FROM Alumnos NATURAL JOIN Recibos
    WHERE DNI_Alumno = v_DNI_Alumno;
    v_Alumnos C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Alumnos;
  DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Forma de pago:', 25));
  WHILE C%FOUND LOOP
    IF (v_Alumnos.Forma_Pago = 'domiciliaciónBancaria') THEN
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI_Alumno,25) || RPAD(v_Alumnos.Forma_Pago, 25) || RPAD('Cuenta Bancaria:' || v_Alumnos.Cuenta_Bancaria, 40));
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI_Alumno,25) || RPAD(v_Alumnos.Forma_Pago, 25));
  END IF;
  FETCH C INTO v_Alumnos;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 4:
create or replace PROCEDURE Lista_Profesores (v_Id_Academia IN Academias.Id_Academia%TYPE)
IS
  CURSOR C IS
    SELECT DNI_Profesor, Id_Academia FROM Academias NATURAL JOIN Cursos
    WHERE Id_Academia = v_Id_Academia;
    v_Academias C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Academias;
  DBMS_OUTPUT.PUT_LINE(RPAD('DNI Profesor: ', 20) || RPAD('Id Academia: ', 20));
  WHILE C%FOUND LOOP
    IF(v_Academias.Id_Academia = null) THEN
    DBMS_OUTPUT.PUT_LINE('No hay academias creadas');
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Academias.DNI_Profesor, 20) || RPAD(v_Academias.Id_Academia, 20));
    END IF;
  FETCH C INTO v_Academias;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 5:
create or replace PROCEDURE Cursos_Formados (v_Id_Academia IN Academias.Id_Academia%TYPE)
IS
 CURSOR C IS
  SELECT Id_Curso, Fecha_Inicio, Fecha_Fin, Num_Alumnos FROM Academias NATURAL JOIN Cursos
  WHERE Id_Academia = v_Id_Academia;
  v_Cursos C%ROWTYPE;
BEGIN
OPEN C;
  FETCH C INTO v_Cursos;
  DBMS_OUTPUT.PUT_LINE(RPAD('Id_Curso:', 30) || RPAD('Fecha de inicio:', 30) || RPAD('Fecha de fin:', 30) || RPAD('Número de Alumnos:', 30));
  WHILE C%FOUND LOOP
    IF(v_Cursos.Id_Curso = null) THEN
    DBMS_OUTPUT.PUT_LINE('No hay cursos creados');
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Cursos.Id_Curso,30) || RPAD(v_Cursos.Fecha_Inicio, 30) || RPAD(v_Cursos.Fecha_Fin, 30) || RPAD(v_Cursos.Num_Alumnos, 30));
  END IF;
  FETCH C INTO v_Cursos;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 6:
create or replace PROCEDURE Horario_Profesor (v_DNI_Profesor IN Profesores.DNI_Profesor%TYPE)
IS
  CURSOR C IS
    SELECT DNI_Profesor, Hora_Inicio, Hora_Fin, Dia FROM Horarios NATURAL JOIN Profesores WHERE DNI_Profesor = v_DNI_Profesor;
    v_Horarios C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Horarios;
    DBMS_OUTPUT.PUT_LINE(RPAD('DNI del Profesor: ', 20) || RPAD('Hora de Inicio: ', 20) || RPAD('Hora de Fin: ', 20) || RPAD('Dia: ', 20));
  WHILE C%FOUND LOOP
    IF(v_Horarios.DNI_Profesor = null) THEN
    DBMS_OUTPUT.PUT_LINE('No hay curso de profesores creados');
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Horarios.DNI_Profesor, 20) || RPAD(v_Horarios.Hora_Inicio, 20) || RPAD(v_Horarios.Hora_Fin, 20) || RPAD(v_Horarios.Dia, 20));
    END IF;
  FETCH C INTO v_Horarios;
  END LOOP;
  CLOSE C;
END;
/

--Procedimiento del Requisito Funcional 7:
create or replace PROCEDURE Horario_Alumno (v_DNI_Alumno IN Horarios.DNI_Alumno%TYPE)
IS
  CURSOR C IS
    SELECT DNI_Alumno, Hora_Inicio, Hora_Fin, Dia FROM Horarios NATURAL JOIN Alumnos WHERE DNI_Alumno = v_DNI_Alumno;
    v_Horarios C%ROWTYPE;
BEGIN
  OPEN C;
  FETCH C INTO v_Horarios;
  DBMS_OUTPUT.PUT_LINE(RPAD('DNI del Alumno: ', 30) || RPAD('Hora de Inicio: ', 30) || RPAD('Hora de Fin: ', 30) || RPAD('Dia: ', 30));
  WHILE C%FOUND LOOP
    IF(v_Horarios.DNI_Alumno = null) THEN
    DBMS_OUTPUT.PUT_LINE('No hay curso de alumnos creados');
    ELSE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_Horarios.DNI_Alumno, 30) || RPAD(v_Horarios.Hora_Inicio, 30) || RPAD(v_Horarios.Hora_Fin, 30) || RPAD(v_Horarios.Dia, 30));
    END IF;
  FETCH C INTO v_Horarios;
  END LOOP;
  CLOSE C;
END;
/