CREATE DATABASE bd_biblioteca_mysql_test;

USE bd_biblioteca_mysql_test;

CREATE TABLE libros(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    cant_pagina int,
    gestion VARCHAR(10)
);

CREATE TABLE autores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(60) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    estado BOOLEAN
);

CREATE TABLE autor_libro(
    id INT AUTO_INCREMENT PRIMARY KEY,
    libro_id INT NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);


CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(20) UNIQUE,
    password VARCHAR(150),
    estado BOOLEAN
);

CREATE TABLE prestamos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_prestamo DATETIME,
    fecha_devolucion DATETIME,
    libro_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


CREATE TABLE tarjetas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_tarjeta VARCHAR(20),
    fecha_registro DATE,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
