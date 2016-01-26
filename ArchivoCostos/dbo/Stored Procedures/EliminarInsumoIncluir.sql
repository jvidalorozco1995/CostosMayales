

create PROCEDURE [dbo].[EliminarInsumoIncluir] 
	@Id int

AS
BEGIN
	
	DELETE FROM InsumosIncluir WHERE Id=@Id


END


