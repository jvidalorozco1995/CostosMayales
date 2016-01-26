
CREATE PROCEDURE [dbo].[EliminarInsumoExcluir] 
	@Presupuesto varchar(50),
	@Capitulo varchar(50),
	@Unitario varchar(50),
	@Insumo varchar(50)

AS
BEGIN
	
	DELETE FROM InsumosExlcuir WHERE Presupuesto=@Presupuesto and Capitulo=@Capitulo and Unitario=@Unitario and @Insumo=@Insumo


END

