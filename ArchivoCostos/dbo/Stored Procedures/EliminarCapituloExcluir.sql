
CREATE PROCEDURE [dbo].[EliminarCapituloExcluir] 
	@Presupuesto varchar(20),
	@Capitulo varchar(20)

AS
BEGIN
	
	DELETE FROM CapitulosExcluir WHERE Capitulo=@Capitulo and Presupuesto=@Presupuesto


END

