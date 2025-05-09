-- Primero, conecta a una base de datos de PostgreSQL como 'postgres' o alguna base de datos existente para poder crear la base de datos.
-- Crear la base de datos si no existe (esto debe hacerse manualmente desde el cliente de PostgreSQL).
CREATE DATABASE camp; -- Esto se hace solo si la base de datos no existe.

-- Luego, conéctate a la base de datos 'camp' y ejecuta el siguiente código.

-- Eliminar tablas si existen
DROP TABLE IF EXISTS cliente, coche, gama, reserva;

-- Crear la tabla cliente
CREATE TABLE cliente (
    codcli CHAR(4) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    direccion VARCHAR(50),
    mail VARCHAR(100)
);

-- Crear la tabla gama
CREATE TABLE gama (
    codgama CHAR(2) PRIMARY KEY,
    nomgama VARCHAR(20),
    stock INTEGER,
    precio NUMERIC(10, 2)
);

-- Crear la tabla coche
CREATE TABLE coche (
    matricula CHAR(7) PRIMARY KEY,
    modelo VARCHAR(40),
    foto VARCHAR(15),
    codgama CHAR(2) NOT NULL
);

-- Crear la tabla reserva
CREATE TABLE reserva (
    codreserva INTEGER PRIMARY KEY,
    fecha_res DATE NOT NULL,
    f_inicio DATE,
    f_fin DATE,
    dias INTEGER,
    lugar VARCHAR(50),
    importe NUMERIC(10, 2) DEFAULT 0,
    gama VARCHAR(2) NOT NULL,
    codcliente CHAR(4) NOT NULL,
    f_recogida DATE
);

-- Inserción de datos en cliente
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES 
    ('1', 'Pepe', 'García', 'Ausiach March, 23', 'pep@gmailx.com'),
    ('2', 'Lucas', 'Iniesta', 'Ausiach March, 23', 'lui@gmailx.com'),
    ('3', 'Ana', 'Lorca Sanz', 'Ausiach March, 23', 'annta@gmailx.com');

-- Inserción de datos en gama
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES 
    ('L1', 'Lujo', 2, 23.00),
    ('F2', 'Familiar', 3, 23.00),
    ('T1', '4 x 4', 1, 23.00),
    ('F1', 'Familiar', 4, 15.00),
    ('D1', 'Furgoneta', 3, 28.00);

-- Inserción de datos en coche
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES 
    ('1111AAA', 'Volvo z', 'foto1.jpg', 'F1'),
    ('1112AAA', 'Volvo EX40', 'foto2.jpg', 'F1'),
    ('1001BBB', 'Ford Focus', 'foto4.jpg', 'F1'),
    ('1003TTT', 'Citroen e-c3', 'foto5.jpg', 'T1'),
    ('3003LLL', 'Mercedes', 'foto6.jpg', 'L1'),
    ('3333BBB', 'Volvo XC90', 'foto7.jpg', 'L1'),
    ('4444NNN', 'Volvo XC1', 'foto10.jpg', 'F1'),
    ('1113AAA', 'Audi A3', 'foto3.jpg', 'F2'),
    ('6666NNN', 'Fiesta', 'foto8.jpg', 'F2'),
    ('6612NNN', 'Audi A3', 'foto9.jpg', 'F2'),
    ('2222BBB', 'Seat León', 'foto11.jpg', 'F1'),
    ('3333CCC', 'Renault Scenic', 'foto12.jpg', 'F1'),
    ('4444DDD', 'Volkswagen Passat', 'foto13.jpg', 'F2'),
    ('5555EEE', 'Citroën C5', 'foto14.jpg', 'F2'),
    ('7777FFF', 'Toyota RAV4', 'foto15.jpg', 'T1'),
    ('8888GGG', 'Nissan X-Trail', 'foto16.jpg', 'T1'),
    ('9999HHH', 'Mercedes-Benz Clase E', 'foto17.jpg', 'L1'),
    ('0000III', 'BMW Serie 7', 'foto18.jpg', 'L1'),
    ('1212JJJ', 'Ford Transit', 'foto19.jpg', 'D1'),
    ('1313KKK', 'Mercedes Vito', 'foto20.jpg', 'D1');
