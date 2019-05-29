--Inserciones de cursos:
BEGIN
INSERTAR_CURSO('20/05/2018','20/12/2018','Aptis','B1','G1');
INSERTAR_CURSO('20/03/2018','20/10/2018','Trinity','B2','G2');
INSERTAR_CURSO('20/02/2018','20/09/2018','Trinity','C1','G3');
INSERTAR_CURSO('20/01/2018','20/08/2018','Trinity','B1','G4');
COMMIT;
END;
/

--Inserciones de usuarios: 
BEGIN
INSERTAR_USUARIO_CON_CURSO('21015236K','Antonio German','M�rquez Trujillo','21', 'El Repilado', '619527721', '954841642', 'antonio-german-1@gmail.com', 'Jose Enrique', 'GermanOctavo', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('64562266L','Fernando','V�zquez Osorio','20', 'Arahal', '613463421', '954841642', 'fernando@gmail.com', 'Jose Enrique', 'Fernando', 'Fernando','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('90789636G','Antonio','Fernandez Cruz','18', 'Sevilla', '619527721', '954841642', 'antonio@gmail.com', 'Jose Enrique', 'Antonio', 'Antonio','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('65686546J','Manuel','Garcia Ferrer','18', 'Carmona', '619527721', '954841642', 'manuel@gmail.com', 'Jose Enrique', 'Manuel', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('46532632R','Gustavo','Marin Marquez','19', 'Sevilla', '619527721', '954841642', 'gustavo@gmail.com', 'Jose Enrique', 'Gustavo', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('45646546W','Marcos','M�rquez','20', 'Sevilla', '619527721', '954841642', 'marcos@gmail.com', 'Jose Enrique', 'Marcos', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('54265733N','Jos�','M�rquez','20', 'Arahal', '619527721', '954841642', 'jose@gmail.com', 'Jose Enrique', 'Jose', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('07583212M','Alicia','M�rquez','22', 'Arahal', '619527721', '954841642', 'alicia@gmail.com', 'Jose Enrique', 'Alicia', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('25477906H','Marta','M�rquez','23', 'Arahal', '619527721', '954841642', 'marta@gmail.com', 'Jose Enrique', 'Marta', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('42557752P','Maria','M�rquez','24', 'La Puebla De Cazalla', '619527721', '954841642', 'maria@gmail.com', 'Jose Enrique', 'Maria', '19german15','Alumno','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('32575787O','Lucia','M�rquez','24', 'Marchena', '619527721', '954841642', 'Lucia@gmail.com', 'Jose Enrique', 'Lucia', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('23465676E','Irene','M�rquez','22', 'Marchena', '619527721', '954841642', 'irene@gmail.com', 'Jose Enrique', 'Irene', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('83656328F','Teo','M�rquez','21', 'La Puebla De Cazalla', '619527721', '954841642', 'teo@gmail.com', 'Jose Enrique', 'Teo', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('73246222I','Pablo','M�rquez','21', 'Utrera', '619527721', '954841642', 'pablo@gmail.com', 'Jose Enrique', 'Pablo', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('76543687D','Estefania','M�rquez','22', 'Carmona', '619527721', '954841642', 'estefania@gmail.com', 'Jose Enrique', 'Estefania', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('54654523M','Claudia','M�rquez','23', 'Utrera', '619527721', '954841642', 'claudia@gmail.com', 'Jose Enrique', 'Claudia', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('65346366C','Sergio','M�rquez','23', 'Carmona', '619527721', '954841642', 'sergio@gmail.com', 'Jose Enrique', 'Sergio', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('99678644U','Nacho','M�rquez','34', 'La Puebla De Cazalla', '619527721', '954841642', 'nacho@gmail.com', 'Jose Enrique', 'Nacho', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('44998877A','Juan','M�rquez','18', 'Carmona', '619527721', '954841642', 'juan@gmail.com', 'Jose Enrique', 'Juan', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('12098735Q','Luis','M�rquez','18', 'Carmona', '619527721', '954841642', 'luis@gmail.com', 'Jose Enrique', 'Luis', '19german15','Alumno','Trinity','B2','G2');
INSERTAR_USUARIO_CON_CURSO('36324326S','Esteban','M�rquez','19', 'La Puebla De Cazalla', '619527721', '954841642', 'esteban@gmail.com', 'Jose Enrique', 'Esteban', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('22466322V','Jer�nimo','M�rquez','19', 'La Puebla De Cazalla', '619527721', '954841642', 'jer�nimo@gmail.com', 'Jose Enrique', 'Jeronimo', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('43685322B','Andrea','M�rquez','20', 'Utrera', '619527721', '954841642', 'andrea@gmail.com', 'Jose Enrique', 'Andrea', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('53276322Z','Sara','M�rquez','21', 'Utrera', '619527721', '954841642', 'sara@gmail.com', 'Jose Enrique', 'Sara', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('16431465F','Silvia','M�rquez','22', 'La Puebla De Cazalla', '619527721', '954841642', 'silvia@gmail.com', 'Jose Enrique', 'Silvia', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('25652543K','Eva Maria','M�rquez','23', 'Carmona', '619527721', '954841642', 'eva-maria@gmail.com', 'Jose Enrique', 'Eva_Maria', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('43266633P','Emilio','M�rquez','18', 'Arahal', '619527721', '954841642', 'emilio@gmail.com', 'Jose Enrique', 'Emilio', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('34654364P','Carmen','M�rquez','25', 'Marchena', '619527721', '954841642', 'carmen@gmail.com', 'Jose Enrique', 'Carmen', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('13541322I','Eugenio','M�rquez','27', 'Sevilla', '619527721', '954841642', 'eugenio@gmail.com', 'Jose Enrique', 'Eugenio', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('64326431Y','Salvador','M�rquez','31', 'Marchena', '619527721', '954841642', 'salvador@gmail.com', 'Jose Enrique', 'Salvador', '19german15','Alumno','Trinity','C1','G3');
INSERTAR_USUARIO_CON_CURSO('12564343O','Antonia','M�rquez','23', 'La Puebla De Cazalla', '619527721', '954841642', 'antonia@gmail.com', 'Jose Enrique', 'Antonia', '19german15','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO_CON_CURSO('12353252L','Cecilia','M�rquez','22', 'Arahal', '619527721', '954841642', 'cecilia@gmail.com', 'Jose Enrique', 'Cecilia', '19german15','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO_CON_CURSO('13251321D','�ngel','M�rquez','24', 'Marchena', '619527721', '954841642', 'angel@gmail.com', 'Jose Enrique', 'Angel', '19german15','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO_CON_CURSO('76558322H','Rafael','M�rquez','19', 'Sevilla', '619527721', '954841642', 'rafael@gmail.com', 'Jose Enrique', 'Rafael', '19german15','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO_CON_CURSO('78907890T','Antonio Jesus','M�rquez','30', 'Carmona', '619527721', '954841642', 'antonio-jesus@gmail.com', 'Jose Enrique', 'Antonio', '19german15','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO_CON_CURSO('75867742J','Alvaro','Frias Balbuena','21', 'Arahal', '619527721', '954841642', 'alvaro-231@gmail.com', 'Pedro', 'Alvarofb7', '123456','Alumno','Trinity','B1','G4');
INSERTAR_USUARIO('11111111K','Admin','Admin','1', 'Arahal', '698765432', '123456789', 'academia@gmail.com', 'Jose Enrique', 'Admin', 'administrador','Admin',NULL,'B1');
INSERTAR_USUARIO_CON_CURSO('49385388H','Jose Antonio','Macias','50', 'La Puebla De Cazalla', '619525521', '954822642', 'josanfcs98@gmail.com', '', 'JosanFCS', 'holita20','Profesor','Aptis','B1','G1');
INSERTAR_USUARIO_CON_CURSO('49385378H','Pedro','Macias Portillo','45', 'La Puebla De Cazalla', '619525521', '954822642', 'josanfcs98@gmail.com', '', 'JosanFCS2', 'holita20','Profesor','Trinity','B2','G2');
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
INSERTAR_RECIBO(SEC_Recibos.NEXTVAL, '2019/10/06','50', '', '0', 'No', '53276322Z', 'efectivo');
COMMIT;
END;
/

--Inserciones de horarios cursos:
BEGIN
INSERTAR_HORARIO_CURSO('16:00','17:00','Martes',SEC_Horario_Curso.NEXTVAL,'G1');
INSERTAR_HORARIO_CURSO('17:00','18:00','Miercoles',SEC_Horario_Curso.NEXTVAL,'G2');
COMMIT;
END;
/
