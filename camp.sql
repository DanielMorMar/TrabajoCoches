CREATE DATABASE IF NOT EXISTS camp; USE camp;
-- Tabla: cliente
DROP TABLE IF EXISTS cliente, coche, gama, reserva;
CREATE TABLE cliente (
    codcli CHAR(4) PRIMARY KEY,
    nombre VARCHAR(20),
    apellido VARCHAR(40),
    direccion VARCHAR(50),
    mail VARCHAR(100)
);

-- Tabla: gama
CREATE TABLE gama (
    codgama CHAR(2) PRIMARY KEY,
    nomgama VARCHAR(20),
    stock INTEGER,
    precio NUMERIC(10, 2)
);

-- Tabla: coche
CREATE TABLE coche (
    matricula CHAR(7) PRIMARY KEY,
    modelo VARCHAR(40),
    foto VARCHAR(15),
    codgama CHAR(2) NOT NULL,
    CONSTRAINT fk_coche_gama FOREIGN KEY (codgama) REFERENCES gama(codgama)
);

-- Tabla: reserva
CREATE TABLE reserva (
    codreserva SERIAL PRIMARY KEY,
    fecha_res DATE NOT NULL,
    f_inicio DATE,
    f_fin DATE,
    dias INTEGER,
    lugar VARCHAR(50),
    importe NUMERIC(10, 2) DEFAULT 0,
    gama VARCHAR(2) NOT NULL,
    codcliente CHAR(4) NOT NULL,
    f_recogida DATE,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (codcliente) REFERENCES cliente(codcli),
    CONSTRAINT fk_reserva_coche FOREIGN KEY (coche) REFERENCES coche(matricula)
);

-- Inserción de datos en cliente
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('1', 'Pepe', 'García', 'Ausiach March, 23', 'pep@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('2', 'Lucas', 'Iniesta', 'Ausiach March, 23', 'lui@gmailx.com');
INSERT INTO cliente (codcli, nombre, apellido, direccion, mail) VALUES ('3', 'Ana', 'Lorca Sanz', 'Ausiach March, 23', 'annta@gmailx.com');

-- Inserción de datos en gama
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('L1', 'Lujo', 2, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('F2', 'Familiar', 3, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('T1', '4 x 4', 1, 23.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('F1', 'Familiar', 4, 15.00);
INSERT INTO gama (codgama, nomgama, stock, precio) VALUES ('D1', 'Furgoneta', 3, 28.00);

-- Inserción de datos en coche
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1111AAA', 'Volvo z', 'foto1.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1112AAA', 'Volvo EX40', 'foto2.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1001BBB', 'Ford Focus', 'foto4.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1003TTT', 'Citroen e-c3', 'foto5.jpg', 'T1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('3003LLL', 'Mercedes', 'foto6.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('3333BBB', 'Volvo XC90', 'foto7.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('4444NNN', 'Volvo XC1', 'foto10.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1113AAA', 'Audi A3', 'foto3.jpg', 'F2');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('6666NNN', 'Fiesta', 'foto8.jpg', 'F2');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('6612NNN', 'Audi A3', 'foto9.jpg', 'F2');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('2222BBB', 'Seat León', 'foto11.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('3333CCC', 'Renault Scenic', 'foto12.jpg', 'F1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('4444DDD', 'Volkswagen Passat', 'foto13.jpg', 'F2');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('5555EEE', 'Citroën C5', 'foto14.jpg', 'F2');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('7777FFF', 'Toyota RAV4', 'foto15.jpg', 'T1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('8888GGG', 'Nissan X-Trail', 'foto16.jpg', 'T1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('9999HHH', 'Mercedes-Benz Clase E', 'foto17.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('0000III', 'BMW Serie 7', 'foto18.jpg', 'L1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1212JJJ', 'Ford Transit', 'foto19.jpg', 'D1');
INSERT INTO coche (matricula, modelo, foto, codgama) VALUES ('1313KKK', 'Mercedes Vito', 'foto20.jpg', 'D1');

