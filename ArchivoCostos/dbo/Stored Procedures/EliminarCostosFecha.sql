/*===================================*/
create proc [dbo].[EliminarCostosFecha]
 @IdFecha int
as begin


DELETE FROM Fechas WHERE Id= @IdFecha


 
end

