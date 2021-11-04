USE master
USE yosubo;
GO
--CREACION DE USUARIOS DE SESION
--EJEMPLO DE USUARIO SIN PERMISOS
CREATE LOGIN agustin with password='12345';
GO
CREATE USER Uagustin FOR LOGIN [agustin];

--USUARIO CON PERMISOS
CREATE LOGIN yamil with password='12345';
GO
CREATE USER Uyamil FOR LOGIN yamil;

ALTER ROLE db_denydatawriter ADD MEMBER Uyamil;
ALTER ROLE db_datareader ADD MEMBER Uyamil;

ALTER ROLE db_denydatawriter ADD MEMBER Uagustin;
ALTER ROLE db_datareader ADD MEMBER Uagustin;


--FUNCIONES Y PROCEDIMIENTOS
GRANT EXECUTE ON dbo.fnCrearReserva TO Uyamil;
GRANT EXECUTE ON dbo.fnCrearReserva TO Uagustin;
--USUARIO CON PERMISOS LIMITADOS


SELECT * FROM combi;
DELETE combi WHERE idcombi = 100
INSERT INTO combi(idcombi,idlocalidad, nombre) VALUES (100,2,'pepe')
SELECT * FROM tipo_base;
