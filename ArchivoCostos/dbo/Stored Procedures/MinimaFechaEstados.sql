
CREATE PROCEDURE [dbo].[MinimaFechaEstados] 
	@FechaMinima  varchar(50) OUTPUT
AS
BEGIN
	
	set @FechaMinima=(SELECT MIN(Fecha) as fecha from ESTADOS)

END

