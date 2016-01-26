
CREATE PROCEDURE [dbo].[InsertarCapitulosExcluir] 
	@Presupuesto varchar(50),
	@NombrePresupuesto varchar(200),
	@Capitulo	varchar(50),
	@NombreCapitulo varchar(200)
AS
BEGIN
	
	insert into CapitulosExcluir(presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo) values (@Presupuesto,@NombrePresupuesto,@Capitulo,@NombreCapitulo)


END

