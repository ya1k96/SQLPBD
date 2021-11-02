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
( 5, 5, 1, '2021-10-21'),( 6, 6, 1, '2021-10-21'),( 7, 7, 1, '2021-10-21');
select * from salida;

--Reservas 
INSERT INTO reserva (idreserva, idsalida, idtiporeserva, idusuario, idpago) VALUES 
(1, 1, 1, 1, NULL),(2, 1, 1, 2, NULL),(3, 1, 1, 3, NULL),(4, 2, 1, 4, NULL),
(5, 2, 1, 2, NULL),(6, 1, 1, 3, NULL);

SELECT * FROM reserva;
SELECT * FROM localidad;
SELECT * FROM tipo_reserva;
SELECT * FROM unidad;
SELECT * FROM usuario;
SELECT * FROM modelo;
SELECT * FROM tipo_usuario;
SELECT * FROM horario;
SELECT * FROM marca;
SELECT * FROM combi;

USE yosubo;

-- FUNCION PARA SABER SI HAY LUGAR DISPONIBLE 
-- @param idsalida: id de la salida que querramos buscar
PRINT dbo.fnLugarDisponible(1);