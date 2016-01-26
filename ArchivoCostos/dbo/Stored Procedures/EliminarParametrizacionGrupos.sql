
create PROCEDURE EliminarParametrizacionGrupos
	
	@Proyecto varchar(6),
	@Insutipo varchar(10)


AS
BEGIN

  DELETE ParametrizacionGrupos WHERE  PROYECTO=@Proyecto AND INSUTIPO=@Insutipo

END
