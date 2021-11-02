
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

