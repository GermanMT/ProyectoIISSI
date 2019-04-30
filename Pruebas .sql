SET SERVEROUTPUT ON;

--Pruebas de las Tablas:
--Pruebas de la Tabla Recibos:
BEGIN
PCK_Recibos.Inicializar;
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '01/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '01/01/2019', 100, 0, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '02/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '02/01/2019', 100, 0, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '03/01/2019', 50, 50, 0, 'efectivo', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '03/01/2019', 100, 0, 0, 'efectivo', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '04/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '04/01/2019', 100, 0, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '02/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '02/01/2019', 100, 0, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '07/01/2019', 50, 50, 0, 'efectivo', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '07/01/2019', 100, 0, 0, 'efectivo', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '06/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '06/01/2019', 100, 0, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '05/01/2019', 50, 50,  0,'domiciliaciónBancaria', 'ALED8540VBR3D6H4MS5DL98S',TRUE);
PCK_Recibos.Actualizar('Actualizar un recibo',SEC_Recibos.CURRVAL, '05/01/2019', 100, 0, 0, 'domiciliaciónBancaria', 'ALED8540VBR3D6H4MS5DL98S',TRUE);
PCK_Recibos.Insertar('Insertar un recibo que incumple la RN2',SEC_Recibos.NEXTVAL, '08/01/2019', 50, 50,  0, 'tarjetaCredito', NULL,FALSE);
PCK_Recibos.Insertar('Insertar un recibo',SEC_Recibos.NEXTVAL, '06/01/2019', 50, 50, 0, 'tarjetaCredito', NULL,TRUE);
PCK_Recibos.Eliminar('Eliminar un recibo',SEC_Recibos.CURRVAL,TRUE);
PCK_Recibos.Insertar('Insertar un recibo que incumple la RN5', SEC_Recibos.NEXTVAL, '05/01/2019', 45, 50, NULL, 2, 'efectivo', FALSE);
PCK_Recibos.Consultar;
END;
/

--Pruebas de la tabla Alumnos:
BEGIN 
PCK_Alumnos.Inicializar;     
PCK_Alumnos.Insertar('Insertar un alumno', '34657891H', 'Jose Antonio', 'Macías Portillo', 20, 'Puebla', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '32454891H', 'Mario', 'Vazquez Montoya', 20, 'Osuna', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34857891H', 'Pablo', 'Garcia Valero', 20, 'Sevilla', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '35657891H', 'Manuel', 'Perez Garcia', 20, 'Arahal', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '36657891H', 'Eugenio', 'Marquez Portillo', 20, 'Sevilla', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '37657891H', 'Javier', 'Cortes Moreno', 20, 'Écija', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '38657891H', 'Federico', 'Gonzalez Cabrero', 20, 'Sevilla', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '39657891H', 'Alfredo', 'Lopez Carmona', 20, 'Marchena', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34257891H', 'Tomas', 'Lopez Garcia', 20, 'Morón', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34357891H', 'Eduardo', 'Martin Sanchez', 20, 'Dos Hermanas', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34457891H', 'Amadeo', 'Sanchez Portillo', 20, 'Puebla', 8 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34537891V', 'Jesús', 'Reyes Moreno', 21, 'Puebla', 2 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '34227791N', 'Manuel', 'Martos Jimenez', 20, 'Arahal', 4 ,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno con DNI erroneo', '346578941B', 'Antonio', 'Jimenez Álvarez', 20, 'Osuna', 2,FALSE);
PCK_Alumnos.Insertar('Insertar un alumno con mismo DNI', '34657891H', 'Antonio Germán', 'Márquez Trujillo', 20, 'Repilado', 3,FALSE);
PCK_Alumnos.Insertar('Insertar un alumno con Apellido Null', '34653891M', 'Álvaro', NULL, 20, 'Arahal', 4,FALSE);
PCK_Alumnos.Insertar('Insertar un alumno con Nombre Null', '34657892T',NUll , 'Frías Balbuena', 19, 'Arahal', 5,FALSE);
PCK_Alumnos.Insertar('Insertar un alumno con Localidad Null', '14657891J', 'Francisco', 'Pérez García', 18, NULL , 6, TRUE);
PCK_Alumnos.Insertar('Insertar un alumno', '24657891K', 'Sergio', 'Gallego Barrero', 22, 'Écija', 7,TRUE);
PCK_Alumnos.Insertar('Insertar un alumno que incumple la RN1', '64657891L', '', 'Gonzalez Cabello', 19, 'Camas', 8,FALSE);
PCK_Alumnos.Actualizar('Actualizar nombre de alumno', '34657891H', 'Juan', 'Macías Portillo', 20, 'Puebla', 8 ,TRUE);
PCK_Alumnos.Actualizar('Actualizar apellidos de alumno', '14657891J', 'Francisco', 'Román Suarez', 18, NULL , 6 ,TRUE);
PCK_Alumnos.Actualizar('Actualizar localidad de alumno', '24657891K', 'Sergio', 'Gallego Barrero', 22, 'Coria del Río', 7,TRUE);
PCK_Alumnos.Eliminar('Eliminar un alumno', '14657891J', TRUE);
PCK_Alumnos.Consultar;
END;
/

