
CREATE PROCEDURE [dbo].[ActualizarClasificacion] 
	@Clasificacion int,
	@NombreObra varchar(250),
	@Estado int
as
BEGIN
	



 
 update Parametrizacion set Clasificacion=@Clasificacion,Estado=@Estado
  where NombreObra=@NombreObra;


END

