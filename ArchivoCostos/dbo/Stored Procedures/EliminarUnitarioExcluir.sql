
CREATE PROCEDURE [dbo].[EliminarUnitarioExcluir] 
	@Presupuesto varchar(150),
	@Capitulo varchar(60),
	@Unitario varchar(60)

AS
BEGIN
	
	DELETE FROM UnitariosExluir WHERE Presupuesto=@Presupuesto and Capitulo=@Capitulo and Unitario=@Unitario


END

