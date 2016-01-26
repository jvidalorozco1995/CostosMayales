

create PROCEDURE [dbo].[InsertarUnitarioIncluir] 
	@Presupuesto varchar(50),
	@NombrePresupuesto varchar(200),
	@Capitulo	varchar(50),
	@NombreCapitulo varchar(200),
	@Unitario	varchar(50),
	@NombreUnitario varchar(200)
AS
BEGIN
	
	insert into UnitariosIncluir(presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo,Unitario,NombreUnitario) values (@Presupuesto,@NombrePresupuesto,@Capitulo,@NombreCapitulo,@Unitario,@NombreUnitario)


END


