--DESKTOP-KCOAMHS\SQLEXPRESS
--LOTE DATOS 
USE yosubo;
ALTER TABLE unidad
	ADD idcombi INT
--TIPO DE BASE DONDE PUEDEN SUBIR/RESERVAR LUGAR EL USUARIO

INSERT INTO tipo_base (idtipobase, descripcion) VALUES (1,'Terminal'),(2,'Hostpost'),
(3,'Base local')

INSERT INTO tipo_reserva (idtiporeserva, descripcion) VALUES (1,'Paga Antes'),(2,'Paga despues');

--LOCALIDADES DE CORRIENTES 
INSERT INTO localidad (idlocalidad, descripcion) VALUES (1,'Corrientes Capital'),
(2,'San Cosme'),(3,'Santa Ana'),(4,'Itatí'),(5,'Paso de la Patria'),
(6,'San Luis'),(7,'Caa Catí'),(8,'Verón de Astrada'),(9,'Bella Vista'),
(10,'Esquina'),(11,'Mburucuya'),(12,'Santo Tomé'),(13,'Ituzaingo'),
(14,'Mercedes'),(15,'Paso de los Libres'),(16,'Sauce'),
(17,'Colonia Pellegrini'),(18,'Empedrado'),(19,'Ita Ibate '),
(20,'La Cruz'),(21,'Monte Caseros'),(22,'Apipe'),(23,'Virasoro');

--Combis 

INSERT INTO combi (idcombi,idlocalidad, nombre) VALUES 
(1,2, 'Minibus Gato'),(2,2, 'Minibus 8 de Enero'),
(3,1, 'Minibus Rappido Bus'),(4,4, 'Empresa Itatí'),
(5,5, 'Locco de+'),(6,6, 'JaimeBus'),(7,7, 'Escolar n 111'),
(8,8, 'Minibus Trebol Bus'),(9, 9,'Río Uruguay'),
(10, 10,'Flecha Bus'),(11, 11, 'lelo Bus');

--Horarios 

INSERT INTO horario(idhorario, idcombi, hora, destino, origen) VALUES 
(1,1, 07, 'Corrientes', 'San Cosme'),(2,1, 08, 'Corrientes', 'San Cosme'),
(3,1, 09, 'Corrientes', 'San Cosme'),(4,1, 10, 'Corrientes', 'San Cosme'),
(5,1, 11, 'Corrientes', 'San Cosme'),(6,1, 12, 'Corrientes', 'San Cosme'),
(7,1, 15, 'Corrientes', 'San Cosme'),(8,1, 16, 'Corrientes', 'San Cosme'),
(9,1, 07, 'San Cosme','Corrientes'),(10,1, 08, 'San Cosme','Corrientes'),
(11,1, 09, 'San Cosme','Corrientes'),(12,1, 10, 'San Cosme','Corrientes'),
(13,1, 11, 'San Cosme','Corrientes'),(14,1, 12, 'San Cosme','Corrientes'),
(15,1, 15, 'San Cosme','Corrientes'),(16,1, 16, 'San Cosme','Corrientes');
--Marca de las unidades

INSERT INTO marca (idmarca, descripcion) VALUES (1,'Mercedes Venz'),(2,'Fiat'),
(3,'Peugeot'),(4,'KIA'),(5,'Renault'),(6,'Ivecco');

--Modelos

INSERT INTO modelo (idmodelo, idmarca, descripcion, anio) VALUES 
(1, 1, 'Sprinter', 2018),(2,2, 'Ducatto', 2021),(3,3, 'Family MAX', 2014),
(4,4,'Ribeert 3067', 2018),(5, 5,'Master', 2015),(6, 6,'Daily', 2011);

--Tipos de usuarios regular e irregular es por categorizacion

INSERT INTO tipo_usuario (idtipo_usuario,descripcion) VALUES (1,'R'),(2,'I');

--Usuario 

