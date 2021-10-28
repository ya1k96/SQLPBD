--CREAMOS LA BASE DE DATOS
CREATE DATABASE yosubo;
USE yosubo;

--TIPO_BASE
CREATE TABLE tipo_base (
	idtipobase INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(200)
);

--TIPO_USUARIO
CREATE TABLE tipo_usuario(
	idtipo_usuario INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR (20)
);

--LOCALIDAD
CREATE TABLE localidad(
	idlocalidad INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(255)
);

--COMBI
CREATE TABLE combi (
	idcombi INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(255),
	idlocalidad INT,
	CONSTRAINT FK_id_localidad FOREIGN KEY (idlocalidad) REFERENCES localidad(idlocalidad)
);

--BASE
CREATE TABLE base(
	idbase INT IDENTITY PRIMARY KEY,
	idtipobase INT,
	idcombi INT,
	direccion VARCHAR(255),
	CONSTRAINT FK_id_tipo_base FOREIGN KEY (idtipobase) REFERENCES tipo_base(idtipobase),
	CONSTRAINT FK_id_combi FOREIGN KEY (idcombi) REFERENCES combi(idcombi)
);

--MARCA
CREATE TABLE marca(
	idmarca INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(250),
);
--MODELO
CREATE TABLE modelo(
	idmodelo INT IDENTITY PRIMARY KEY,
	idmarca INT,
	descripcion VARCHAR(250),
	anio INT, --EL ANTERIOR ESTABA CON ñ NO SE PUEDE USAR
	CONSTRAINT FK_id_marca FOREIGN KEY (idmarca) REFERENCES marca(idmarca),
);

--UNIDADES
CREATE TABLE unidad(
	idunidad INT IDENTITY PRIMARY KEY,
	idmodelo INT,
	idmarcar INT,
	disponible INT, 
    capacidad INT -- CAMPO NUEVO
);

--HORARIO
CREATE TABLE horario(
	idhorario INT IDENTITY PRIMARY KEY,
	idcombi INT,
	hora INT,
	destino VARCHAR(200),
	origen VARCHAR(200)
	CONSTRAINT FK_idcombi FOREIGN KEY (idcombi) REFERENCES combi(idcombi)
);

--SALIDA
CREATE TABLE salida(
	idsalida INT IDENTITY PRIMARY KEY,
	idunidad INT,
	idhorario INT,
	fecha DATE,
	CONSTRAINT FK_id_unidad FOREIGN KEY (idunidad) REFERENCES unidad(idunidad),
	CONSTRAINT FK_id_horario FOREIGN KEY (idhorario) REFERENCES horario(idhorario)
);

	--VERIFICAR QUE SEA SOLO 1 (SI) O 0 (NO)
ALTER TABLE unidad
	ADD CONSTRAINT ck_disponible_field CHECK( disponible IN(1, 0) );

--TIPO_RESERVA
CREATE TABLE tipo_pago(
	idtipo_pago INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR (20)
);
--
--		TABLAS PARA PAGOS
--			AÑADIMOS ESTAS TABLAS PARA RESOLVER ALGUNAS INCONSISTENCIAS 
--
CREATE TABLE pago(
	idpago INT PRIMARY KEY,
	total DECIMAL(19,4),
	fecha DATE
);

CREATE TABLE pago_detalle(
	idpago_detalle INT PRIMARY KEY,
	subtotal DECIMAL(19,4),
	idpago INT,
	CONSTRAINT FK_idpago FOREIGN KEY (idpago) REFERENCES pago(idpago)
);
--
--

--RESERVAS
CREATE TABLE reserva(
	idreserva INT IDENTITY PRIMARY KEY,
	idsalida INT,
	idtiporeserva INT,
	idusuario INT
);
	--CREACION DE CLAVES FORANEAS
ALTER TABLE reserva
	ADD CONSTRAINT FK_id_salida FOREIGN KEY (idsalida) REFERENCES salida(idsalida);
ALTER TABLE reserva
	ADD CONSTRAINT FK_id_tipo_reserva FOREIGN KEY (idtiporeserva) REFERENCES tipo_reserva(idtipo_reserva);
ALTER TABLE reserva 
	ADD CONSTRAINT FK_id_usuario FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);	

--USUARIO
CREATE TABLE usuario(
	idUsuario INT IDENTITY PRIMARY KEY,
	idTipoUsuario VARCHAR(1) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(250) NOT NULL,
	contras VARCHAR(50) NOT NULL,
	CONSTRAINT CK_idTipoUsuario CHECK (idTipoUsuario in ('I', 'R')),
);

--PROBANDO GIT

--LOTE DATOS 

--TIPO DE BASE DONDE PUEDEN SUBIR/RESERVAR LUGAR EL USUARIO

insert into tipo_base (descripcion) values ('Terminal');
insert into tipo_base (descripcion) values ('Hostpost');
insert into tipo_base (descripcion) values ('Base local');
select descripcion from tipo_base;

