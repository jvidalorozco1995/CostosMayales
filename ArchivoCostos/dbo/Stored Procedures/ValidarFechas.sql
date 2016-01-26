
create PROCEDURE [dbo].[ValidarFechas] 
	@Proyecto varchar(6)
as
BEGIN
	
	 select MONTH(fecha) as NumeroMes,Mes 

from Fechas
INNER JOIN MESES ON MONTH(fecha)=Meses.Id
 where proyecto=@Proyecto and Fechas.Tipo='True'

END

