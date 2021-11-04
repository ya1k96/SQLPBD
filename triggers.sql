CREATE TRIGGER TR_cargar_capacidad
    ON salida
    AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON;
    BEGIN
        --VARIABLES PARA ALMACENAR LOS DATOS
	   DECLARE @idsalida INT, 
	   @idreserva INT, 
	   @idunidad INT,
	   @capacidad INT;

	   --BUSCAMOS LA SALIDA
		SET @idsalida = (SELECT idsalida FROM inserted);
		SET @idunidad = (SELECT idunidad FROM inserted);
		SET @capacidad = (SELECT capacidad FROM unidad WHERE idunidad = @idunidad);

       --ACTUALIZAMOS EN LA TABLA DE SALIDAS LA CANTIDAD DE RESERVAS DISPONIBLES
	   UPDATE salida SET lugares = @capacidad WHERE idsalida = @idsalida;
	END

END
GO