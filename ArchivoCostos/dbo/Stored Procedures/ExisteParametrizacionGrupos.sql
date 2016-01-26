

CREATE PROCEDURE ExisteParametrizacionGrupos
	
	@Proyecto varchar(6),
	@Insutipo varchar(10),
	@Estado varchar(2) output
AS
BEGIN
IF(SELECT 1 from ParametrizacionGrupos where insutipo=@Insutipo AND Proyecto=@Proyecto)>=1
BEGIN
  set @Estado = 1;
END
ELSE
BEGIN
  set @Estado = 0;

  END
END