--Pruebas de la tabla contacto alumnos.
BEGIN
PCK_Contactos_Alumno.Inicializar;
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno', '655555555', 'JoseAntonioMP@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '34657891H', TRUE);
PCK_Contactos_Alumno.Actualizar('Actualizar Teléfono del Contacto del Alumno', '688888888', 'JoseAntonioMP@hotmail.com', SEC_Contactos_Alumno.CURRVAL, '34657891H', TRUE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno', '644444444', 'SergioGB@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '24657891K', TRUE);
PCK_Contactos_Alumno.Actualizar('Actualizar Email del Contacto del Alumno', '644444444', 'SergioGB3@hotmail.com', SEC_Contactos_Alumno.CURRVAL, '24657891K', TRUE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno con Teléfono null', NULL, 'Alvaro845@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '34653891M', FALSE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno con DNI null', '666666666', 'FranciscoPG@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, NULL, FALSE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno con Teléfono erróneo', '6555555554', 'GermánMT@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '34657899G', FALSE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno con DNI erróneo', '677777777', 'MaríaDG@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '3465783491B', FALSE);
PCK_Contactos_Alumno.Insertar('Insertar Contacto del Alumno que imcumple la RN1', '', 'JesúsRM@hotmail.com', SEC_Contactos_Alumno.NEXTVAL, '34337891V', FALSE);
PCK_Contactos_Alumno.Eliminar('Eliminar Contacto del Alumno', SEC_Contactos_Alumno.CURRVAL, TRUE);
PCK_Contactos_Alumno.Consultar;
END;
/

--Pruebas de la Tabla Familia_Alumno:
BEGIN
PCK_Familias_Alumno.Inicializar;
PCK_Familias_Alumno.Insertar('Insertar la familia de un alumno', 'Manuel', SEC_Familias_Alumno.NEXTVAL, '34657891H', TRUE);
PCK_Familias_Alumno.Insertar('Insertar la familia de un alumno', 'Francisco', SEC_Familias_Alumno.NEXTVAL, '24657891K', TRUE);
PCK_Familias_Alumno.Insertar('Insertar la familia de un alumno', 'Jose Antonio', SEC_Familias_Alumno.NEXTVAL, '34537891V', TRUE);
PCK_Familias_Alumno.Insertar('Insertar la familia de un alumno', 'Maria y Pedro', SEC_Familias_Alumno.NEXTVAL, '34227791N', TRUE);
PCK_Familias_Alumno.Actualizar('Actualizar la familia de un alumno', 'Angela y Manuel', 1, '34657891H', TRUE);
PCK_Familias_Alumno.Eliminar('Eliminar la familia de un alumno',2,TRUE);
PCK_Familias_Alumno.Consultar;
END;
/

