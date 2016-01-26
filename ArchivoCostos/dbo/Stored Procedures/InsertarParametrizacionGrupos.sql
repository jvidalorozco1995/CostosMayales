
CREATE PROCEDURE InsertarParametrizacionGrupos
	
	@Proyecto varchar(6),
	@Insutipo varchar(10)


AS
BEGIN

  INSERT INTO ParametrizacionGrupos (Proyecto,Insutipo)  values(@Proyecto,@Insutipo)

END
