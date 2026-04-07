-- ============================================
-- TAREA 1 BASE DE DATOS
-- PARTE 3: SCRIPT DE CREACION
-- ============================================

-- 1. Crear base de datos

DROP DATABASE IF EXISTS ct_usm_postulaciones;
CREATE DATABASE ct_usm_postulaciones;
USE ct_usm_postulaciones; 

-- 2. Seleccionar base de datos
-- 3. Crear catalogos
CREATE TABLE Tamano_Empresa (
    id_tamano_empresa INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Estado_postulacion (
    id_estado INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Tipo_iniciativa (
    id_tipo_iniciativa INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Region (
    id_region INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Sede (
    id_sede INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Tipo_persona (
    id_tipo_persona INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 4. Poblar catalogos

INSERT INTO Tamano_Empresa (id_tamano_empresa, nombre) VALUES
(1, 'Microempresa'),
(2, 'Mediana'),
(3, 'Grande');

INSERT INTO Estado_postulacion (id_estado, nombre) VALUES
(1, 'En Revision'),
(2, 'Aprobada'),
(3, 'Rechazada'),
(4, 'Cerrada'); 

INSERT INTO Tipo_iniciativa (id_tipo_iniciativa, nombre) VALUES
(1, 'Nueva'),
(2, 'Existente');

INSERT INTO Tipo_persona (id_tipo_persona, nombre) VALUES
(1, 'Profesor'),
(2, 'Estudiante');

INSERT INTO Sede (id_sede, nombre) VALUES
(1, 'Campus Casa Central Valparaiso'),
(2, 'Campus San Joaquin'),
(3, 'Campus Vitacura'),
(4, 'Sede Vina del Mar'),
(5, 'Sede Concepcion');

INSERT INTO Region (id_region, nombre) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapaca'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaiso'),
(7, 'Metropolitana de Santiago'),
(8, 'OHiggins'),
(9, 'Maule'),
(10, 'Nuble'),
(11, 'Biobio'),
(12, 'La Araucania'),
(13, 'Los Rios'),
(14, 'Los Lagos'),
(15, 'Aysen'),
(16, 'Magallanes y la Antartica Chilena');

-- 5. Crear tablas principales

CREATE TABLE Empresa (
    rut_empresa VARCHAR(20) PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    nombre_representante_empresa VARCHAR(150) NOT NULL,
    mail_representante_empresa VARCHAR(150) NOT NULL,
    telefono_representante_empresa VARCHAR(20) NOT NULL,
    convenio_marco_usm BOOLEAN NOT NULL,
    id_tamano_empresa INT NOT NULL,
    FOREIGN KEY (id_tamano_empresa) REFERENCES Tamano_Empresa(id_tamano_empresa)
) ENGINE=InnoDB;

CREATE TABLE Persona (
    rut_persona VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    id_tipo_persona INT NOT NULL,
    FOREIGN KEY (id_tipo_persona) REFERENCES Tipo_persona(id_tipo_persona)
) ENGINE=InnoDB;

CREATE TABLE Postulacion (
    id_postulacion INT PRIMARY KEY,
    numero_postulacion VARCHAR(20) NOT NULL UNIQUE,
    codigo_interno VARCHAR(20) NOT NULL UNIQUE,
    fecha_postulacion DATE NOT NULL,
    objetivo_iniciativa VARCHAR(255) NOT NULL,
    descripcion_posibles_soluciones VARCHAR(255) NOT NULL,
    resultados_esperados VARCHAR(255) NOT NULL,
    rut_empresa VARCHAR(20) NOT NULL,
    nombre_iniciativa VARCHAR(150) NOT NULL,
    id_tipo_iniciativa INT NOT NULL,
    presupuesto_total INT NOT NULL,
    id_region_ejecucion INT NOT NULL,
    id_region_impacto INT NOT NULL,
    id_estado_postulacion INT NOT NULL,
    rut_jefe_carrera VARCHAR(20) NOT NULL,
    rut_coordinador_ct_usm VARCHAR(20) NOT NULL,
    FOREIGN KEY (rut_empresa) REFERENCES Empresa(rut_empresa),
    FOREIGN KEY (id_tipo_iniciativa) REFERENCES Tipo_iniciativa(id_tipo_iniciativa),
    FOREIGN KEY (id_region_ejecucion) REFERENCES Region(id_region),
    FOREIGN KEY (id_region_impacto) REFERENCES Region(id_region),
    FOREIGN KEY (id_estado_postulacion) REFERENCES Estado_postulacion(id_estado),
    FOREIGN KEY (rut_jefe_carrera) REFERENCES Persona(rut_persona),
    FOREIGN KEY (rut_coordinador_ct_usm) REFERENCES Persona(rut_persona)
) ENGINE=InnoDB;

CREATE TABLE Etapa_cronograma (
    id_etapa INT PRIMARY KEY,
    nombre_etapa VARCHAR(100) NOT NULL,
    plazo_semanas INT NOT NULL,
    entregable VARCHAR(255) NOT NULL,
    id_postulacion INT NOT NULL,
    FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id_postulacion)
) ENGINE=InnoDB;

CREATE TABLE Documento_Postulacion (
    id_documento INT PRIMARY KEY,
    nombre_documento VARCHAR(100) NOT NULL,
    id_postulacion INT NOT NULL,
    FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id_postulacion)
) ENGINE=InnoDB;

CREATE TABLE Integrante_postulacion (
    id_postulacion INT NOT NULL,
    rut_persona VARCHAR(20) NOT NULL,
    rol_cumple VARCHAR(100) NOT NULL,
    departamento_area VARCHAR(100) NOT NULL,
    id_sede INT NOT NULL,
    PRIMARY KEY (id_postulacion, rut_persona),
    FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id_postulacion),
    FOREIGN KEY (rut_persona) REFERENCES Persona(rut_persona),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede)
) ENGINE=InnoDB;

CREATE TABLE Postulacion_sede (
    id_postulacion INT PRIMARY KEY,
    id_sede INT NOT NULL,
    FOREIGN KEY (id_postulacion) REFERENCES Postulacion(id_postulacion),
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede)
) ENGINE=InnoDB;
-- id_postulacion como PK hace que cada postulación aparezca solo una vez
-- por lo tanto solo puede tener una sede
