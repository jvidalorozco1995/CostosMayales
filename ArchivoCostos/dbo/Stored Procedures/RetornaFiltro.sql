/*===================================*/
create proc [dbo].[RetornaFiltro]

 @Codigo varchar(4)
as begin

select Filtro,Proyecto from Proyectos where [Codigo]=@Codigo
 
end

