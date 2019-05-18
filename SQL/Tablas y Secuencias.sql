--Borrado de tablas:
DROP TABLE Examenes;
DROP TABLE Horario_Alumno;
DROP TABLE Horario_Profesor;
DROP TABLE Horario_Curso;
DROP TABLE Cursos_Alumnos;
DROP TABLE Cursos;
--DROP TABLE Profesores;
DROP TABLE Recibos;
DROP TABLE Usuarios;
DROP TABLE Academias;

--Creaci�n de tablas:
CREATE TABLE Academias(
Lugar VARCHAR2(20) NOT NULL,
Aulas INTEGER NOT NULL,
Id_Academia INTEGER NOT NULL,
Telefono CHAR(9),
PRIMARY KEY(Id_Academia)
);

CREATE TABLE Usuarios(
DNI_Usuario CHAR(9) NOT NULL,
Nombre VARCHAR2(20) NOT NULL,
Apellidos VARCHAR2(20) NOT NULL,
Edad NUMBER(4),
Localidad VARCHAR2(20),
Telefono_Movil CHAR(9) NOT NULL,
Telefono_Fijo CHAR(9),
Email VARCHAR2(50),
Nombre_Padre_Madre VARCHAR(20),
Usuario VARCHAR2(20) NOT NULL,
Pass VARCHAR2(20) NOT NULL,
TipoUsuario VARCHAR2(30) 
          CHECK (TipoUsuario IN('Alumno', 'Profesor', 'Admin')) NOT NULL,
PRIMARY KEY (DNI_Usuario)
);

CREATE TABLE Recibos(
Id_Recibo INTEGER NOT NULL,
Fecha_Recibo VARCHAR2(20) NOT NULL,
Por_Pagar INTEGER,
Cuenta_Bancaria CHAR(24),
Hermanos NUMBER(2,0) NOT NULL,
DNI_Usuario CHAR(9) NOT NULL,
Forma_Pago VARCHAR2(30) 
          CHECK (Forma_Pago IN('domiciliaci�nBancaria', 'efectivo', 'tarjetaCredito')) NOT NULL,
PRIMARY KEY(Id_Recibo),
FOREIGN KEY(DNI_Usuario) REFERENCES Usuarios
);

/*
CREATE TABLE Profesores(
DNI_Profesor CHAR(9) NOT NULL,
Nombre VARCHAR2(20) NOT NULL,
Apellidos VARCHAR2(40) NOT NULL,
Edad NUMBER(4),
Localidad VARCHAR2(20),
Sueldo_Profesor NUMBER(10,2) NOT NULL,
Nivel_Ingles CHAR(2) 
            CHECK (Nivel_Ingles IN('B1', 'B2', 'C1', 'C2')) NOT NULL,
Telefono_Movil CHAR(9) NOT NULL,
Telefono_Fijo CHAR(9),
Email VARCHAR2(50),
PRIMARY KEY(DNI_Profesor)
);
*/

CREATE TABLE Cursos(
Fecha_Inicio DATE NOT NULL,
Fecha_Fin DATE,
Num_Alumnos NUMBER(10,0),
Id_Curso INTEGER NOT NULL,
Id_Academia INTEGER NOT NULL,
PRIMARY KEY(Id_Curso),
FOREIGN KEY(Id_Academia) REFERENCES Academias
);

CREATE TABLE Cursos_Alumnos(
Fecha_Alta DATE NOT NULL,
Fecha_Baja DATE,
Id_Curso_Alumno INTEGER NOT NULL,
DNI_Usuario CHAR(9) NOT NULL,
Id_Curso INTEGER NOT NULL,
PRIMARY KEY(Id_Curso_Alumno),
FOREIGN KEY(DNI_Usuario) REFERENCES Usuarios,
FOREIGN KEY(Id_Curso) REFERENCES Cursos
);

CREATE TABLE Horario_Alumno(
Hora_Inicio CHAR(8) NOT NULL,
Hora_Fin CHAR(8) NOT NULL,
Dia VARCHAR2(40) NOT NULL,
Id_Horario INTEGER NOT NULL,
DNI_Usuario CHAR(9),
PRIMARY KEY(Id_Horario),
FOREIGN KEY(DNI_Usuario) REFERENCES Usuarios
);

