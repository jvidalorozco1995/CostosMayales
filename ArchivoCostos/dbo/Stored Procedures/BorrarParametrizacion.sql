
CREATE PROCEDURE [dbo].[BorrarParametrizacion] 
	
	@Proyecto varchar(6)
AS
BEGIN
	 
	 DELETE ParametrizacionIncluida WHERE Proyecto=@Proyecto
	 DELETE ParametrizacionExcluida WHERE Proyecto=@Proyecto
	 /*truncate table parametrizacion*/
	 /*truncate table areas*/

END

