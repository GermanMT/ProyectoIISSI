--Insertar Usuario:
create or replace PROCEDURE INSERTAR_USUARIO 
  (P_DNI_Usuario IN Usuarios.DNI_Usuario%TYPE,
   P_Nombre IN Usuarios.Nombre%TYPE,
   P_Apellidos IN Usuarios.Apellidos%TYPE,
   P_Edad IN Usuarios.Edad%TYPE,
   P_Localidad IN Usuarios.Localidad%TYPE,
   P_TelefonoMovil IN Usuarios.Telefono_Movil%TYPE,
   P_TelefonoFijo IN Usuarios.Telefono_Fijo%TYPE,
   P_Email IN Usuarios.Email%TYPE,
   P_NombrePadreMadre IN Usuarios.Nombre_Padre_Madre%TYPE,
   P_Usuario IN Usuarios.Usuario%TYPE,
   P_Pass IN Usuarios.Pass%TYPE,
   P_TipoUsuario IN Usuarios.TipoUsuario%TYPE
   ) IS
BEGIN
  INSERT INTO Usuarios(DNI_Usuario,Nombre,Apellidos,Edad,Localidad ,Telefono_Movil,Telefono_Fijo,Email,Nombre_Padre_Madre,Usuario,Pass, TipoUsuario)
  VALUES (P_DNI_Usuario,P_Nombre,P_Apellidos,P_Edad,P_Localidad,P_TelefonoMovil,P_TelefonoFijo,P_Email,P_NombrePadreMadre,P_Usuario,P_Pass,P_TipoUsuario);
END;
/

--Insertar Curso:
CREATE OR REPLACE PROCEDURE INSERTAR_CURSO 
  (P_Fecha_Inicio IN Cursos.Fecha_Inicio%TYPE,
  P_Fecha_Fin IN Cursos.Fecha_Fin%TYPE,
  P_Tipo_Examen IN Cursos.Tipo_Examen%TYPE,
  P_Nivel_Examen IN Cursos.Nivel_Examen%TYPE,
  P_Id_Curso IN Cursos.Id_Curso%TYPE,
  P_DNI_Usuario IN Cursos.DNI_Usuario%TYPE
  ) IS
BEGIN
  INSERT INTO Cursos(Fecha_Inicio,Fecha_Fin,Tipo_Examen,Nivel_Examen, Id_Curso,DNI_Usuario)
  VALUES (P_Fecha_Inicio, P_Fecha_Fin, P_Tipo_Examen, P_Nivel_Examen, P_Id_Curso,P_DNI_Usuario);
END;
/

--Insertar Horario_Alumno:
CREATE OR REPLACE PROCEDURE INSERTAR_HORARIO_ALUMNO
  (P_Hora_Inicio IN Horario_Alumno.Hora_Inicio%TYPE,
   P_Hora_Fin IN Horario_Alumno.Hora_Fin%TYPE,
   P_Dia IN Horario_Alumno.Dia%TYPE,
   P_Id_Horario IN Horario_Alumno.Id_Horario%TYPE,
   P_DNI_Usuario IN Horario_Alumno.DNI_Usuario%TYPE,
   P_Id_Curso IN Horario_Alumno.Id_Curso%TYPE
   ) IS
BEGIN
  INSERT INTO Horario_Alumno(Hora_Inicio,Hora_Fin,Dia,Id_Horario,DNI_Usuario,Id_Curso)
  VALUES (P_Hora_Inicio,P_Hora_Fin,P_Dia,P_Id_Horario,P_DNI_Usuario,P_Id_Curso);
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
   P_Id_Curso IN Horario_Profesor.Id_Curso%TYPE,
   P_DNI_Usuario IN Horario_Profesor.DNI_Usuario%TYPE
   ) IS
BEGIN
  INSERT INTO Horario_Profesor(Hora_Inicio,Hora_Fin,Dia,Id_Horario,Id_Curso,DNI_Usuario)
  VALUES (P_Hora_Inicio,P_Hora_Fin,P_Dia,P_Id_Horario,P_Id_Curso,P_DNI_Usuario);
END;
/

--Insertar Recibo:
CREATE OR REPLACE PROCEDURE INSERTAR_RECIBO
  (P_Id_Recibo IN Recibos.Id_Recibo%TYPE,
   P_Fecha_Recibo IN Recibos.Fecha_Recibo%TYPE,
   P_Por_Pagar IN Recibos.Por_Pagar%TYPE,
   P_Cuenta_Bancaria IN Recibos.Cuenta_Bancaria%TYPE,
   P_Hermanos IN Recibos.Hermanos%TYPE,
   P_Pagado IN Recibos.Pagado%TYPE,
   P_DNI_Usuario IN Recibos.DNI_Usuario%TYPE,
   P_Forma_Pago IN Recibos.Forma_Pago%TYPE
   ) IS
BEGIN
  INSERT INTO Recibos(Id_Recibo,Fecha_Recibo,Por_Pagar,Cuenta_Bancaria,Hermanos,Pagado,DNI_Usuario,Forma_Pago)
  VALUES (P_Id_Recibo,P_Fecha_Recibo,P_Por_Pagar,P_Cuenta_Bancaria,P_Hermanos,P_Pagado,P_DNI_Usuario,P_Forma_Pago);
END;
/

--Quitar Alumno: 
CREATE OR REPLACE PROCEDURE QUITAR_USUARIO (DNI_Usuario_A_QUITAR IN Usuarios.DNI_Usuario%TYPE) AS
BEGIN
    DELETE FROM Horario_Alumno WHERE DNI_Usuario = DNI_Usuario_A_QUITAR;
    DELETE FROM Recibos WHERE DNI_Usuario = DNI_Usuario_A_QUITAR;
    DELETE FROM Usuarios WHERE DNI_Usuario = DNI_Usuario_A_QUITAR;
END;
/

--Modificar Alumno:
CREATE OR REPLACE PROCEDURE MODIFICAR_USUARIO 
(DNI_USU_A_MOD IN USUARIOS.DNI_USUARIO%TYPE,
 NOM_USU_A_MOD IN USUARIOS.NOMBRE%TYPE,
 APE_USU_A_MOD IN USUARIOS.APELLIDOS%TYPE,
 EDAD_A_MOD IN USUARIOS.EDAD%TYPE,
 LOCALIDAD_A_MOD IN USUARIOS.LOCALIDAD%TYPE,
 TELEFONO_MOVIL_A_MOD IN USUARIOS.TELEFONO_MOVIL%TYPE,
 TELEFONO_FIJO_A_MOD IN USUARIOS.TELEFONO_FIJO%TYPE,
 EMAIL_A_MOD IN USUARIOS.EMAIL%TYPE,
 NOMBRE_PADRE_MADRE_A_MOD IN USUARIOS.NOMBRE_PADRE_MADRE%TYPE) IS
BEGIN
  UPDATE USUARIOS
  SET NOMBRE=NOM_USU_A_MOD, APELLIDOS=APE_USU_A_MOD, EDAD=EDAD_A_MOD, LOCALIDAD=LOCALIDAD_A_MOD, TELEFONO_MOVIL=TELEFONO_MOVIL_A_MOD, TELEFONO_FIJO=TELEFONO_FIJO_A_MOD, EMAIL=EMAIL_A_MOD, NOMBRE_PADRE_MADRE=NOMBRE_PADRE_MADRE_A_MOD
  WHERE DNI_USUARIO = DNI_USU_A_MOD;
END;
/