CREATE TABLE Horario_Profesor(
Hora_Inicio CHAR(8) NOT NULL,
Hora_Fin CHAR(8) NOT NULL,
Dia VARCHAR2(40) NOT NULL,
Id_Horario INTEGER NOT NULL,
DNI_Usuario CHAR(9),
PRIMARY KEY(Id_Horario),
FOREIGN KEY(DNI_Usuario) REFERENCES Usuarios
);

CREATE TABLE Horario_Curso(
Hora_Inicio CHAR(8) NOT NULL,
Hora_Fin CHAR(8) NOT NULL,
Dia VARCHAR2(40) NOT NULL,
Id_Horario INTEGER NOT NULL,
Id_Curso INTEGER NOT NULL,
PRIMARY KEY(Id_Horario),
FOREIGN KEY(Id_Curso) REFERENCES Cursos
);

CREATE TABLE Examenes(
Tipo_Examen VARCHAR2(10) 
            CHECK (Tipo_Examen IN('Trinity', 'Cambridge', 'Aptis')) NOT NULL,
Nivel_Examen VARCHAR2(10) 
            CHECK (Nivel_Examen IN('B1', 'B2', 'C1')) NOT NULL, 
Fecha_Pago date,
Lugar VARCHAR2(20),
Fecha date,
Id_Curso INTEGER NOT NULL,
Id_Examen INTEGER NOT NULL,
PRIMARY KEY(Id_Examen),
FOREIGN KEY(Id_Curso) REFERENCES Cursos
);



--Restricciones de tablas
--DNI
ALTER TABLE Usuarios ADD CONSTRAINT CK_DNI_Usuarios
      CHECK (REGEXP_LIKE(DNI_Usuario, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));

--Telefono 
ALTER TABLE Usuarios ADD CONSTRAINT CK_Telefono_Fijo_Usuarios 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Usuarios ADD CONSTRAINT CK_Telefono_Movil_Usuarios 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));

--Horario
ALTER TABLE Horario_Alumno ADD CONSTRAINT CK_Horario_Alumno CHECK (Hora_Inicio < Hora_Fin);
ALTER TABLE Horario_Profesor ADD CONSTRAINT CK_Horario_Profesor CHECK (Hora_Inicio < Hora_Fin);
ALTER TABLE Horario_Curso ADD CONSTRAINT CK_Horario_Curso CHECK (Hora_Inicio < Hora_Fin);
ALTER TABLE Cursos_Alumnos ADD CONSTRAINT CK_Fechas CHECK (TO_DATE(Fecha_Alta, 'DD/MM/YYYY') < TO_DATE(Fecha_Baja, 'DD/MM/YYYY'));
ALTER TABLE Cursos ADD CONSTRAINT CK_Fechas_Cursos CHECK (TO_DATE(Fecha_Inicio, 'DD/MM/YYYY') < TO_DATE(Fecha_Fin, 'DD/MM/YYYY'));

-- Sueldo/Edad/aulas
ALTER TABLE Academias ADD CONSTRAINT CK_Aulas CHECK(aulas > 0);
ALTER TABLE Usuarios ADD CONSTRAINT CK_Edad_Usuarios CHECK(edad > 0);
--ALTER TABLE Profesores ADD CONSTRAINT CK_Sueldo_Prof CHECK(Sueldo_Profesor > 0);

--Borrado de secuencias:
DROP SEQUENCE SEC_Academias;
DROP SEQUENCE SEC_Cursos;
DROP SEQUENCE SEC_Horario_Alumno;
DROP SEQUENCE SEC_Horario_Profesor;
DROP SEQUENCE SEC_Horario_Curso;
DROP SEQUENCE SEC_Cursos_Alumnos;
DROP SEQUENCE SEC_Examenes;
DROP SEQUENCE SEC_Recibos;

--Creacion de secuencias:
CREATE SEQUENCE SEC_Academias
INCREMENT BY 1
START WITH 1
MAXVALUE 9999;

CREATE SEQUENCE SEC_Cursos
INCREMENT BY 1
START WITH 1
MAXVALUE 9999;

CREATE SEQUENCE SEC_Horario_Alumno
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;

CREATE SEQUENCE SEC_Horario_Profesor
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;

CREATE SEQUENCE SEC_Horario_Curso
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;

CREATE SEQUENCE SEC_Cursos_Alumnos 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;

CREATE SEQUENCE SEC_Examenes 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;

CREATE SEQUENCE SEC_Recibos 
INCREMENT BY 1 
START WITH 1 
MAXVALUE 9999;
