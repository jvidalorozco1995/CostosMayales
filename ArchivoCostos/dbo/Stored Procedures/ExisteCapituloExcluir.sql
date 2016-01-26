
CREATE PROCEDURE [dbo].[ExisteCapituloExcluir] 
	
	@Presupuesto varchar(20),
	@Capitulo varchar(20),
	@existe int output
as
BEGIN

	IF(SELECT 1 FROM [dbo].[CapitulosExcluir] WHERE Presupuesto=@Presupuesto and  Capitulo=@Capitulo)>=1

	 begin
	 
	     set @existe =1
     end
		ELSE
		    BEGIN
		set @existe=0
			END
		 return @existe
	    END




