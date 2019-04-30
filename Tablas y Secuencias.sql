--Creación de tablas:
DROP TABLE Examenes;
DROP TABLE Horarios;
DROP TABLE Cursos_Profesores;
DROP TABLE Cursos_Alumnos;
DROP TABLE Cursos;
DROP TABLE nivelAdmin;
DROP TABLE Dueños;
DROP TABLE Profesores;
DROP TABLE Alumnos;
DROP TABLE Recibos;
DROP TABLE Academias;

CREATE TABLE Academias(
Lugar VARCHAR2(20) NOT NULL,
Aulas INTEGER NOT NULL,
Id_Academia INTEGER NOT NULL,
Telefono CHAR(9),
PRIMARY KEY(Id_Academia)
);

CREATE TABLE Recibos(
Id_Recibo INTEGER NOT NULL,
Fecha_Recibo date NOT NULL,
Por_Pagar INTEGER,
Cuenta_Bancaria CHAR(24),
Hermanos NUMBER(2,0) NOT NULL,
Forma_Pago VARCHAR2(30) 
          CHECK (Forma_Pago IN('domiciliaciónBancaria', 'efectivo', 'tarjetaCredito')) NOT NULL,
PRIMARY KEY(Id_Recibo)
);

CREATE TABLE Alumnos(
DNI_Alumno CHAR(9) NOT NULL,
Nombre VARCHAR2(20) NOT NULL,
Apellidos VARCHAR2(20) NOT NULL,
Edad NUMBER(4),
Localidad VARCHAR2(20),
Id_Recibo INTEGER NOT NULL,
Telefono_Movil CHAR(9) NOT NULL,
Telefono_Fijo CHAR(9),
Email VARCHAR2(50),
Nombre_Padre_Madre VARCHAR(20),
PRIMARY KEY (DNI_Alumno),
FOREIGN KEY(Id_Recibo) REFERENCES Recibos
);


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

CREATE TABLE Cursos_Profesores(
Id_Curso_Profesor INTEGER NOT NULL,
DNI_Profesor CHAR(9) NOT NULL,
Id_Curso INTEGER NOT NULL,
PRIMARY KEY(Id_Curso_Profesor),
FOREIGN KEY(DNI_Profesor) REFERENCES Profesores,
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

CREATE TABLE Dueños(
DNI_Dueño CHAR(9) NOT NULL,
Nombre VARCHAR2(20) NOT NULL,
Apellidos VARCHAR2(20) NOT NULL,
Edad NUMBER(3),
Localidad VARCHAR2(20),
Telefono_Movil CHAR(9) NOT NULL,
Telefono_Fijo CHAR(9),
Email VARCHAR2(50),
PRIMARY KEY(DNI_Dueño)
);

CREATE TABLE nivelAdmin(
DNI_Nivel_Admin CHAR(9) NOT NULL,
Nombre VARCHAR2(20) NOT NULL,
Apellidos VARCHAR2(20) NOT NULL,
Edad INTEGER,
Localidad VARCHAR2(20),
Sueldo_NivAdmin NUMBER(10,2) NOT NULL,
Telefono_Movil CHAR(9) NOT NULL,
Telefono_Fijo CHAR(9),
Email VARCHAR2(50),
PRIMARY KEY(DNI_Nivel_Admin)
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
ALTER TABLE Dueños ADD CONSTRAINT CK_DNI_Dueños
      CHECK (REGEXP_LIKE(DNI_Dueño, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE NivelAdmin ADD CONSTRAINT CK_DNI_NivelAdmin
      CHECK (REGEXP_LIKE(DNI_Nivel_Admin, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
--Telefono 
ALTER TABLE Alumnos ADD CONSTRAINT CK_Telefono_Fijo_Alumnos 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Alumnos ADD CONSTRAINT CK_Telefono_Movil_Alumnos 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Telefono_Fijo_Profesor 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Telefono_Movil_Profesor 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Dueños ADD CONSTRAINT CK_Telefono_Fijo_Dueño 
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Dueños ADD CONSTRAINT CK_Telefono_Movil_Dueño 
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE NivelAdmin ADD CONSTRAINT CK_Telefono_Fijo_NivelAdmin
      CHECK (REGEXP_LIKE(Telefono_Fijo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE NivelAdmin ADD CONSTRAINT CK_Telefono_Movil_NivelAdmin
      CHECK (REGEXP_LIKE(Telefono_Movil, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
      
--Horario
ALTER TABLE Horarios ADD CONSTRAINT CK_Horario CHECK (Hora_Inicio < Hora_Fin);
ALTER TABLE Cursos_Alumnos ADD CONSTRAINT CK_Fechas CHECK (TO_DATE(Fecha_Alta, 'DD/MM/YYYY') < TO_DATE(Fecha_Baja, 'DD/MM/YYYY'));
ALTER TABLE Cursos ADD CONSTRAINT CK_Fechas_Cursos CHECK (TO_DATE(Fecha_Inicio, 'DD/MM/YYYY') < TO_DATE(Fecha_Fin, 'DD/MM/YYYY'));

-- Sueldo/Edad/aulas
ALTER TABLE Academias ADD CONSTRAINT CK_Aulas CHECK(aulas > 0);
ALTER TABLE Alumnos ADD CONSTRAINT CK_Edad_Alum CHECK(edad > 0);
ALTER TABLE Profesores ADD CONSTRAINT CK_Edad_Prof CHECK(edad > 0);
ALTER TABLE Dueños ADD CONSTRAINT CK_Edad_Dueño CHECK(edad > 0);
ALTER TABLE nivelAdmin ADD CONSTRAINT CK_Edad_NivelAdm CHECK(edad > 0);
ALTER TABLE Profesores ADD CONSTRAINT CK_Sueldo_Prof CHECK(Sueldo_Profesor > 0);
ALTER TABLE nivelAdmin ADD CONSTRAINT CK_Sueldo_NivelAdm CHECK(Sueldo_NivAdmin > 0);

--Creación de secuencias:
DROP SEQUENCE SEC_Academias;
DROP SEQUENCE SEC_Cursos;
DROP SEQUENCE SEC_Horarios;
DROP SEQUENCE SEC_Cursos_Alumnos;
DROP SEQUENCE SEC_Cursos_Profesores;
DROP SEQUENCE SEC_Examenes;
DROP SEQUENCE SEC_Recibos;

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

CREATE SEQUENCE SEC_Cursos_Profesores 
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
