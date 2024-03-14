CREATE DATABASE bazan;

USE bazan;

CREATE TABLE IF NOT EXISTS bazan.cliente(
	id INT NOT NULL AUTO_INCREMENT,
    DNI INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(55),
    telefono INT,
    localidad VARCHAR(30),
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS bazan.proveedor(
	id INT NOT NULL AUTO_INCREMENT,
    descuentos INT,
    rubro VARCHAR(30),
    fecha_entrega DATE,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS bazan.vendedor(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    sucursal VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS bazan.reparto(
	id INT NOT NULL AUTO_INCREMENT,
    nombre_repartidor VARCHAR(30) NOT NULL,
	cantidad_pedidos INT,
    lugar_envio VARCHAR(30),
    fecha_envio DATE,
	id_cliente INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_idclient FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS bazan.producto(
	id INT NOT NULL AUTO_INCREMENT,
    id_proveedor INT,
    codigo_barra INT NOT NULL,
    nombre_product VARCHAR(80),
    rubro_product VARCHAR(30),
    marca VARCHAR(30),
    fecha_ingreso DATE,
    PRIMARY KEY (id),
    CONSTRAINT fk_prodc_prove FOREIGN KEY (id_proveedor) REFERENCES proveedor(id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS bazan.stock(
	id INT NOT NULL AUTO_INCREMENT,
    id_producto INT NOT NULL,
    disponibilidad VARCHAR(2),
    cantidad INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_stock_product FOREIGN KEY (id_producto) REFERENCES producto (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS bazan.pedido(
	id INT NOT NULL AUTO_INCREMENT,
    id_producto INT NULL,
    id_cliente INT NULL,
    id_vendedor INT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    fecha_pedido DATE,
    monto INT NOT NULL,
    PRIMARY KEY (id),
 	CONSTRAINT fk_pedido_product FOREIGN KEY (id_producto) REFERENCES producto (id) ON DELETE RESTRICT ON UPDATE CASCADE,
 	CONSTRAINT fk_pedido_client FOREIGN KEY (id_cliente) REFERENCES cliente (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_pedido_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- SCRIPT DE INSERCIÓN DE DATOS

-- CLIENTES
INSERT INTO bazan.cliente (id,DNI, nombre, apellido, email, telefono, localidad)
VALUES
(1, 224359960, 'Cristian', 'gonzales', 'aglo@gmail.com', 351298272, 'Cordoba'),
(2, 222345692, 'Lucia', 'Gomez', 'luiop@hotmail.com', 294338654, 'Neuquen'),
(3, 221954585, 'Oscar', 'Samudio', 'osc@hotmail.com', 387234161, 'La rioja'),
(4, 244569872, 'Ignacio', 'Ramirez', 'nachob@gmail.com', 15244599, 'San Juan'),
(5, 234452341, 'Tamara', 'Lucero', 'tam@Outlook.com', 555329429, 'Mendoza'),
(6, 345554312,'Omar', 'Villagra', 'luchvi@google.com', 351234252, 'Cordoba'),
(7, 429994443, 'Luis', 'Garcia', 'Ldfar@google.com', 24214122, 'Cordoba'),
(8, 241425354, 'Esmeralda', 'Oviedo', 'tttere@gmail.com', 351234523, 'Neuquen'),
(9, 552134883, 'Facundo', 'Gonzales', 'fgon@hotmail.com', 55522124, 'Chaco'),
(10, 164458755, 'Roberto', 'Diaz', 'robdim@outlook.com', 249499143, 'Buenos Aires'),
(11, 254967455, 'Rosario', 'India', 'roggdim@outlook.com', 249499146, 'Buenos Aires'),
(12, 276786455, 'Ramon', 'Gomez', 'royjtjytt@outlook.com', 249499145, 'Chaco'),
(13, 284456455, 'Raul', 'Garcia', 'rwoerdt@outlook.com', 249499144, 'Buenos Aires')
;

-- PROVEEDOR
INSERT INTO bazan.proveedor (id, descuentos, rubro, fecha_entrega)
VALUES
(1,15,'limpieza','2023-06-10'),
(2,20,'papeles','2023-02-17'),
(3,5,'pañales','2023-02-9'),
(4,3, 'Colonia','2024-01-18'),
(5,5, 'capilares','2024-01-21'),
(6,10, 'bebes y niños','2024-02-05'),
(7,12, 'cosmetica','2023-08-08'),
(8,10,'cuidados personales','2024-01-23')
;


-- VENDEDOR
INSERT INTO bazan.vendedor (id, nombre, apellido, sucursal)
VALUES
(1,'Candelaria','Ferreyra','B1'),
(2,'Ignacio','Lopez','B2'),
(3,'Roman','Messi','B2'),
(4,'Lorena','Sanchez','B1'),
(5,'Laura','Diaz','B2'),
(6,'Lucas','Assenza','B1'),
(7,'Jorge','Gomez','B1'),
(8,'Lucas','Bazan','B2'),
(9,'Lautaro','Martinez','B1'),
(10,'Ramon','Perez','B1')
;


-- REPARTO
INSERT INTO bazan.reparto (id, nombre_repartidor, cantidad_pedidos, lugar_envio, fecha_envio, id_cliente)
VALUES
(1, 'Carlos', 14, 'Maipu 57', '2023-06-18', 1),
(2, 'Alberto', 12, 'Belgrano 215', '2023-08-30', 3),
(3, 'Jose', 10, 'Vieytes 180', '2023-09-15', 2),
(4, 'Pedro', 15, 'Julio Rocca 250', '2023-07-18', 6),
(5, 'Raul', 6, 'Maipu 100', '2023-05-29', 7),
(6, 'Gonzalo', 8, 'Fournier 2034', '2023-08-27', 4),
(7, 'Ramiro', 11, 'Belgrano 778', '2023-04-15', 8),
(8, 'Melani', 12, 'Fournier 2055', '2023-05-30', 5),
(9,'Martin', 10, 'Fournier 1884', '2023-10-02', 9),
(10, 'Marta', 7, 'Roma 44', '2023-10-04', 10)
;


-- PRODUCTO
INSERT INTO bazan.producto (id, id_proveedor, codigo_barra, nombre_product, rubro_product, marca, fecha_ingreso)
VALUES
(1,5,77134523,'OLIO*BALSAM AC x420ml EXTRA ACIDO','Capilar','OLIO','2022-12-07'),
(2,8,77954710,'ALGABO*HISOPOS x100un','Cuidado Personal','ALGABO','2023-02-22'),
(3,5,77912740,'ALTA MODA*AC x300ml COLOR PROTECTION','Capilar','ALTA MODA','2023-10-09'),
(4,5,77914423,'ESTEREO COLOR*FUNKY COLORS TURQUESA','Capilar','ESTEREO COLOR', '2023-08-24'),
(5,8,77907706,'NOSOTRAS*PROT.DIARIOS x20un MULTIESTILO','Cuidado Personal','NOSOTRAS','2023-12-04'),
(6,5,77930082,'ISSUE*TINT.7 RUBIO','Capilar','ISSUE','2023-06-15'),
(7,2,77916064,'HIGIENOL*PAP.HIG x4un SUAVE D.HOJA','Papeles','HIGIENOL','2023-07-01'),
(8,4,77946266,'KEVIN ROJO*EDT x60ml  C/VAP.','Colonia','KEVIN','2023-11-02'),
(9,3,77946260,'HUGGIES PLUS HIPER*PAÑAL x52un XG*','Pañales','HUGGIES','2023-10-01'),
(10,1,7790770,'MAGISTRAL*DETERGENTE x250ml','Limpieza','MAGISTRAL','2023-01-01')
;


-- STOCK
INSERT INTO bazan.stock (id, id_producto, disponibilidad, cantidad)
VALUES
(1,3,'Si',298),
(2,4,'Si',309),
(3,1,'Si',4933),
(4,2,'Si',921),
(5,5,'Si',494),
(6,10,'Si',299),
(7,9,'Si',394),
(8,7,'Si',587),
(9,8,'Si',2),
(10,6,'Si',203)
;


-- PEDIDO
INSERT INTO bazan.pedido (id, id_producto, id_cliente, id_vendedor, nombre_cliente, fecha_pedido, monto)
VALUES
(1,3,1,2,'Cristian',CURRENT_DATE,18000),
(2,2,3,6,'Oscar', '2023-08-23',5000),
(3,6,2,2,'Lucia', '2023-09-12',8500),
(4,5,6,4,'Omar', '2023-07-01',4000),
(5,3,7,6,'Luis', '2023-05-12',4999),
(6,2,4,1,'Ignacio',CURRENT_DATE,10000),
(7,10,8,3,'Esmeralda', '2023-04-02',2030),
(8,7,9,5,'Facundo','2023-05-17',5999),
(9,6,10,6,'Roberto','2023-09-20',7000),
(10,6,10,6,'Roberto','2023-09-21',7500)
;


-- CREACIÓN DE VISTAS

-- Buscar que productos tienen como proveedor al 5 (Capilares)
CREATE OR REPLACE VIEW vista_product AS
(SELECT id_proveedor, nombre_product, rubro_product
FROM producto
WHERE id_proveedor = 5);


-- Buscar que productos tienen mas de 500 unidades en stock.
CREATE OR REPLACE VIEW v_stock AS
(SELECT id_producto, cantidad, nombre_product
FROM stock as s JOIN producto as p ON (p.id = s.id_producto)
WHERE cantidad>500
);


-- Buscar los vendedores que trabajan en la sucursal B1
CREATE OR REPLACE VIEW v_vendeB1 AS
(SELECT nombre,apellido,sucursal
FROM vendedor
WHERE sucursal = 'B1'
);


-- Buscar los clientes que vivan en Córdoba
CREATE OR REPLACE VIEW v_client AS
(SELECT DNI,nombre, apellido, localidad
FROM cliente
WHERE localidad = 'Cordoba'
);


-- Buscar todos los pedidos cuya fecha de envío sea hoy y su monto sea mayor a 2000
CREATE OR REPLACE VIEW v_pedido AS
(SELECT id, id_producto, fecha_pedido, monto
FROM pedido
WHERE fecha_pedido = CURRENT_DATE 
AND monto > 2000
);


-- CREACIÓN DE STORED PROCEDURES

/*
 En este store procedure busco que me ordene por el campo ingresado en el parametro, de forma ascendente o descendente
 los registros que se encuentran en la tabla ingresada por parametro.
 En este caso utilizo la tabla Producto y lo ordeno de forma ascendente por la fecha de ingreso de cada producto.
*/

drop procedure if exists sp_ordenar;
DELIMITER //
CREATE PROCEDURE sp_ordenar(IN tabla VARCHAR(60), IN campo VARCHAR(60), IN orden VARCHAR(4)) 
BEGIN
IF (orden != 'ASC' AND orden != 'DESC') THEN
	SIGNAL SQLSTATE '45000' SET message_text = 'El parametro debe ser ASC o DESC.';
ELSE
	SET @ordenar = CONCAT('SELECT * FROM', ' ', tabla, ' ', 'ORDER BY', ' ',campo, ' ', orden) ;
END IF;

PREPARE consult FROM @ordenar;
EXECUTE consult;
DEALLOCATE PREPARE consult;

END
//
DELIMITER ;

-- call sp_ordenar('producto', 'fecha_ingreso', 'DESC');


/*
En este store procedure busco actualizar la cantidad de stock de un producto, para ello utilizo la tabla insercion.stock,
 los campos id_producto y cantidad. Por un parametro ingreso la cantidad que quiero actualizar y el id del producto 
 al que se le va a cambiar. 
*/

drop procedure if exists sp_actualizar_reg ;
DELIMITER //
CREATE PROCEDURE sp_actualizar_reg (IN id_producto_sp INT, IN cantidad_sp INT)
BEGIN
UPDATE stock
SET cantidad = cantidad_sp
WHERE id_producto_sp = id_producto;

END
//
DELIMITER ;

-- call sp_actualizar_reg (2, 500);
-- SELECT * FROM stock


-- CREACIÓN DE FUNCIONES

-- Funcion que devuelve una id de un pedido cuyo monto esta entre 2 valores ingresados por parametro
DELIMITER //
CREATE FUNCTION f_monto_pedido(monto1 INT, monto2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado int;
	SET resultado = (SELECT `id` FROM  pedido WHERE monto1 < monto and monto2 > monto);
	RETURN resultado;
END
// 
DELIMITER ;
-- SELECT f_monto_pedido(8000, 9000) AS Id_pedido;


-- Funcion que retorna la marca de un producto cuya nombre sea el ingresado en el parametro
DELIMITER //
CREATE FUNCTION f_marca_producto (nombre_producto VARCHAR(60))
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(60);
	SET Resultado = (SELECT `marca` FROM producto WHERE nombre_product LIKE nombre_producto);
	RETURN resultado;
END// 
DELIMITER ;
-- SELECT f_marca_producto('ALGABO*HISOPOS x100un') AS Nombre_marca


-- CREACIÓN DE TRIGGERS

/*
Este trigger lo hice para implementar el stored procedure que actualiza la cantidad de stock.
Cree la tabla de auditoria "auditoria_stock", en ella se guardan los viejos y nuevos registros de la cantidad amedida que se va actualizando el stock.
Mientras que el trigger actua cuando se utiliza un UPDATE en la tabla de stock.
El campo usuario me indica que usuario realizo la operacion y el campo tipo_mov me indica el tipo de movimiento que se produjo.
*/
CREATE TABLE IF NOT EXISTS auditoria_stock(
id_log INT PRIMARY KEY AUTO_INCREMENT,
id_stock INT,
id_producto INT,
Vieja_cantidad INT,
usuario VARCHAR(60),
tipo_mov VARCHAR(60),
Nueva_cantidad INT
);

DROP TRIGGER IF EXISTS log_auditoria_stock;

CREATE TRIGGER log_auditoria_stock
AFTER UPDATE ON stock
FOR EACH ROW
INSERT INTO auditoria_stock VALUES
(DEFAULT, old.id, old.id_producto, OLD.cantidad, USER(), 'Se ha actualizado el stock de un producto', NEW.cantidad) ;



-- Este trigger se utiliza para saber cuando un empleado es eliminado del sistema.
CREATE TABLE IF NOT EXISTS auditoria_vendedor(
	id_log1 INT NOT NULL AUTO_INCREMENT,
    id_vendedor INT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    sucursal VARCHAR(30) NOT NULL,
    usuario VARCHAR(60),
    tipo_mov VARCHAR(60),
    PRIMARY KEY (id_log1)
);

DROP TRIGGER IF EXISTS log_auditoria_vendedor;

CREATE TRIGGER log_auditoria_vendedor
BEFORE DELETE ON vendedor
FOR EACH ROW
INSERT INTO auditoria_vendedor VALUES
(DEFAULT, OLD.id, OLD.nombre, OLD.apellido, OLD.sucursal, USER(), 'Se elimino un vendedor.') ;



