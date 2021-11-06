
CREATE FUNCTION fnLugarDisponible (@idsalida int)
RETURNS INT
AS
BEGIN 
	RETURN (SELECT COUNT(*) FROM salida
	INNER JOIN unidad ON salida.idunidad = unidad.idunidad
	WHERE idsalida = @idsalida AND unidad.capacidad > 
	(SELECT COUNT(*) FROM reserva WHERE idsalida = @idsalida))
END;
GO

CREATE FUNCTION fnReservasPagadas (@idsalida int)
RETURNS TABLE
AS
RETURN (SELECT idreserva, idusuario FROM reserva WHERE idsalida = @idsalida AND idpago <> NULL) 
GO;

CREATE FUNCTION fnLugaresLibres (@idsalida int, @fecha DATE)
RETURNS INT
AS
BEGIN 
	RETURN (SELECT COUNT(*) FROM reserva WHERE idsalida = @idsalida)
END;
GO

CREATE FUNCTION fnSalidasDelDia (@fecha VARCHAR(30))
RETURNS TABLE
AS
	RETURN (SELECT salida.idsalida, horario.hora, horario.destino, horario.origen FROM salida 
			INNER JOIN horario ON salida.idhorario = horario.idhorario
			WHERE fecha = @fecha)
GO

--TRANSACCION DE RESESERVA
CREATE PROCEDURE fnCrearReserva(
@idreserva INT, 
@idsalida INT, 
@idtiporeserva INT, 
@idusuario INT, 
@idpago INT)
AS
BEGIN TRANSACTION 
BEGIN 
	IF (dbo.fnLugarDisponible(@idsalida) = 1) 
	  BEGIN
			INSERT INTO reserva (idreserva, idsalida, idtiporeserva, idusuario, idpago) 
			VALUES (@idreserva, @idsalida, @idtiporeserva, @idusuario, @idpago);        
			COMMIT
	  END    
	ELSE
	BEGIN
		PRINT 'No hay lugares disponibles'
		ROLLBACK
	END

END

CREATE FUNCTION fnObtenerReservasPorFecha (@fecha VARCHAR(30))
RETURNS TABLE
AS
	RETURN (
	SELECT salida.idsalida, reserva.idreserva, reserva.idusuario, reserva.idpago, reserva.idtiporeserva 
	FROM salida
	INNER JOIN reserva ON salida.idsalida = reserva.idsalida
	WHERE fecha = @fecha)
GO

CREATE PROCEDURE dbo.fnCancelarReserva(@idreserva INT)
AS
BEGIN
SET NOCOUNT ON	             
    IF () 
	  BEGIN
		  DELETE from reserva where idreserva = @idreserva;
		PRINT ('Reserva cancelada.')
	  END    
	ELSE
	BEGIN
		PRINT ('Reserva no registrada.')
	END
END


CREATE FUNCTION fnPagarReserva(@idreserva INT, @idtipopago INT, @importe INT)
BEGIN
	DECLARE @existe INT, @lastid INT;
	SET @existe = (SELECT idreserva FROM reserva WHERE idreserva = @idreserva);

	IF(@existe == 1)
		BEGIN
			INSERT INTO pago(total, fecha) VALUES (GETDATE(), @importe);
			SET @lastid = IDENT_CURRENT('pago');
			UPDATE reserva 
			SET pago = @lastid
			WHERE idreserva = @idreserva;
		END
END