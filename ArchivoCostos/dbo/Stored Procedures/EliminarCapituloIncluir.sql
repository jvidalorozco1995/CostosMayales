

CREATE PROCEDURE [dbo].[EliminarCapituloIncluir] 
	@Id int

AS
BEGIN
	
	DELETE FROM CapitulosIncluir WHERE Id=@Id


END


