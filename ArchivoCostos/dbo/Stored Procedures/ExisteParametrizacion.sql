
CREATE PROCEDURE [dbo].[ExisteParametrizacion] 
	
	@Referencia varchar(150),
	@existe int output,
	@clasificacion varchar(50) output
as
BEGIN

	IF(SELECT 1 FROM Referencias WHERE Referencia=@Referencia)>=1

	 begin
	 
	     set @existe =1
		 set @clasificacion =  (SELECT clasificacion FROM ParametrizacionIncluida WHERE CodigoObraInmueble=SUBSTRING(@Referencia,0,7))
     end
		ELSE
		    BEGIN
		set @existe=0
		set @clasificacion =  (SELECT clasificacion FROM ParametrizacionIncluida WHERE CodigoObraInmueble=SUBSTRING(@Referencia,0,7))
			END
		 return @existe 
		 return @clasificacion
	    END