--Pruebas de la Tabla Profesores
BEGIN
PCK_Profesores.Inicializar;
PCK_Profesores.Insertar('Insertar un Profesor', '31873789H', 'Jose', 'Jimenez', 24,'Sevilla',350.00, 'B2', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor', '12736193K', 'Rebeca', 'Suarez', 22,'Sevilla',400.00, 'C2', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor', '17462198B', 'Andrea', 'Cobano', 42,'Paradas',20.00, 'B1', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor', '47555425G', 'Álvaro', 'Frías', 20,'Arahal',3000.00, 'C1', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor', '12345678G', 'Ruben', 'Cárdenas', 20,'Sevilla',300.00, 'B1', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor', '12345698G', 'German', 'Malo', 132,'Sevilla',300.00, 'B1', TRUE);
PCK_Profesores.Insertar('Insertar un Profesor con DNI erroneo', '4755542G', 'Álvaro', 'Frías', 20,'Arahal',3000.00, 'C1', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con DNI Erroneo', '475554255', 'Alfredo', 'Frías', 24,'Arahal',2000.00, 'C1', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con nombre null', '47555425G', null, 'Frías', 20,'Arahal',3000.00, 'C1', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con apellido null', '47555425', 'Álvaro', null, 20,'Arahal',3000.00, 'C1', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con edad 4 digitos', '12345678G', 'Ruben', 'Cárdenas', 1323,'Sevilla',300.00, 'B1', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con Nivel Ingles erroneo', '12345679G', 'Josan', 'Bueno', 132,'Sevilla',300.00, 'B', FALSE);
PCK_Profesores.Insertar('Insertar un Profesor con sueldo null', '02345698G', 'Alberto', 'Cortes', 22,'Sevilla',null, 'B1', FALSE);
PCK_Profesores.Actualizar('Actualizar un Profesor con sueldo', '47555425G', 'Álvaro', 'Frías', 20,'Arahal',27000.00, 'C1', TRUE);
PCK_Profesores.Actualizar('Actualizar un Profesor con nombre null', '47555425G', null, 'Frías', 20,'Arahal',3000.00, 'C1', FALSE);
PCK_Profesores.Actualizar('Actualizar un Profesor con apellidos null', '47555425G', 'Álvaro', null, 4000,'Arahal',27000.00, 'C1', FALSE);
PCK_Profesores.Actualizar('Actualizar un Profesor con sueldo null', '47555425G', 'Álvaro', 'Frías', 20,'Arahal',null, 'C1', FALSE);
PCK_Profesores.Actualizar('Actualizar un Profesor con Nivel de Ingles', '47555425G', 'Álvaro', 'Frías', 20,'Arahal',27000.00, 'C', FALSE);
PCK_Profesores.Eliminar('Eliminar Profesor','12345678G', TRUE);
PCK_Profesores.Consultar;
END;
/

--Pruebas de la Tabla Contacto_Profesor:
BEGIN

PCK_Contactos_Profesor.Inicializar;
PCK_Contactos_Profesor.Insertar('Insertar Contacto Profesor','674466777', 'alvarofb1998@gmail.com', SEC_Contactos_Profesor.NEXTVAL, '47555425G', TRUE);
PCK_Contactos_Profesor.Insertar('Insertar Contacto Profesor','674466555', 'german1998@gmail.com', SEC_Contactos_Profesor.NEXTVAL, '12345698G', TRUE);
PCK_Contactos_Profesor.Actualizar('Actualizar Contacto Profesor', '698765432', 'germal1999@gmail.com', SEC_Contactos_Profesor.CURRVAL, '12345698G', TRUE);
PCK_Contactos_Profesor.Insertar('Insertar Contacto Profesor con telefono null',null, 'german1998@gmail.com', SEC_Contactos_Profesor.NEXTVAL, '12345698G', FALSE);
PCK_Contactos_Profesor.Insertar('Insertar Contacto Profesor con Id_Contacto null)','674466555', 'german1998@gmail.com', null, '12345698G', FALSE);
PCK_Contactos_Profesor.Insertar('Insertar Contacto Profesor con DNI null','674466555', 'german1998@gmail.com', SEC_Contactos_Profesor.NEXTVAL, null, FALSE);
PCK_Contactos_Profesor.Eliminar('Eiminar Contacto Profesor', SEC_Contactos_Profesor.CURRVAL, TRUE);
PCK_Contactos_Profesor.Consultar;
END;
/

--Pruebas de la Tabla Dueño:
BEGIN
PCK_Dueños.Inicializar;
PCK_Dueños.Insertar('Insertar un dueño', '98765432G', 'Daniel', 'Frias', 35, 'Arahal', TRUE);
PCK_Dueños.Insertar('Insertar un dueño', '98765431G', 'Maribel', 'Gallego', 34, 'Arahal', TRUE);
PCK_Dueños.Insertar('Insertar un dueño', '98765438G', 'Jesus', 'Sanchez', 38, 'Arahal', TRUE);
PCK_Dueños.Insertar('Insertar un dueño con DNI null', null, 'Javi', 'Garcia', 25, 'Sevilla', FALSE);
PCK_Dueños.Insertar('Insertar un dueño con DNI mal', '12345678', 'Sergio', 'Garcia', 25, 'Sevilla', FALSE);
PCK_Dueños.Insertar('Insertar un dueño con nombre null', '23456789J', null, 'Garcia', 25, 'Sevilla', FALSE);
PCK_Dueños.Insertar('Insertar un dueño con apellido null)', '12348765P', 'Javi', null, 25, 'Sevilla', FALSE);
PCK_Dueños.Insertar('Insertar un dueño con edad 4 digitos', '14348765J', 'Javi', 'Balbuena', 2500, 'Sevilla', FALSE);
PCK_Dueños.Actualizar('Actualizar un dueño','98765432G', 'Hugo', 'Frias', 24, 'Sevilla',TRUE);
PCK_Dueños.Actualizar('Actualizar un dueño','98765431G', 'Maribel', 'Gallego', 30, 'Arahal',TRUE);
PCK_Dueños.Actualizar('Actualizar un dueño con DNI null', null, 'Maribel', 'Gallego', 30, 'Arahal',FALSE);
PCK_Dueños.Actualizar('Actualizar un dueño con DNI mal', '123456789', 'Maribel', 'Gallego', 30, 'Arahal',FALSE);
PCK_Dueños.Actualizar('Actualizar un dueño con nombre null', '98765431G', null, 'Gallego', 30, 'Arahal',FALSE);
PCK_Dueños.Actualizar('Actualizar un dueño con apellido null', '98765431G', 'Maribel', null, 30, 'Arahal',FALSE);
PCK_Dueños.Actualizar('Actualizar un dueño con Edad 4 digitos', '98765431G', 'Maribel', 'Gallego', 3000, 'Arahal',FALSE);
PCK_Dueños.Eliminar('Eliminar un dueño','98765432G' , TRUE);
PCK_Dueños.Consultar;
END;
/

--Pruebas Contactos Dueño
BEGIN
PCK_Contactos_Dueño.Inicializar;
PCK_Contactos_Dueño.Insertar('Insertar Contacto Dueño', '611222333', 'dueño1@gmail.com', SEC_Contactos_Dueño.NEXTVAL, '98765431G', TRUE);
PCK_Contactos_Dueño.Insertar('Insertar Contacto Dueño', '666777888', 'dueño2@gmail.com', SEC_Contactos_Dueño.NEXTVAL, '98765438G', TRUE);
PCK_Contactos_Dueño.Actualizar('Actualizar Contacto Dueño', '655666777', 'dueñoSegundo@gmail.com', SEC_Contactos_Dueño.CURRVAL, '98765438G', TRUE);
PCK_Contactos_Dueño.Actualizar('Actualizar Contacto Dueño con teléfono null', null, 'dueñoSegundo@gmail.com', SEC_Contactos_Dueño.CURRVAL, '98765438G', FALSE);
PCK_Contactos_Dueño.Actualizar('Actualizar Contacto Dueño Id_Contacto null', '655666777', 'dueñoSegundo@gmail.com', null, '98765438G', FALSE);
PCK_Contactos_Dueño.Actualizar('Actualizar Contacto Dueño con DNI null', '655666777', 'dueñoSegundo@gmail.com', SEC_Contactos_Dueño.CURRVAL, null, FALSE);
PCK_Contactos_Dueño.Insertar('Insertar Contacto Dueño con teléfono null', null, 'dueño2@gmail.com', SEC_Contactos_Dueño.NEXTVAL, '98765438G', FALSE);
PCK_Contactos_Dueño.Insertar('Insertar Contacto Dueño con Id Contacto null', '666777888', 'dueño2@gmail.com',null, '98765438G', FALSE);
PCK_Contactos_Dueño.Insertar('Insertar Contacto Dueño con DNI null', '666777888', 'dueño2@gmail.com', SEC_Contactos_Dueño.NEXTVAL, null, FALSE);
PCK_Contactos_Dueño.Eliminar('Eliminar Contacto Dueño', SEC_Contactos_Dueño.CURRVAL, TRUE);
PCK_Contactos_Dueño.Consultar;
END;
/

--Pruebas de la tabla nivelAdmin
BEGIN
PCK_NivelAdm.Inicializar;
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo', '29349422H', 'Pepe', 'Ramirez Vargas', 34, 'Arahal', 1500.00, TRUE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo', '29349499H', 'Pedro', 'Portillo Vargas', 31, 'Arahal', 1500.00, TRUE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo', '29349432L', 'Lola', 'Lopez Peña', 32, 'Arahal', 1500.00, TRUE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo con DNI erróneo', '292349422G', 'María', 'Santos Cabello', 35, 'Arahal', 1500.00, FALSE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo con Nombre null', '29349112F', NULL, 'Pérez Calderón', 31, 'Arahal', 1500.00, FALSE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo con Apellidos null', '29300422A', 'Fernando', NULL, 35, 'Osuna', 1500.00, FALSE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo con mismo DNI', '29349422H', 'Marcos', 'García Bellido', 32, 'Arahal', 1500.00, FALSE);
PCK_NivelAdm.Insertar('Insertar Nivel Administrativo con sueldo null', '29349444R', 'Esteban', 'Ruíz Vargas', 36, 'Arahal', NULL, FALSE);
PCK_NivelAdm.Actualizar('Actualizar Nombre del nivel administrativo', '29349422H', 'Julio', 'Ramirez Vargas', 34, 'Arahal', 1500.00, TRUE);
PCK_NivelAdm.Actualizar('Actualizar Localidad del nivel administrativo', '29349432L', 'Lola', 'Lopez Peña', 32, 'Puebla', 1500.00, TRUE);
PCK_NivelAdm.Actualizar('Actualizar Sueldo del nivel administrativo', '292349422G', 'María', 'Santos Cabello', 35, 'Arahal', 2000.00, FALSE);
PCK_NivelAdm.Eliminar('Eliminar nivel administrativo', '29349499H', TRUE);
PCK_NivelAdm.Consultar;
END;
/

--Pruebas de la tabla contacto nivel administrativo
BEGIN
PCK_Contactos_NivelAdmin.Inicializar;
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo', '651515151', 'PepeRV@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, '29349422H', TRUE);
PCK_Contactos_NivelAdmin.Actualizar('Actualizar Teléfono del Contacto del Nivel Administrativo', '691919191', 'PepeRV@hotmail.com', SEC_Contactos_nivelAdm.CURRVAL, '29349422H', TRUE);
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo', '641414141', 'LolaLP@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, '29349432L', TRUE);
PCK_Contactos_NivelAdmin.Actualizar('Actualizar Email del Contacto del Nivel Administrativo', '641414141', 'LolaLP2@hotmail.com', SEC_Contactos_nivelAdm.CURRVAL, '29349432L', TRUE);
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo con DNI null', '661616161', 'MaríaSF@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, NULL, FALSE);
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo con Teléfono null', NULL, 'RaúlDG@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, '29311422R', FALSE);
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo con DNI erróneo', '671717171', 'ManoloSW@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, '2934942322M', FALSE);
PCK_Contactos_NivelAdmin.Insertar('Insertar Contacto del Nivel Administrativo con Teléfono erróneo', '65151515', 'IvánCM@hotmail.com', SEC_Contactos_nivelAdm.NEXTVAL, '29229422P', FALSE);
PCK_Contactos_NivelAdmin.Eliminar('Eliminar Contacto del Nivel Administrativo', SEC_Contactos_nivelAdm.CURRVAL, TRUE);
PCK_Contactos_NivelAdmin.Consultar;
END;
/

