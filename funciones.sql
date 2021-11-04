
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

CREATE PROCEDURE fnCrearReserva(
@idreserva INT, 
@idsalida INT, 
@idtiporeserva INT, 
@idusuario INT, 
@idpago INT)
AS
BEGIN
SET NOCOUNT ON	             
    IF (dbo.fnLugarDisponible(@idsalida) = 1) 
	  BEGIN
		BEGIN TRANSACTION
			INSERT INTO reserva (idreserva, idsalida, idtiporeserva, idusuario, idpago) 
			VALUES (@idreserva, @idsalida, @idtiporeserva, @idusuario, @idpago);        
			COMMIT
	  END    
	ELSE
	BEGIN
		RAISERROR (1,-1,-1, 'No hay lugares disponibles')
	END
END

CREATE FUNCTION fnObtenerReservasPorFecha (@fecha VARCHAR(30))
RETURNS TABLE
AS
	RETURN (SELECT salida.idsalida, reserva.idreserva, reserva.idusuario, reserva.idpago, reserva.idtiporeserva FROM salida
			INNER JOIN reserva ON salida.idsalida = reserva.idsalida
			WHERE fecha = @fecha)
GO

