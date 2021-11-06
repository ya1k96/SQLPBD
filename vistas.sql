CREATE VIEW view_proximas_salidas
AS SELECT * FROM salida WHERE fecha = CONVERT(varchar, GETDATE(),23);

CREATE VIEW view_total_recaudado
AS SELECT SUM(total) as 'Total recaudado historico' FROM pago;

CREATE VIEW view_cierre_dia
 AS SELECT SUM(total) AS 'Total recaudado en el día' FROM pago WHERE fecha = CONVERT(VARCHAR, GETDATE(),23); 