--Pruebas Academias
BEGIN
PCK_Academias.Inicializar;
PCK_Academias.Insertar('Insertar una academia','Arahal',6, SEC_Academias.NEXTVAL,TRUE);
PCK_Academias.Insertar('Insertar una academia','Sevilla',10, SEC_Academias.NEXTVAL,TRUE);
PCK_Academias.Actualizar('Actualizar una academia','Sevilla',8, SEC_Academias.CURRVAL,TRUE);
PCK_Academias.Insertar('Insertar una academia','Paradas',8, SEC_Academias.NEXTVAL,TRUE);
PCK_Academias.Eliminar('Eliminar una academia', SEC_Academias.CURRVAL, TRUE);
PCK_Academias.Consultar;
END;
/

--Pruebas de la tabla Cursos:
BEGIN
PCK_Cursos.Inicializar;
PCK_Cursos.Insertar('Insertar un curso', '02/05/2018', '02/10/2018', 7, SEC_Cursos.NEXTVAL, 1, TRUE);
PCK_Cursos.Actualizar('Actualizar fecha fin de un curso', '02/05/2018', '02/11/2018', 7, SEC_Cursos.CURRVAL, 1, TRUE);
PCK_Cursos.Insertar('Insertar un curso', '02/05/2018', '02/10/2018', 8, SEC_Cursos.NEXTVAL, 1, TRUE);
PCK_Cursos.Actualizar('Actualizar fecha inicio de un curso', '02/04/2018', '02/10/2018', 8, SEC_Cursos.CURRVAL, 1, TRUE);
PCK_Cursos.Insertar('Insertar un curso', '02/05/2018', '02/10/2018', 8, SEC_Cursos.NEXTVAL, 1, TRUE);
PCK_Cursos.Eliminar('Eliminar un curso', SEC_Cursos.CURRVAL, TRUE);
PCK_Cursos.Insertar('Insertar un curso con una fecha de inicio mayor que de fin', '02/11/2018', '02/10/2018', 12, SEC_Cursos.NEXTVAL, 1, FALSE);
PCK_Cursos.Insertar('Insertar un curso con mas de trece alumnos', '02/05/2018', '02/10/2018', 13, SEC_Cursos.NEXTVAL, 1, FALSE);
PCK_Cursos.Consultar;
END;
/

