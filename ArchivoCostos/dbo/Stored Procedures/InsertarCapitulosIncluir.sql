
create PROCEDURE [dbo].[InsertarCapitulosIncluir] 
	@Presupuesto varchar(50),
	@NombrePresupuesto varchar(200),
	@Capitulo	varchar(50),
	@NombreCapitulo varchar(200)
AS
BEGIN
	
	insert into CapitulosIncluir(presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo) values (@Presupuesto,@NombrePresupuesto,@Capitulo,@NombreCapitulo)


END