--LOCALIDADES DE CORRIENTES 
insert into localidad (descripcion) values ('Corrientes Capital');
insert into localidad (descripcion) values ('San Cosme');
insert into localidad (descripcion) values ('Santa Ana');
insert into localidad (descripcion) values ('Itatí');
insert into localidad (descripcion) values ('Paso de la Patria');
insert into localidad (descripcion) values ('San Luis');
insert into localidad (descripcion) values ('Caa Catí');
insert into localidad (descripcion) values ('Verón de Astrada');
insert into localidad (descripcion) values ('Bella Vista');
insert into localidad (descripcion) values ('Esquina');
insert into localidad (descripcion) values ('Mburucuya');
insert into localidad (descripcion) values ('Santo Tomé');
insert into localidad (descripcion) values ('Ituzaingo');
insert into localidad (descripcion) values ('Mercedes');
insert into localidad (descripcion) values ('Paso de los Libres');
insert into localidad (descripcion) values ('Sauce');
insert into localidad (descripcion) values ('Colonia Pellegrini');
insert into localidad (descripcion) values ('Empedrado');
insert into localidad (descripcion) values ('Ita Ibate ');
insert into localidad (descripcion) values ('La Cruz');
insert into localidad (descripcion) values ('Monte Caseros');
insert into localidad (descripcion) values ('Apipe');
insert into localidad (descripcion) values ('Virasoro');
select descripcion from localidad;

--Combis 

insert into combi (idlocalidad, nombre) values (2, 'Minibus Gato');
insert into combi (idlocalidad, nombre) values (2, 'Minibus 8 de Enero');
insert into combi (idlocalidad, nombre) values (1, 'Minibus Rappido Bus');
insert into combi (idlocalidad, nombre) values (4, 'Empresa Itatí');
insert into combi (idlocalidad, nombre) values (5, 'Locco de+');
insert into combi (idlocalidad, nombre) values (6, 'JaimeBus');
insert into combi (idlocalidad, nombre) values (7, 'Escolar n 111');
insert into combi (idlocalidad, nombre) values (8, 'Minibus Trebol Bus');
insert into combi (idlocalidad, nombre) values (9, 'Río Uruguay');
insert into combi (idlocalidad, nombre) values (10, 'Flecha Bus');
insert into combi (idlocalidad, nombre) values (11, 'lelo Bus');

select nombre from combi;

--Horarios 

insert into horario(idcombi, hora, destino, origen) values (1, 07, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 08, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 09, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 10, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 11, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 12, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 15, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 16, 'Corrientes', 'San Cosme');
insert into horario(idcombi, hora, destino, origen) values (1, 07, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 08, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 09, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 10, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 11, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 12, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 15, 'San Cosme','Corrientes');
insert into horario(idcombi, hora, destino, origen) values (1, 16, 'San Cosme','Corrientes');

select * from horario;

--Marca de las unidades

insert into marca (descripcion) values ('Mercedes Venz');
insert into marca (descripcion) values ('Fiat');
insert into marca (descripcion) values ('Peugeot');
insert into marca (descripcion) values ('KIA');
insert into marca (descripcion) values ('Renault');
insert into marca (descripcion) values ('Ivecco');

select descripcion from marca;

--Modelos

insert into modelo (idmarca, descripcion, anio) values (1, 'Sprinter', 2018);
insert into modelo (idmarca, descripcion, anio) values (2, 'Ducatto', 2021);
insert into modelo (idmarca, descripcion, anio) values (3, 'Family MAX', 2014);
insert into modelo (idmarca, descripcion, anio) values (4, 'Ribeert 3067', 2018);
insert into modelo (idmarca, descripcion, anio) values (5, 'Master', 2015);
insert into modelo (idmarca, descripcion, anio) values (6, 'Daily', 2011);

select * from modelo;

--Tipos de usuarios regular e irregular es por categorizacion

insert into tipo_usuario (descripcion) values ('R');
insert into tipo_usuario (descripcion) values ('I');

select descripcion from tipo_usuario;

--Usuario 

insert into usuario (idTipoUsuario, nombre, correo, contras) values ( 'R', 'Sosa Matias Agustin', 'agustinelmejor@gmail.com', '123456789');
insert into usuario (idTipoUsuario, nombre, correo, contras) values ( 'I', 'Yamil Martinez', 'yamil@gmail.com', '123456789');
insert into usuario (idTipoUsuario, nombre, correo, contras) values ( 'R', 'Larisa Romero', 'larisa@gmail.com', '123456789');
insert into usuario (idTipoUsuario, nombre, correo, contras) values ( 'R', 'Hernan Alegre', 'alegrehernan@gmail.com', '123456789');

select * from usuario;

--Tipo reserva, fijaos porque esta tipo de reserva y comparar con tipo base creo que yo flashee aca jeje 

insert into tipo_reserva (descripcion) values ('Frecuente');
insert into tipo_reserva (descripcion) values ('NO frecuente');

select * from tipo_reserva;

--Salida 
insert into salida ( idhorario, fecha) values ( 1, '2021-10-21');
select * from salida;
--Reservas 
 insert into reserva (idtiporeserva, idusuario) values ( 1, 2);

 select * from reserva;

 --Hay que revisar las restricciones de identity, cambie algunas variables que estaban mal escritas, corrobar todo y ver como explota