--Pruebas de la Tabla Cursos_Alumnos:
BEGIN
PCK_Cursos_Alumnos.Inicializar;
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34657891H', 1, TRUE);
PCK_Cursos_Alumnos.Actualizar('Actualizar el curso de un alumno','07/05/2019', '07/09/2019', SEC_Cursos_Alumnos.CURRVAL, '34657891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '35657891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '32454891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34857891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34457891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '36657891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '37657891H', 1, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '38657891H', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '39657891H', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34257891H', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34357891H', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '24657891K', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34537891V', 2, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno', '07/05/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '34227791N', 2, TRUE);
PCK_Cursos_Alumnos.Eliminar('Eliminar el curso de un alumno', SEC_Cursos_Alumnos.CURRVAL, TRUE);
PCK_Cursos_Alumnos.Insertar('Insertar el curso de un alumno con fecha de inicio mayor que de fin', '07/09/2019', '07/08/2019', SEC_Cursos_Alumnos.NEXTVAL, '24657891K', 1, FALSE);
PCK_Cursos_Alumnos.Consultar;
END;
/

--Pruebas de la tabla Cursos_Profesores:
BEGIN 
PCK_CursoProfesores.Inicializar;
PCK_CursoProfesores.Insertar('Insertar el curso de un profesor', SEC_Cursos_Profesores.NEXTVAL, '12736193K', 1, TRUE);
PCK_CursoProfesores.Insertar('Insertar el curso de un profesor', SEC_Cursos_Profesores.NEXTVAL, '17462198B', 2, TRUE);
PCK_CursoProfesores.Insertar('Insertar el curso de un profesor', SEC_Cursos_Profesores.NEXTVAL, '31873789H', 1, TRUE);
PCK_CursoProfesores.Insertar('Insertar el curso de un profesor', SEC_Cursos_Profesores.NEXTVAL, '47555425G', 2, TRUE);
PCK_CursoProfesores.Actualizar('Actualizar el curso de un profesor', SEC_Cursos_Profesores.CURRVAL, '47555425G', 1, TRUE);
PCK_CursoProfesores.Eliminar('Eliminar el curso de un alumno', 1, TRUE);
PCK_CursoProfesores.Consultar;
END;
/

--Pruebas de la Tabla Horarios:
BEGIN
PCK_Horarios.Inicializar;
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Lunes', SEC_Horarios.NEXTVAL, '31873789H', null, 1,  TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Martes', SEC_Horarios.NEXTVAL, '31873789H', null, 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Miercoles', SEC_Horarios.NEXTVAL, '31873789H', null, 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Jueves', SEC_Horarios.NEXTVAL, '31873789H', null, 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Viernes', SEC_Horarios.NEXTVAL, '31873789H', null, 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Lunes', SEC_Horarios.NEXTVAL, null, '34537891V', 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Martes', SEC_Horarios.NEXTVAL, null, '34537891V', 1, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Miercoles', SEC_Horarios.NEXTVAL, null, '34537891V', 2, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Jueves', SEC_Horarios.NEXTVAL, null, '34537891V', 2, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '08:00:00','10:00:00','Viernes', SEC_Horarios.NEXTVAL, null, '34537891V', 2, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '12:00:00','14:00:00','Lunes',SEC_Horarios.NEXTVAL, null, '34657891H', 2, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '12:00:00','14:00:00','Martes',SEC_Horarios.NEXTVAL, null, '34657891H', 2, TRUE);
PCK_Horarios.Insertar('Insertar un horario', '12:00:00','14:00:00','Miercoles',SEC_Horarios.NEXTVAL, null, '34657891H', 1,TRUE);
PCK_Horarios.Insertar('Insertar un horario', '12:00:00','14:00:00','Jueves',SEC_Horarios.NEXTVAL, null, '34657891H',2 ,TRUE);
PCK_Horarios.Insertar('Insertar un horario', '12:00:00','14:00:00','Jueves',SEC_Horarios.NEXTVAL, null, '34657891H', 1, TRUE);
PCK_Horarios.Eliminar('Eliminar un Horario', 1, TRUE);
PCK_Horarios.Actualizar('Actualizar un Horario','12:00:00','14:00:00','Viernes',SEC_Horarios.CURRVAL, null, '34657891H', 1,TRUE);
PCK_Horarios.Insertar('Insertar un horario con fecha de fin menor que la de inicio','14:00:00','12:00:00', 'Viernes', SEC_Horarios.NEXTVAL, null, '34657891H', 2, FALSE);
PCK_Horarios.Consultar;
END;
/

--Pruebas de la tabla Examenes:
BEGIN
PCK_Examenes.Inicializar;
PCK_Examenes.Insertar('Insertar un examen','Aptis', 'B1', '01/07/2018', 'Sevilla', '01/08/2018', 1, SEC_Examenes.NEXTVAL, TRUE);
PCK_Examenes.Insertar('Insertar un examen','Trinity', 'B2', '01/07/2018', 'Sevilla', '01/08/2018', 2, SEC_Examenes.NEXTVAL, TRUE);
PCK_Examenes.Actualizar('Actualizar un examen', 'Cambridge', 'B2', '01/07/2018', 'Sevilla', '01/08/2018', 2, SEC_Examenes.CURRVAL, TRUE);
PCK_Examenes.Eliminar('Eliminar un examen', SEC_Examenes.CURRVAL, TRUE);
PCK_Examenes.Insertar('Insertar un examen con fecha de pago menor a un mes', 'Cambridge', 'B2', '15/07/2018', 'Sevilla', '01/08/2018', 2, SEC_Examenes.NEXTVAL, FALSE);
PCK_Examenes.Consultar;
END;
/
/*
--Pruebas de las Reglas Funcionales:
--Prueba de la RF1:
EXECUTE Cuota_Mensual('34657891H');
--Prueba de la RF2:
EXECUTE Lista_Alumno('31873789H');
--Prueba de la RF3:

--Prueba de la RF4:
EXECUTE Control_Pago('34337891V');
EXECUTE Control_Pago('34657891H');
--Prueba de la RF5:

--Prueba de la RF6:

--Prueba de la RF7:

--Prueba de la RF8:
EXECUTE Horario_Profesor('31873789H');
--Prueba de la RF9:
EXECUTE Horario_Alumno('34337891V');