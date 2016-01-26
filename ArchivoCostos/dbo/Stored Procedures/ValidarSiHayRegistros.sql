
CREATE PROCEDURE [dbo].[ValidarSiHayRegistros] 
	
AS
BEGIN
	
	 declare @Ultimo int

IF(SELECT TOP 1 Id FROM OrdenesTemp)>=1

set @Ultimo=1;

else 

set @Ultimo=0;


return @Ultimo

END

