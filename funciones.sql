--TEST FUNCTIONS
-- fnLugarDisponible
--Funcion para consultar la disponiblidad de la reserva
SELECT * FROM salida
INNER JOIN unidad ON salida.idunidad = unidad.idunidad
WHERE idsalida = id AND unidad.capacidad >= 
(SELECT COUNT(*) FROM reservas WHERE id)
