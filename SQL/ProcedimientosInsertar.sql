--Insertar Academia:
CREATE OR REPLACE PROCEDURE INSERTAR_ACADEMIA
  (P_Lugar IN Academias.Lugar%TYpe,
  P_Aulas IN Academias.Aulas%TYpe,
  P_Id_Academia IN Academias.Id_Academia%TYpe,
  P_Telefono IN Academias.Telefono%TYpe
  ) IS
BEGIN
  INSERT INTO Academias(Lugar,Aulas,Id_Academia,Telefono)
  VALUES (P_Lugar,P_Aulas,P_Id_Academia,P_Telefono);
END;
/

--Insertar Alumno:
CREATE OR REPLACE PROCEDURE INSERTAR_USUARIO
  (P_DNI IN Usuarios.DNI_Usuario%TYPE,
   P_NOM IN Usuarios.Nombre%TYPE,
   P_APE IN Usuarios.Apellidos%TYPE,
   P_EDAD IN Usuarios.Edad%TYPE,
   P_LOCALIDAD IN Usuarios.Localidad%TYPE,
   P_MOVIL IN Usuarios.Telefono_Movil%TYPE,
   P_FIJO IN Usuarios.Telefono_Fijo%TYPE,
   P_EMAIL IN Usuarios.Email%TYPE,
   P_PADMAD IN Usuarios.Nombre_Padre_Madre%TYPE,
   P_USUARIO IN Usuarios.Usuario%TYPE,
   P_PASS IN Usuarios.Pass%TYPE,
   P_TipoUsuario IN Usuarios.TipoUsuario%TYPE
   ) IS
BEGIN
  INSERT INTO Usuarios(DNI_Usuario,Nombre,Apellidos,Edad,Localidad,Telefono_Movil,Telefono_Fijo,Email,Nombre_Padre_Madre,Usuario,Pass,TipoUsuario)
  VALUES (P_DNI,P_NOM,P_APE,P_EDAD,P_LOCALIDAD,P_MOVIL,P_FIJO,P_EMAIL,P_PADMAD,P_USUARIO,P_PASS,P_TipoUsuario);
END;
/

--Insertar Curso:
CREATE OR REPLACE PROCEDURE INSERTAR_CURSO 
  (P_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE,
  P_Fecha_Fin IN Cursos.Fecha_Fin%TYPE,
  P_Num_Alumnos IN Cursos.Num_Alumnos%TYPE,
  P_Id_Curso IN Cursos.Id_Curso%TYPE,
  P_Id_Academia IN Cursos.Id_Academia%TYPE
  ) IS
BEGIN
  INSERT INTO Cursos(Fecha_Inicio,Fecha_Fin,Num_Alumnos,Id_Curso,Id_Academia)
  VALUES (P_Fecha_Inicio,P_Fecha_Fin,P_Num_Alumnos,P_Id_Curso,P_Id_Academia);
END;
/

--Insertar Curso_Alumno:
CREATE OR REPLACE PROCEDURE INSERTAR_CURSO_ALUMNO
  (P_Fecha_Alta IN Cursos_Alumnos.Fecha_Alta%TYPE,
  P_Fecha_Baja IN Cursos_Alumnos.Fecha_Baja%TYPE,
  P_Id_Curso_Alumno IN Cursos_Alumnos.Id_Curso_Alumno%TYPE,
  P_DNI_Usuario IN Cursos_Alumnos.DNI_Usuario%TYPE,
  P_Id_Curso IN Cursos_Alumnos.Id_Curso%TYPE
  ) IS
BEGIN
  INSERT INTO Cursos_Alumnos(Fecha_Alta,Fecha_Baja,Id_Curso_Alumno,DNI_Usuario,Id_Curso)
  VALUES (P_Fecha_Alta,P_Fecha_Baja,P_Id_Curso_Alumno,P_DNI_Usuario,P_Id_Curso);
END;
/

--Insertar Examen:
CREATE OR REPLACE PROCEDURE INSERTAR_EXAMEN
  (P_Tipo_Examen IN Examenes.Tipo_Examen%TYPE,
  P_Nivel_Examen IN Examenes.Nivel_Examen%TYPE,
  P_Fecha_Pago IN Examenes.Fecha_Pago%TYPE,
  P_Lugar IN Examenes.Lugar%TYPE,
  P_Fecha IN Examenes.Fecha%TYPE,
  P_Id_Curso IN Examenes.Id_Curso%TYPE,
  P_Id_Examen IN Examenes.Id_Examen%TYPE
  ) IS
