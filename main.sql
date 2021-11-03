--CREAMOS LA BASE DE DATOS
CREATE DATABASE yosubo;
USE yosubo;

--TIPO_BASE
CREATE TABLE tipo_base (
	idtipobase INT PRIMARY KEY,
	descripcion VARCHAR(200)
);

--TIPO_USUARIO
CREATE TABLE tipo_usuario(
	idtipo_usuario INT PRIMARY KEY,
	descripcion VARCHAR (20)
);

--TIPO_RESERVA
CREATE TABLE tipo_reserva(
	idtiporeserva INT PRIMARY KEY,
	descripcion VARCHAR (20)
);

--LOCALIDAD
CREATE TABLE localidad(
	idlocalidad INT PRIMARY KEY,
	descripcion VARCHAR(255)
);

--COMBI
CREATE TABLE combi (
	idcombi INT PRIMARY KEY,
	nombre VARCHAR(255),
	idlocalidad INT,
	CONSTRAINT FK_id_localidad FOREIGN KEY (idlocalidad) REFERENCES localidad(idlocalidad)
);

--BASE
CREATE TABLE base(
	idbase INT PRIMARY KEY,
	idtipobase INT,
	idcombi INT,
	direccion VARCHAR(255),
	CONSTRAINT FK_id_tipo_base FOREIGN KEY (idtipobase) REFERENCES tipo_base(idtipobase),
	CONSTRAINT FK_id_combi FOREIGN KEY (idcombi) REFERENCES combi(idcombi)
);

--MARCA
CREATE TABLE marca(
	idmarca INT PRIMARY KEY,
	descripcion VARCHAR(250),
);
--MODELO
CREATE TABLE modelo(
	idmodelo INT PRIMARY KEY,
	idmarca INT,
	descripcion VARCHAR(250),
	anio INT, --EL ANTERIOR ESTABA CON ñ NO SE PUEDE USAR
	CONSTRAINT FK_id_marca FOREIGN KEY (idmarca) REFERENCES marca(idmarca),
);

--UNIDADES
CREATE TABLE unidad(
	idunidad INT PRIMARY KEY,
	idmodelo INT,
	idmarcar INT,
	disponible INT, 
  idcombi INT, --CAMPO NUEVO
  capacidad INT
);

--HORARIO
CREATE TABLE horario(
	idhorario INT PRIMARY KEY,
	idcombi INT,
	hora INT,
	destino VARCHAR(200),
	origen VARCHAR(200)
	CONSTRAINT FK_idcombi FOREIGN KEY (idcombi) REFERENCES combi(idcombi)
);

--SALIDA
CREATE TABLE salida(
	idsalida INT PRIMARY KEY,
	idunidad INT,
	idhorario INT,
	fecha DATE,
	CONSTRAINT FK_id_unidad FOREIGN KEY (idunidad) REFERENCES unidad(idunidad),
	CONSTRAINT FK_id_horario FOREIGN KEY (idhorario) REFERENCES horario(idhorario)
);

	--VERIFICAR QUE SEA SOLO 1 (SI) O 0 (NO)
ALTER TABLE unidad
	ADD CONSTRAINT ck_disponible_field CHECK( disponible IN(1, 0) );

--
--		TABLAS PARA PAGOS
--			AÑADIMOS ESTAS TABLAS PARA RESOLVER ALGUNAS INCONSISTENCIAS 
--
CREATE TABLE pago(
	idpago INT PRIMARY KEY,
	total DECIMAL(19,4),
	fecha DATE
);

CREATE TABLE tipo_pago(
	idtipopago INT,
	descripcion VARCHAR(100),
  CONSTRAINT FK_pago_id FOREIGN KEY (idtipopago)
  REFERENCES pago(idpago)	
);
--
--

--RESERVAS
CREATE TABLE reserva(
	idreserva INT PRIMARY KEY,
	idsalida INT,
	idusuario INT,
	idpago INT
);
	--CREACION DE CLAVES FORANEAS
ALTER TABLE reserva
	ADD CONSTRAINT FK_id_salida FOREIGN KEY (idsalida) REFERENCES salida(idsalida);
ALTER TABLE reserva 
	ADD CONSTRAINT FK_id_usuario FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);	
ALTER TABLE reserva 
	ADD CONSTRAINT FK_id_pago FOREIGN KEY (idpago) REFERENCES pago(idpago);	
ALTER TABLE reserva 
	ADD CONSTRAINT FK_id_tipo_reserva FOREIGN KEY (idtiporeserva) REFERENCES tipo_reserva(idtiporeserva);

--USUARIO
CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY,
	idTipoUsuario INT NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(250) NOT NULL,
	contras VARCHAR(50) NOT NULL,
	CONSTRAINT CK_idTipoUsuario CHECK (idTipoUsuario in (1, 2)),
);
ALTER TABLE usuario 
	ADD CONSTRAINT FK_id_tipo_usuario FOREIGN KEY (idTipoUsuario) REFERENCES tipo_usuario(idtipo_usuario);