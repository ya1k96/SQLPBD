USE yosubo;

CREATE PROCEDURE fn_insertar_reserva
@idreserva INT, 
@idsalida INT, 
@idtiporeserva INT, 
@idusuario INT, 
@idpago INT
AS
BEGIN --DEFINICION DE LAS INSTRUCCIONES
BEGIN TRAN --INDICA EL PUNTO INICIAL DE LA TRANSACCION 

INSERT INTO reserva ([idreserva], [idsalida], [idtiporeserva], [idusuario], [idpago]) 
VALUES(@idreserva, @idsalida, @idtiporeserva, @idusuario, @idpago) 
IF @@ERROR <> 0 GOTO verError --VERIFICA SI UN ERROR SE PRODUJO
COMMIT TRAN  --MARCA EL FINAL DE UNA TRANSACCION QUE SE HIZO CORRECTAMENTE
RETURN(0) 
verError: ROLLBACK --REVIERTE UNA TRANSACCION
TRAN RETURN (-1)
END