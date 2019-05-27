--Insercion de academia:
BEGIN
INSERTAR_ACADEMIA('Arahal','5',SEC_Academias.NEXTVAL,'698765432');
COMMIT;
END;
/
--Insercion de usuarios:
BEGIN
INSERTAR_USUARIO('21015236K','Antonio German','Márquez','21', 'El Repilado', '619527721', '954841642', 'antonio-german-1@hotmail.com', 'Jose Enrique', 'GermanOctavo', '19german15','Alumno');
INSERTAR_USUARIO('67843287L','Jose Antonio','Macias Portillo','20', 'La Puebla de Cazalla', '619527721', '954841642', 'jose-antonio@hotmail.com', 'Gustavo', 'Josan', '123456','Alumno');
INSERTAR_USUARIO('75867742J','Alvaro','Frias Balbuena','22', 'Arahal', '619527721', '954841642', 'alvaro-231@hotmail.com', 'Pedro', 'Alvarofb7', '123456','Alumno');
INSERTAR_USUARIO('11111111K','Admin','Admin','1', 'Arahal', '698765432', '123456789', 'academia@hotmail.com', 'Jose Enrique', 'Admin', 'administrador','Admin');
INSERTAR_USUARIO('49385388H','Jose Antonio','Macias','20', 'La Puebla De Cazalla', '619525521', '954822642', 'josanfcs98@hotmail.com', '', 'JosanFCS', 'holita20','Profesor');
COMMIT;
END;
/

--Inserciones de horarios de alumnos:
BEGIN
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Lunes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('17:00', '19:00','Miercoles', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Viernes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Viernes', SEC_Horario_Alumno.NEXTVAL, '67843287L');
COMMIT;
END;
/

--Inserciones de cursos:
BEGIN
INSERTAR_CURSO('20/05/2018','20/12/2018','10',SEC_Cursos.NEXTVAL,SEC_Academias.CURRVAL);
INSERTAR_CURSO('20/03/2018','20/10/2018','12',SEC_Cursos.NEXTVAL,SEC_Academias.CURRVAL);
INSERTAR_CURSO('20/02/2018','20/09/2018','8',SEC_Cursos.NEXTVAL,SEC_Academias.CURRVAL);
INSERTAR_CURSO('20/01/2018','20/08/2018','11',SEC_Cursos.NEXTVAL,SEC_Academias.CURRVAL);
COMMIT;
END;
/

--Inserciones de cursos de alumnos
BEGIN
INSERTAR_CURSO_ALUMNO('13/04/2018','13/09/2018',SEC_Cursos_Alumnos.NEXTVAL,'21015236K',1);
INSERTAR_CURSO_ALUMNO('13/05/2018','13/10/2018',SEC_Cursos_Alumnos.NEXTVAL,'67843287L',SEC_Cursos.CURRVAL);
INSERTAR_CURSO_ALUMNO('13/06/2018','13/11/2018',SEC_Cursos_Alumnos.NEXTVAL,'75867742J',SEC_Cursos.CURRVAL);
COMMIT;
END;
/

--Inserciones de Horario para profesor:
BEGIN
INSERTAR_HORARIO_PROFESOR('16:00', '18:00', 'Martes',SEC_Horario_Profesor.NEXTVAL,SEC_Cursos.CURRVAL,'49385388H');
INSERTAR_HORARIO_PROFESOR('17:00', '19:00', 'Miercoles',SEC_Horario_Profesor.NEXTVAL,SEC_Cursos.CURRVAL,'49385388H');
INSERTAR_HORARIO_PROFESOR('15:00', '17:00', 'Jueves',SEC_Horario_Profesor.NEXTVAL,SEC_Cursos.CURRVAL,'49385388H');
COMMIT;
END;
/

--Inserciones de recibos:
BEGIN
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/05/06','50', '', '0', 'Si', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/06/06','50', '', '0', 'Si', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/07/06','50', '', '0', 'Si', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/08/06','50', '', '0', 'Si', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/09/06','50', '', '0', 'Si', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/10/06','50', '', '0', 'No', '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/10/06','50', '', '0', 'No', '67843287L', 'efectivo');
COMMIT;
END;
/

--SELECT DNI_USUARIO FROM USUARIOS WHERE (USUARIOS.USUARIO = 'GermanOctavo' AND USUARIOS.PASS = '19german15');
--SELECT * FROM RECIBOS WHERE (RECIBOS.DNI_USUARIO = '21015236K');