
create PROCEDURE [dbo].[BorrarParametrizacionCapitulos] 
	
	@Proyecto varchar(6)
AS
BEGIN
	 

	 DELETE CapitulosExcluir WHERE SUBSTRING(Presupuesto,0,3)=@Proyecto
	 /*truncate table parametrizacion*/
	 /*truncate table areas*/

END

