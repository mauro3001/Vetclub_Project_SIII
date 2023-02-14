create database if not exists vetclub;

use vetclub;

show tables;

#CREATION OF TABLES

CREATE TABLE usuario(
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    telefono BIGINT,
    nickname VARCHAR(50),
    password VARCHAR(200),
    PRIMARY KEY(id_usuario)
);


CREATE TABLE rol(
    id_rol INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    id_usuario INT NOT NULL,
    PRIMARY KEY(id_rol),
    CONSTRAINT FK_usuario_rol FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

/*
CREATE TABLE usuario_rol(
    id_usuario_rol INT NOT NULL AUTO_INCREMENT,
    rol INT NOT NULL,
    usuario INT NOT NULL,
    PRIMARY KEY(id_usuario_rol),
    CONSTRAINT FK_rol_usuario FOREIGN KEY(rol) REFERENCES rol(id_rol),
    CONSTRAINT FK_usuario_usuario FOREIGN KEY(usuario) REFERENCES usuario(id_usuario)
);*/

CREATE TABLE secretario(
    id_secretario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    nickname VARCHAR(50),
    PRIMARY KEY(id_secretario)
);

CREATE TABLE tipo_profesional(
    id_tipo_profesional INT NOT NULL AUTO_INCREMENT,
    profesion VARCHAR(50),
    descripcion VARCHAR(100),
    PRIMARY KEY(id_tipo_profesional)
);

CREATE TABLE profesional(
    id_profesional INT NOT NULL AUTO_INCREMENT,
    tipo_profesional INT NOT NULL,
    nombre VARCHAR(50),
    correo VARCHAR(50),
    nickname VARCHAR(50),
    PRIMARY KEY(id_profesional),
    CONSTRAINT FK_tipo_profesional FOREIGN KEY(tipo_profesional) REFERENCES tipo_profesional(id_tipo_profesional) 
);

CREATE TABLE tipo_mascota(
    id_tipo_mascota INT NOT NULL AUTO_INCREMENT,
    animal VARCHAR(20),
    PRIMARY KEY(id_tipo_mascota)
);

CREATE TABLE mascota(
    id_mascota INT NOT NULL AUTO_INCREMENT,
    tipo_mascota INT NOT NULL,
    nombre VARCHAR(50),
    raza VARCHAR(20),
    historial VARCHAR(100),
    PRIMARY KEY(id_mascota),
    CONSTRAINT FK_tipo_mascota FOREIGN KEY(tipo_mascota) REFERENCES tipo_mascota(id_tipo_mascota) 
);

CREATE TABLE tipo_proceso(
    id_tipo_proceso INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    descripcion VARCHAR(80),
    costo FLOAT,
    PRIMARY KEY(id_tipo_proceso)
);

CREATE TABLE cita(
    id_cita INT NOT NULL AUTO_INCREMENT,
    profesional INT NOT NULL,
    tipo_mascota INT NOT NULL,
    tipo_proceso INT NOT NULL,
    nickname VARCHAR(60),
    fecha DATE,
    hora TIME,
    PRIMARY KEY(id_cita),
    CONSTRAINT FK_profesional_cita FOREIGN KEY(profesional) REFERENCES profesional(id_profesional),
    CONSTRAINT FK_tipo_mascota_cita FOREIGN KEY(tipo_mascota) REFERENCES tipo_mascota(id_tipo_mascota),
    CONSTRAINT FK_tipo_proceso_cita FOREIGN KEY(tipo_proceso) REFERENCES tipo_proceso(id_tipo_proceso) 
);

CREATE TABLE agenda(
    id_agenda INT NOT NULL AUTO_INCREMENT,
    cita INT NOT NULL,
    PRIMARY KEY(id_agenda),
    CONSTRAINT FK_cita_agenda FOREIGN KEY(cita) REFERENCES cita(id_cita)
);


insert into tipo_profesional values(NULL,"Veterinario","Encargado de los procedimientos con las mascotas");
insert into tipo_profesional values(NULL,"Estilista","Encargado de la estetica de las mascotas");
insert into tipo_profesional values(NULL,"Secretario","Encargado de la administracion y el inventario");


insert into tipo_mascota values(NULL,"Perro");
insert into tipo_mascota values(NULL,"Gato");


insert into profesional values(NULL, 1, "Camila Ardila", "camila@vet.com", "camilaAdmin");
insert into profesional values(NULL, 2, "Jose Ramirez", "jose@style.com", "josearch");
insert into profesional values(NULL, 1, "Carlos Navas", "carlito@vet.com", "carlitoNava");
insert into profesional values(NULL, 2, "Ximena Rosales", "ximena@style.com", "ximenita");


insert into tipo_proceso values(NULL, "Cita General", "Revisión general del animal", 30);
insert into tipo_proceso values(NULL, "Corte de Pelo", "Peluquear animal", 20);
insert into tipo_proceso values(NULL, "Baño", "Servicio de limpieza", 15);
insert into tipo_proceso values(NULL, "Vacunaciones", "Servicio de vacunaciones", 10);
insert into tipo_proceso values(NULL, "Masaje Relajante", "Servicio de masaje", 15);
insert into tipo_proceso values(NULL, "Limpieza Dental", "Servicio de higiene", 30);
insert into tipo_proceso values(NULL, "Tests Serológicos", "Para identificar diversas enfermedades infecciosas", 60);

INSERT INTO usuario values(NULL, "admin", "admin@vetclub.com", 3162738492, "admin", "$2a$10$Ip.CP.og0W5xutlCofx2BOWeEEegHLIHo0TahaEChu13Cw4IYkRui");
INSERT INTO usuario values(NULL, "veterinario", "veterinario@vetclub.com", 3152738452, "vetVetclub", "$2a$10$xugaIayFwghPnSiOcDVUoexY2OnZf12NNmEdyosIIgUtktvm6pb3O");
INSERT INTO usuario values(NULL, "estilista", "estilista@vetclub.com", 3182538492, "estVetclub", "$2a$10$Ip.CP.og0W5xutlCofx2BOWeEEegHLIHo0TahaEChu13Cw4IYkRui");

INSERT INTO mascota values(NULL, 1, "Apolo", "Poodle", "No presenta historial");
INSERT INTO mascota values(NULL, 2, "Tom", "Siames", "Esterilizacion");
INSERT INTO mascota values(NULL, 1, "Rocky", "Rottweiler", "Operacion de hernias");
INSERT INTO mascota values(NULL, 2, "Mishi", "Bombay", "No presenta historial");

INSERT INTO cita values(NULL, 2, 1, 7, "paulaCr", "2023-02-08", "08:30:00");
INSERT INTO cita values(NULL, 1, 2, 3, "carloTb", "2023-02-13", "10:00:00");
INSERT INTO cita values(NULL, 4, 1, 5, "lauraAr", "2023-02-20", "02:30:00");
INSERT INTO cita values(NULL, 3, 2, 2, "dayronRa", "2023-02-25", "04:30:00");

SET SQL_SAFE_UPDATES = 0;

select * from tipo_mascota;

select * from profesional;

select * from tipo_proceso;