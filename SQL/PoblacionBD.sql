--Inserciones de Alumnos:
BEGIN
INSERTAR_ALUMNO('21015236K','Antonio German','Márquez','21', 'El Repilado', '619527721', '954841642', 'antonio-german-1@hotmail.com', 'Jose Enrique', 'GermanOctavo', '19german15');
COMMIT;
END;
/

--Inserciones de horarios de Alumnos:
BEGIN
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Lunes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('17:00', '19:00','Miercoles', SEC_Horario_Alumno.NEXTVAL, '21015236K');
INSERTAR_HORARIO_ALUMNO('12:00', '14:00','Viernes', SEC_Horario_Alumno.NEXTVAL, '21015236K');
COMMIT;
END;
/

--Inserciones de Recibos:
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