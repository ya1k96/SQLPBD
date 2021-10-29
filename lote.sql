--LOTE DATOS 

--TIPO DE BASE DONDE PUEDEN SUBIR/RESERVAR LUGAR EL USUARIO

INSERT INTO tipo_base (idtipobase, descripcion) VALUES (1,'Terminal'),(2,'Hostpost'),
(3,'Base local')

--LOCALIDADES DE CORRIENTES 
INSERT INTO localidad (idlocalidad, descripcion) VALUES (1,'Corrientes Capital'),
(2,'San Cosme'),(3,'Santa Ana'),(4,'Itatí'),(5,'Paso de la Patria'),(6,'San Luis'),(7,'Caa Catí'),(8,'Verón de Astrada'),(9,'Bella Vista'),(10,'Esquina'),(11,'Mburucuya'),(12,'Santo Tomé'),(13,'Ituzaingo'),(14,'Mercedes'),(15,'Paso de los Libres'),(16,'Sauce'),(17,'Colonia Pellegrini'),(18,'Empedrado'),(19,'Ita Ibate '),(20,'La Cruz'),(21,'Monte Caseros'),(22,'Apipe'),(23,'Virasoro');

--Combis 

INSERT INTO combi (idcombi,idlocalidad, nombre) VALUES (1,2, 'Minibus Gato'),(2,2, 'Minibus 8 de Enero'),(3,1, 'Minibus Rappido Bus'),(4,4, 'Empresa Itatí'),(5,5, 'Locco de+'),(6,6, 'JaimeBus'),(7,7, 'Escolar n 111'),(8,8, 'Minibus Trebol Bus'),(9, 9,'Río Uruguay'),(10, 10,'Flecha Bus'),(11, 11, 'lelo Bus');

select nombre from combi;

--Horarios 

INSERT INTO horario(idhorario, idcombi, hora, destino, origen) VALUES (1,1, 07, 'Corrientes', 'San Cosme'),(2,1, 08, 'Corrientes', 'San Cosme'),(3,1, 09, 'Corrientes', 'San Cosme'),(4,1, 10, 'Corrientes', 'San Cosme'),(5,1, 11, 'Corrientes', 'San Cosme'),(6,1, 12, 'Corrientes', 'San Cosme'),(7,1, 15, 'Corrientes', 'San Cosme'),(8,1, 16, 'Corrientes', 'San Cosme'),(9,1, 07, 'San Cosme','Corrientes'),(10,1, 08, 'San Cosme','Corrientes'),(11,1, 09, 'San Cosme','Corrientes'),(12,1, 10, 'San Cosme','Corrientes'),(13,1, 11, 'San Cosme','Corrientes'),(14,1, 12, 'San Cosme','Corrientes'),(15,1, 15, 'San Cosme','Corrientes'),(16,1, 16, 'San Cosme','Corrientes');

select * from horario;

--Marca de las unidades

INSERT INTO marca (idmarca, descripcion) VALUES (1,'Mercedes Venz'),(2,'Fiat'),(3,'Peugeot'),(4,'KIA'),(5,'Renault'),(6,'Ivecco');

select descripcion from marca;

--Modelos

INSERT INTO modelo (idmodelo, idmarca, descripcion, anio) VALUES (1, 1, 'Sprinter', 2018),(2,2, 'Ducatto', 2021),(3,3, 'Family MAX', 2014),(4,4,'Ribeert 3067', 2018),(5, 5,'Master', 2015),(6, 6,'Daily', 2011);

select * from modelo;

--Tipos de usuarios regular e irregular es por categorizacion

INSERT INTO tipo_usuario (idtipo_usuario,descripcion) VALUES (1,'R'),(2,'I');

select descripcion from tipo_usuario;

--Usuario 

INSERT INTO usuario (idUsuario, idTipoUsuario, nombre, correo, contras) VALUES (1, 1, 'Sosa Matias Agustin', 'agustinelmejor@gmail.com', '123456789'),(2, 1, 'Yamil Martinez', 'yamil@gmail.com', '123456789'),( 3, 2, 'Larisa Romero', 'larisa@gmail.com', '123456789'),( 4, 2, 'Hernan Alegre', 'alegrehernan@gmail.com', '123456789');

select * from usuario;

--Salida 
INSERT INTO salida ( idhorario, fecha) VALUES( 1, '2021-10-21');
select * from salida;

--Reservas 
INSERT INTO reserva (idtiporeserva, idusuario) VALUES ( 1, 2);

 select * from reserva;