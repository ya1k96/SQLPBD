CREATE TRIGGER TR_reserva 
ON reserva
AFTER INSERT --Le decimos que se ejecute despues de una insercion
AS
BEGIN
    SET NOCOUNT ON; --Le decirle al servidor de base de datos que no queremos que nos devuelva le n�mero de filas afectadas
    INSERT INTO reserva( --Insertamos el registro en la tabla reserva
    idreserva,
		idsalida,
		idtiporeserva,
		idusuario
    )
    SELECT --Seleccionamos los datos a guardar
        CONCAT('Reserva realizada con id:',i.idreserva) AS evento,
		'Reserva',
		'INSERT',
		CURRENT_USER --Usuario actual
    FROM
        inserted i; --Tabla virtual de reserva insertado
END