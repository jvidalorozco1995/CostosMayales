/*===================================*/
create proc [dbo].[ActualizarCostosFecha]
 @IdFecha int,
 @Proyecto varchar(10)
as begin

UPDATE Fechas set Tipo='False' where Proyecto=@Proyecto
UPDATE Fechas set Tipo='True' WHERE Id= @IdFecha AND Proyecto=@Proyecto



 
end

