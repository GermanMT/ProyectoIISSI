--Borrado de tablas:
DROP TABLE Examenes;
DROP TABLE Horarios;
DROP TABLE Cursos_Alumnos;
DROP TABLE Cursos;
DROP TABLE Profesores;
DROP TABLE Recibos;
DROP TABLE Alumnos;
DROP TABLE Academias;

--Creación de tablas:
CREATE TABLE Academias(
Lugar VARCHAR2(20) NOT NULL,
Aulas INTEGER NOT NULL,
Id_Academia INTEGER NOT NULL,
Telefono CHAR(9),
PRIMARY KEY(Id_Academia)
);

CREATE TABLE Alumnos(
DNI_Alumno CHAR(9) NOT NULL,
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
PRIMARY KEY (DNI_Alumno)
<<<<<<< HEAD
);

CREATE TABLE Recibos(
Id_Recibo INTEGER NOT NULL,
Fecha_Recibo date NOT NULL,
Por_Pagar INTEGER,
Cuenta_Bancaria CHAR(24),
Hermanos NUMBER(2,0) NOT NULL,
DNI_Alumno CHAR(9) NOT NULL,
Forma_Pago VARCHAR2(30) 
          CHECK (Forma_Pago IN('domiciliaciónBancaria', 'efectivo', 'tarjetaCredito')) NOT NULL,
PRIMARY KEY(Id_Recibo),
FOREIGN KEY(DNI_Alumno) REFERENCES Alumnos
=======
>>>>>>> e81559ed6bd891fc71c283fd838dd8fa5b2a1d2c
);

CREATE TABLE Recibos(
Id_Recibo INTEGER NOT NULL,
Fecha_Recibo VARCHAR2(30) NOT NULL,
Por_Pagar INTEGER,
Cuenta_Bancaria CHAR(24),
Hermanos NUMBER(2,0) NOT NULL,
DNI_Alumno CHAR(9) NOT NULL,
Forma_Pago VARCHAR2(30) 
          CHECK (Forma_Pago IN('domiciliaciónBancaria', 'efectivo', 'tarjetaCredito')) NOT NULL,
PRIMARY KEY(Id_Recibo),
FOREIGN KEY(DNI_Alumno) REFERENCES Alumnos
);

SELECT * FROM RECIBOS, ALUMNOS WHERE (RECIBOS.DNI_ALUMNO = ALUMNOS.DNI_ALUMNO);

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
DNI_Alumno CHAR(9) NOT NULL,
Id_Curso INTEGER NOT NULL,
PRIMARY KEY(Id_Curso_Alumno),
FOREIGN KEY(DNI_Alumno) REFERENCES Alumnos,
FOREIGN KEY(Id_Curso) REFERENCES Cursos
);

CREATE TABLE Horarios(
Hora_Inicio CHAR(8) NOT NULL,
Hora_Fin CHAR(8) NOT NULL,
Dia VARCHAR2(40) NOT NULL,
Id_Horario INTEGER NOT NULL,
DNI_Profesor CHAR(9),
DNI_Alumno CHAR(9),
Id_Curso INTEGER NOT NULL,
PRIMARY KEY(Id_Horario),
FOREIGN KEY(DNI_Profesor) REFERENCES Profesores,
FOREIGN KEY(DNI_Alumno) REFERENCES Alumnos,
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
ALTER TABLE Alumnos ADD CONSTRAINT CK_DNI_Alumnos
      CHECK (REGEXP_LIKE(DNI_Alumno, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_DNI_Profesores
      CHECK (REGEXP_LIKE(DNI_Profesor, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));

--Telefono 
ALTER TABLE Alumnos ADD CONSTRAINT CK_Telefono_Fijo_Alumnos 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Telefono_Movil_Alumnos 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Telefono_Fijo_Profesor 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Telefono_Movil_Profesor 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));

--Horario
ALTER TABLE Horarios ADD CONSTRAINT CK_Horario CHECK (Hora_Inicio < Hora_Fin);
ALTER TABLE Cursos_Alumnos ADD CONSTRAINT CK_Fechas CHECK (TO_DATE(Fecha_Alta, 'DD/MM/YYYY') < TO_DATE(Fecha_Baja, 'DD/MM/YYYY'));
ALTER TABLE Cursos ADD CONSTRAINT CK_Fechas_Cursos CHECK (TO_DATE(Fecha_Inicio, 'DD/MM/YYYY') < TO_DATE(Fecha_Fin, 'DD/MM/YYYY'));

-- Sueldo/Edad/aulas
ALTER TABLE Academias ADD CONSTRAINT CK_Aulas CHECK(aulas > 0);
ALTER TABLE Alumnos ADD CONSTRAINT CK_Edad_Alum CHECK(edad > 0);
ALTER TABLE Profesores ADD CONSTRAINT CK_Edad_Prof CHECK(edad > 0);
ALTER TABLE Profesores ADD CONSTRAINT CK_Sueldo_Prof CHECK(Sueldo_Profesor > 0);

--Borrado de secuencias:
DROP SEQUENCE SEC_Academias;
DROP SEQUENCE SEC_Cursos;
DROP SEQUENCE SEC_Horarios;
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

CREATE SEQUENCE SEC_Horarios 
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
