
CREATE PROCEDURE [dbo].[InsertarFechaEstado] 
	@Fecha varchar(100)
AS
BEGIN
	
	insert into estados (fecha) values (@Fecha)


END