BEGIN
  INSERT INTO Examenes(Tipo_Examen,Nivel_Examen,Fecha_Pago,Lugar,Fecha,Id_Curso,Id_Examen)
  VALUES (P_Tipo_Examen,P_Nivel_Examen,P_Fecha_Pago,P_Lugar,P_Fecha,P_Id_Curso,P_Id_Examen);
END;
/

--Insertar Horario_Alumno:
CREATE OR REPLACE PROCEDURE INSERTAR_HORARIO_ALUMNO
  (P_Hora_Inicio IN Horario_Alumno.Hora_Inicio%TYPE,
   P_Hora_Fin IN Horario_Alumno.Hora_Fin%TYPE,
   P_Dia IN Horario_Alumno.Dia%TYPE,
   P_Id_Horario IN Horario_Alumno.Id_Horario%TYPE,
   P_DNI_Usuario IN Horario_Alumno.DNI_Usuario%TYPE
   ) IS
BEGIN
  INSERT INTO Horario_Alumno(Hora_Inicio,Hora_Fin,Dia,Id_Horario,DNI_Usuario)
  VALUES (P_Hora_Inicio,P_Hora_Fin,P_Dia,P_Id_Horario,P_DNI_Usuario);
END;
/

--Insertar Horario_Curso:
CREATE OR REPLACE PROCEDURE INSERTAR_HORARIO_CURSO
  (P_Hora_Inicio IN Horario_Curso.Hora_Inicio%TYPE,
   P_Hora_Fin IN Horario_Curso.Hora_Fin%TYPE,
   P_Dia IN Horario_Curso.Dia%TYPE,
   P_Id_Horario IN Horario_Curso.Id_Horario%TYPE,
   P_Id_Curso IN Horario_Curso.Id_Curso%TYPE
   ) IS
BEGIN
  INSERT INTO Horario_Curso(Hora_Inicio,Hora_Fin,Dia,Id_Horario,Id_Curso)
  VALUES (P_Hora_Inicio,P_Hora_Fin,P_Dia,P_Id_Horario,P_Id_Curso);
END;
/

--Insertar Horario_Profesor:
CREATE OR REPLACE PROCEDURE INSERTAR_HORARIO_PROFESOR
  (P_Hora_Inicio IN Horario_Profesor.Hora_Inicio%TYPE,
   P_Hora_Fin IN Horario_Profesor.Hora_Fin%TYPE,
   P_Dia IN Horario_Profesor.Dia%TYPE,
   P_Id_Horario IN Horario_Profesor.Id_Horario%TYPE,
   P_DNI_Usuario IN Horario_Profesor.DNI_Usuario%TYPE,
   P_Id_Curso IN Horario_Profesor.Id_Curso%TYPE
   ) IS
BEGIN
  INSERT INTO Horario_Profesor(Hora_Inicio,Hora_Fin,Dia,Id_Horario,DNI_Usuario,Id_Curso)
  VALUES (P_Hora_Inicio,P_Hora_Fin,P_Dia,P_Id_Horario,P_DNI_Usuario,P_Id_Curso);
END;
/

--Insertar Recibo:
CREATE OR REPLACE PROCEDURE INSERTAR_RECIBO
  (P_Id_Recibo IN Recibos.Id_Recibo%TYPE,
   P_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE,
   P_Por_Pagar IN Recibos.Por_Pagar%TYPE,
   P_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE,
   P_Hermanos IN Recibos.Hermanos%TYPE,
   P_DNI_Usuario IN Recibos.DNI_Usuario%TYPE,
   P_Forma_Pago IN Recibos.Forma_Pago%TYPE
   ) IS
BEGIN
  INSERT INTO Recibos(Id_Recibo,Fecha_Recibo,Por_Pagar,Cuenta_Bancaria,Hermanos,DNI_Usuario,Forma_Pago)
  VALUES (P_Id_Recibo,P_Fecha_Recibo,P_Por_Pagar,P_Cuenta_Bancaria,P_Hermanos,P_DNI_Usuario,P_Forma_Pago);
END;
/