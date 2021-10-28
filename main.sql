--CREAMOS LA BASE DE DATOS
CREATE DATABASE yosubo;
USE yosubo;
--HORARIO
CREATE TABLE horario(
	idhorario INT IDENTITY PRIMARY KEY,
	idcombi INT,
	hora INT,
	destino VARCHAR(200),
	origen VARCHAR(200)
	CONSTRAINT FK_id_combi FOREIGN KEY (idcombi) REFERENCES combi(idcombi)
);
--COMBI
CREATE TABLE combi (
	idcombi INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(255),
	idlocalidad INT,
	CONSTRAINT FK_id_localidad FOREIGN KEY (idlocalidad) REFERENCES localidad(idlocalidad)
);
--LOCALIDAD
CREATE TABLE localidad(
	idlocalidad INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(255)
);
--TIPO_BASE
CREATE TABLE tipo_base (
	idtipobase INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(200)
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
--SALIDA
CREATE TABLE salida(
	idsalida INT IDENTITY PRIMARY KEY,
	idunidad INT,
	idhorario INT,
	fecha DATE,
	CONSTRAINT FK_id_unidad FOREIGN KEY (idunidad) REFERENCES unidad(idunidad),
	CONSTRAINT FK_id_horario FOREIGN KEY (idhorario) REFERENCES horario(idhorario)
);
--UNIDADES
CREATE TABLE unidad(
	idunidad INT IDENTITY PRIMARY KEY,
	idmodelo INT,
	idmarca INT,
	disponible INT, 
  capacidad INT -- CAMPO NUEVO
);
	--VERIFICAR QUE SEA SOLO 1 (SI) O 0 (NO)
ALTER TABLE unidad
	ADD CONSTRAINT ck_disponible_field CHECK( disponible IN(1, 0) );
--MODELO
CREATE TABLE modelo(
	idmodelo INT IDENTITY PRIMARY KEY,
	idmarca INT,
	descripcion VARCHAR(250),
	anio INT, --EL ANTERIOR ESTABA CON ñ NO SE PUEDE USAR
	CONSTRAINT FK_id_marca FOREIGN KEY (idmarca) REFERENCES marca(idmarca),
);
--MARCA
CREATE TABLE marca(
	idmarca INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(250),
);
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
	ADD CONSTRAINT FK_id_tipo_reserva FOREIGN KEY (idtiporeserva) REFERENCES tipo_reserva(idtiporeserva);
ALTER TABLE reserva 
	ADD CONSTRAINT FK_id_usuario FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);
	
--USUARIO
CREATE TABLE usuario(
	idUsuario INT IDENTITY PRIMARY KEY,
	idTipoUsuario VARCHAR(1) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(250) NOT NULL,
	contras VARCHAR(50) NOT NULL,
	CONSTRAINT CK_idTipoUsuario CHECK (idTipoUsuario in ('I', 'F')),
);

--TIPO_USUARIO
CREATE TABLE tipo_usuario(
	idtipo_usuario INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR (20)
);

--TIPO_RESERVA
CREATE TABLE tipo_reserva(
	idtipo_reserva INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR (20)
);

ALTER TABLE unidad  --NUEVO CAMPO
	ADD capacidad INT; 

--
--		TABLAS PARA PAGOS
--			AÑADIMOS ESTAS TABLAS PARA RESOLVER ALGUNAS INCONSISTENCIAS 
--
CREATE TABLE pago(
	idpago INT PRIMARY KEY,
	total DECIMAL(19,4),
	fecha DATE
);