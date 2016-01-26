
create PROCEDURE [dbo].[InsertarInsumosExcluir] 
	@Presupuesto varchar(50),
	@NombrePresupuesto varchar(200),
	@Capitulo	varchar(50),
	@NombreCapitulo varchar(200),
	@Unitario varchar(50),
	@NombreUnitario varchar(200),
	@Insumo varchar(50),
	@NombreInsumo varchar(200)
AS
BEGIN
	
	insert into InsumosExlcuir(presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo,Unitario,NombreUnitario,Insumo,NombreInsumo) values (@Presupuesto,@NombrePresupuesto,@Capitulo,@NombreCapitulo,@Unitario,@NombreUnitario,@Insumo,@NombreInsumo)


END

