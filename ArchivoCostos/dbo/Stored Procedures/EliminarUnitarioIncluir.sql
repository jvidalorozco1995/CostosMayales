

create PROCEDURE [dbo].[EliminarUnitarioIncluir] 
	@Id int

AS
BEGIN
	
	DELETE FROM UnitariosIncluir WHERE Id=@Id


END