INSERT INTO usuario (idUsuario, idTipoUsuario, nombre, correo, contras) VALUES 
(1, 1, 'Sosa Matias Agustin', 'agustinelmejor@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(2, 1, 'Yamil Martinez', 'yamil@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(3, 2, 'Larisa Romero', 'larisa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(4, 2, 'Hernan Alegre', 'alegrehernan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

INSERT INTO unidad(idunidad, idmodelo, idmarcar, disponible, capacidad, idcombi) VALUES
(1, 1, 1, 1, 20, 1),(2, 2, 2, 1, 20, 1),(3, 3, 3, 1, 20, 1)


--Salida 
INSERT INTO salida (idsalida, idhorario, idunidad, fecha) VALUES
( 2, 2, 1, '2021-10-21'),( 3, 3, 1, '2021-10-21'),( 4, 4, 1, '2021-10-21'),
( 5, 5, 1, '2021-10-21'),( 6, 6, 1, '2021-10-21'),( 7, 7, 1, '2021-10-21'),
( 8, 7, 1, '2021-11-02'),( 9, 7, 1, '2021-11-02');
select * from reserva WHERE idsalida = 2;
INSERT INTO salida (idsalida, idhorario, idunidad, fecha) VALUES
( 16, 4, 2, '2021-11-04')
--Reservas 
EXECUTE fnCrearReserva 41, 2, 1, 3, NULL;
EXECUTE fnCrearReserva 42, 2, 1, 4, NULL;
EXECUTE fnCrearReserva 43, 2, 1, 2, NULL;
EXECUTE fnCrearReserva 44, 1, 1, 3, NULL;
EXECUTE fnCrearReserva 40, 2, 1, 3, NULL;
EXECUTE fnCrearReserva 39, 2, 1, 3, NULL;
EXECUTE fnCrearReserva 45, 2, 1, 3, NULL;
EXECUTE fnCrearReserva 46, 2, 1, 4, NULL;
EXECUTE fnCrearReserva 47, 2, 1, 2, NULL;
EXECUTE fnCrearReserva 48, 1, 1, 3, NULL;
EXECUTE fnCrearReserva 49, 2, 1, 3, NULL;
EXECUTE fnCrearReserva 50, 2, 1, 3, NULL;

--VERFICAMOS LA CANTIDAD DE RESERVAS DE LA SALIDA
SELECT COUNT(*) FROM reserva WHERE idsalida = 2;
SELECT COUNT(*) FROM reserva WHERE idsalida = 1;

DELETE reserva WHERE idreserva = 39;
DELETE reserva WHERE idreserva = 40;
DELETE reserva WHERE idreserva = 41;
DELETE reserva WHERE idreserva = 42;
DELETE reserva WHERE idreserva = 43;
DELETE reserva WHERE idreserva = 44;
DELETE reserva WHERE idreserva = 45;
DELETE reserva WHERE idreserva = 46;
DELETE reserva WHERE idreserva = 47;
DELETE reserva WHERE idreserva = 48;
DELETE reserva WHERE idreserva = 49;
DELETE reserva WHERE idreserva = 50;

SELECT * FROM localidad;
SELECT * FROM tipo_reserva;
SELECT * FROM unidad;
SELECT * FROM usuario;
SELECT * FROM modelo;
SELECT * FROM tipo_usuario;
SELECT * FROM horario;
SELECT * FROM marca;
SELECT * FROM combi;
SELECT * FROM salida;

-- FUNCION PARA SABER SI HAY LUGAR DISPONIBLE 
-- @param idsalida: 
PRINT dbo.fnLugarDisponible(1);
-- FUNCION PARA VER LAS RESERVAS NO PAGADAS 
-- @param idsalida
SELECT * FROM dbo.fnReservasPagadas(1);
-- FUNCION PARA VER LAS SALIDAS DEL DIA
-- @param fecha AAAA-MM-DD
SELECT hora, origen, destino FROM dbo.fnSalidasDelDia('2021-11-02');
--FUNCION PARA VER LAS RESERVAS POR FECHA
-- @param fecha AAAA-MM-DD
SELECT * FROM fnObtenerReservasPorFecha('2021-11-02');

--PRUEBA PERMISOS
--USE yosubo;
--INSERT INTO reserva (idreserva, idsalida, idtiporeserva, idusuario, idpago) VALUES(90, 2, 1, 3, NULL);
--INSERT INTO usuario (idUsuario, idTipoUsuario, nombre, correo, contras) VALUES 
--(6, 1, 'Pablo Martinez', 'pablo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--PRUEBA PROCEDIMIENTO ALMACENADO (CON PERMISOS)
--EXECUTE fnCrearReserva 90, 2, 1, 3, NULL;

--PRUEBA TRIGGER CAPACIDAD
--INSERT INTO salida (idsalida, idhorario, idunidad, fecha) VALUES
--( 17, 4, 2, '2021-11-04')

--AGREGAR CAMPO
ALTER TABLE salida
	ADD lugares INT DEFAULT 0

CREATE VIEW view_proximas_salidas
AS SELECT * FROM salida WHERE fecha = CONVERT(varchar, GETDATE(),23)