-- En el caso de que se necesite modificar datos y tablas, se pueden eliminar y hacer nuevamente con los datos necesarios aplicando estos códigos: 
-- SET FOREIGN_KEY_CHECKS = 0;
-- DROP TABLE IF EXISTS Inventario;
-- SET FOREIGN_KEY_CHECKS = 1;
-- Tan solo hay que cambiar "Inventario" por la variable deseada. 
-- ==============================================================================================================================================
-- Base de datos del Proyecto PATO ORO 3
DROP DATABASE IF EXISTS PATO3;
CREATE DATABASE PATO3;
USE PATO3;
-- ===================================
-- TABLA: Inventario (Mochilas y bolsos)
-- ===================================
CREATE TABLE Inventario (
  persona_id INT PRIMARY KEY, -- ID único de persona (uno a uno)
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  mochila_descripcion VARCHAR(255) -- Puede ser NULL si no tiene mochila
);
INSERT INTO Inventario (persona_id, nombre, apellidos, mochila_descripcion) VALUES
(1, 'Adrián', 'Perez', 'Mochila negra grande'),
(2, 'Mustafa', 'Jimenez', 'Mochila azul mediana'),
(3, 'Simba', 'Hernandez', 'Mochila negra grande'),
(4, 'Mufasa', 'Lion', 'Mochila roja pequeña'),
(5, 'Nala', 'Ndiaye', 'Bolso pequeño de cuero'),
(6, 'Juana', 'Pérez', 'Mochila verde grande'), 
(7, 'María', 'López', NULL),
(8, 'Carlos', 'Gómez', NULL),
(9, 'Ana', 'Fernández', NULL),
(10, 'David', 'Martínez', NULL),
(11, 'Jose', 'Martínez', NULL),
(12, 'George', 'Smith', NULL); --
-- ==============================
-- TABLA: Personas
-- ==============================
CREATE TABLE Personas (
  persona_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  rol ENUM('Profesor Reeboot', 'Alumno Reboot', 'Limpiadora', 'Directora Reeboot', 'Policía', 'Portero', 'Joyero', 'Dependiente', 'Cajera', 'Repartidor'),
  inventario_id INT,
  color_pelo ENUM('moreno', 'rubio', 'pelirrojo'), -- Sustituido "negro" por "moreno"
  altura ENUM('alto', 'medio', 'bajo'),
  constitucion ENUM('fuerte', 'normal', 'delgada'), -- Corregido "delagada" a "delgada"
  FOREIGN KEY (inventario_id) REFERENCES Inventario(persona_id) -- Ajustado a nueva tabla Inventario
);
INSERT INTO Personas VALUES
(1,'Adrián','Perez','Alumno Reboot',1,'moreno','alto','fuerte'),
(2,'Mustafa','Jimenez','Alumno Reboot',2,'moreno','bajo','fuerte'),
(3,'Simba','Hernandez','Alumno Reboot',3,'moreno','alto','fuerte'),
(4,'Mufasa','Lion','Alumno Reboot',4,'rubio','medio','delgada'),
(5,'Nala','Ndiaye','Alumno Reboot',5,'pelirrojo','alto','fuerte'),
(6,'Juana','Pérez','Profesor Reeboot',6,'Moreno','alto','fuerte'), 
(7,'María','López','Directora Reeboot',NULL,'pelirrojo','bajo','fuerte'),
(8,'Carlos','Gómez','Portero',NULL,'moreno','alto','delgada'),
(9,'Ana','Fernández','Joyero',NULL,'rubio','medio','delgada'),
(10,'David','Martínez','Dependiente',NULL,'moreno','bajo','normal'),
(11,'Jose','Martinez','Joyero',NULL,'moreno','medio','fuerte'),
(12,'George','Smith','Joyero',NULL,'rubio','alto','delgada');
-- ==============================
-- TABLA: Registro_Reboot
-- ==============================
CREATE TABLE Registro_Reboot (
  registro_id INT AUTO_INCREMENT PRIMARY KEY,
  persona_id INT,
  fecha DATE,
  hora_entrada TIME,
  hora_salida TIME,
  FOREIGN KEY (persona_id) REFERENCES Personas(persona_id)
);
INSERT INTO Registro_Reboot VALUES
(1,1,'2025-01-12','09:00:00','16:00:00'),
(2,2,'2025-01-12','09:00:00','16:00:00'),
(3,3,'2025-01-12','09:00:00','16:00:00'),
(4,4,'2025-01-12','09:00:00','16:00:00'),
(5,5,'2025-01-12','09:00:00','16:00:00'),
(6,6,'2025-01-12','08:00:00','16:00:00'),
(7,7,'2025-01-12','10:00:00','14:00:00');
-- ==============================
-- TABLA: Lugares
-- ==============================
CREATE TABLE Lugares (
  lugar_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  hora_apertura TIME,
  hora_cierre TIME
);
INSERT INTO Lugares VALUES
(1,'Reboot Academy','08:00:00','18:00:00'),
(2,'SPAR Ripoche','10:00:00','21:00:00'),
(3,'Cafeteria Lanzarote','08:00:00','22:00:00'),
(4,'Compro Oro 1','09:00:00','20:00:00'),
(5,'Compro Oro 2','09:00:00','20:00:00'),
(6,'Compro Oro 3','09:00:00','20:00:00');
-- ==============================
-- TABLA: Declaraciones
-- ==============================
CREATE TABLE Declaraciones (
  declaraciones_id INT AUTO_INCREMENT PRIMARY KEY,
  persona_id INT,
  declaracion VARCHAR(255),
  FOREIGN KEY (persona_id) REFERENCES Personas(persona_id)
);
INSERT INTO Declaraciones (declaraciones_id, persona_id, declaracion) VALUES
(1, 1, 'Me quedé todo el día en clases.'),
(2, 2, 'Estuve todo el rato en la academia y creo recordar que alguien más estuvo por ahí.'),
(3, 3, 'Estuve solo un rato en la academia y luego fui al Spar.'),
(4, 4, 'Fui al Spar y me encontré con un compañero.'),
(5, 5, 'Fui a la cafetería a merendar.'),
(6, 6, 'No noté nada raro. Acompañé a Matías que se encontraba muy mal y luego volví a clase.'),
(7, 7, 'Fui a la joyería a vender mi anillo de boda junto al resto de mis joyas.'),
(8, 12, 'Solo vino una persona varias veces a vender oro, era alto y fuerte, pero no recuerdo si rubio o moreno. Me comentaron que se realizaron varias ventas en diferentes tiendas.'),
(9, 9, 'Un joven alto, fuerte y moreno vino a vender oro.');
-- ==============================
-- TABLA: Detalle_Tienda
-- ==============================
CREATE TABLE Detalle_Tienda (
  tienda_id INT AUTO_INCREMENT PRIMARY KEY,
  fecha_transaccion DATE,
  oro_ingresado INT,
  descripcion_persona VARCHAR(255),
  ticket INT,
  lugar_id INT,
  trabajador_id INT, -- Quien atiende en la tienda
  persona_id INT, -- ⚠️ Nueva columna que indica quién vendió el oro (sospechoso)
  FOREIGN KEY (lugar_id) REFERENCES Lugares(lugar_id),
  FOREIGN KEY (trabajador_id) REFERENCES Personas(persona_id),
  FOREIGN KEY (persona_id) REFERENCES Personas(persona_id) -- Relación directa con la persona que vende
);
INSERT INTO Detalle_Tienda (
  fecha_transaccion, oro_ingresado, descripcion_persona, ticket, lugar_id, trabajador_id, persona_id
) VALUES
-- Ventas asociadas a Adrián (alto, fuerte)
('2025-03-12', 150, 'Joven alto y fuerte', 1001, 4, 9, 1), -- Adrián
('2025-03-12', 200, 'Joven alto y fuerte', 1002, 5, 11, 1), -- Adrián
('2025-03-12', 250, 'Joven alto y fuerte', 1003, 6, 12, 1), -- Adrián
-- Venta asociada a Simba (alto, fuerte)
('2025-03-12', 100, 'Joven alto y fuerte', 1004, 4, 9, 3); -- Simba

-- ==============================
-- TABLA: Ubicacion_Persona
-- ==============================
CREATE TABLE Ubicacion_Persona (
  up_id INT AUTO_INCREMENT PRIMARY KEY,
  persona_id INT,
  lugar_id INT,
  desde TIME,
  hasta TIME,
  FOREIGN KEY (persona_id) REFERENCES Personas(persona_id),
  FOREIGN KEY (lugar_id) REFERENCES Lugares(lugar_id)
);
INSERT INTO Ubicacion_Persona VALUES
(1,1,1,'13:00:00','14:00:00'),
(2,2,1,'13:00:00','14:00:00'),
(3,3,2,'13:15:00','14:00:00'),
(4,4,2,'13:00:00','14:00:00'),
(5,5,3,'13:00:00','14:00:00');






