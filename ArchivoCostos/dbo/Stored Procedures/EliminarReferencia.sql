/*===================================*/
CREATE proc [dbo].[EliminarReferencia]
@Proyecto varchar(6)

as begin
DECLARE @Referencia varchar(50)
DECLARE eliminar CURSOR FOR 
select referencia from Referencias where SUBSTRING(referencia,0,4)=@Proyecto

OPEN eliminar 



FETCH NEXT FROM eliminar

INTO @referencia

WHILE @@FETCH_STATUS = 0 
BEGIN
delete  from CostosPptoProgSemanaActual where referencia1 like @referencia+'%' and SUBSTRING(referencia1,0,4)=@Proyecto /*or insutipo not in (select insutipo from ParametrizacionGrupos where Proyecto=@Proyecto)*/
delete  from CostosPptoProgSemanaPasada where referencia1 like @referencia+'%' and SUBSTRING(referencia1,0,4)=@Proyecto /*or insutipo not in (select insutipo from ParametrizacionGrupos where Proyecto=@Proyecto)*/
delete  from CostosPptoProgSemanaLineaBase where referencia1 like @referencia+'%' and SUBSTRING(referencia1,0,4)=@Proyecto /*or insutipo not in (select insutipo from ParametrizacionGrupos where Proyecto=@Proyecto)*/

PRINT 'Referencia: ' + @referencia
FETCH NEXT FROM eliminar
INTO @referencia
END 
CLOSE eliminar 
DEALLOCATE eliminar

             
	
 
end

