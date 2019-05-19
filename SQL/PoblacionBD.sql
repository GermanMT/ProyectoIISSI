--Insercion de academia:
BEGIN
INSERTAR_ACADEMIA('Arahal','5',SEC_Academias.NEXTVAL,'698765432');
COMMIT;
END;
/

--Inserciones de alumnos:
BEGIN
INSERTAR_USUARIO('21015236K','Antonio German','Márquez Trujillo','21', 'El Repilado', '619527721', '954841642', 'antonio-german-1@hotmail.com', 'Jose Enrique', 'GermanOctavo', '123456','Alumno');
INSERTAR_USUARIO('67843287L','Jose Antonio','Macias Portillo','20', 'La Puebla de Cazalla', '619527721', '954841642', 'jose-antonio@hotmail.com', 'Gustavo', 'JosanFCS', '123456','Alumno');
INSERTAR_USUARIO('75867742J','Alvaro','Frias Balbuena','22', 'Arahal', '619527721', '954841642', 'alvaro-231@hotmail.com', 'Pedro', 'AlavaroFB7', '123456','Alumno');
INSERTAR_USUARIO('22222222K','Octavio','Márquez','21', 'El Repilado', '619527721', '954841642', 'antonio-german-1@hotmail.com', 'Jose Enrique', 'Profesor', 'profesor','Profesor');
INSERTAR_USUARIO('11111111K','Admin','Admin','1', 'Arahal', '698765432', '123456789', 'academia@hotmail.com', 'Jose Enrique', 'Admin', 'administrador','Admin');
COMMIT;
END;
/

--Insercciones de cursos:
BEGIN
INSERTAR_CURSO('12/06/2018', '24/09/2018','10', SEC_Cursos.NEXTVAL, 1);
COMMIT;
END;
/

--Inserciones de horarios de alumnos:
BEGIN
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Lunes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('17:00', '19:00','Miercoles', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Viernes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
COMMIT;
END;
/

--Inserciones de horarios de profesores:
BEGIN
INSERTAR_HORARIO_PROFESOR('12:00', '14:00','Lunes', SEC_Horario_Profesor.NEXTVAL, '11111111K',1);
INSERTAR_HORARIO_PROFESOR('17:00', '19:00','Miercoles', SEC_Horario_Profesor.NEXTVAL, '11111111K',1);
INSERTAR_HORARIO_PROFESOR('12:00', '14:00','Viernes', SEC_Horario_Profesor.NEXTVAL, '11111111K',1);
COMMIT;
END;
/

--Inserciones de recibos:
BEGIN
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/05/06',500.00, '', 0, '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/06/06',500.00, '', 0, '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/07/06',500.00, '', 0, '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/08/06',500.00, '', 0, '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/09/06',500.00, '', 0, '21015236K', 'efectivo');
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/10/06',500.00, '', 0, '21015236K', 'efectivo');
COMMIT;
END;
/