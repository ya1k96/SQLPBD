
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
