/*===================================*/
CREATE proc [dbo].[UltimaFechaInsertada]

as begin
declare @Ultimo int

SET @Ultimo=(SELECT top 1 SCOPE_IDENTITY() from Fechas)
return @Ultimo

 
end

