
create function [dbo].[FuncionFechasObra]
 (@Proyecto varchar(6))
 returns @FechasObras table-- nombre de la tabla
 --formato de la tabla
 (Codigo varchar(4),
  Proyecto varchar(250),
  Filtro varchar(100),
  FechaIni datetime,
  FechaFin datetime,
  FechaActual datetime
  ,TiempoTranscurrido decimal(20,2)
  
 )
 as
 begin
   insert @FechasObras
SELECT [Codigo],[Proyecto],[Filtro],CONVERT(date,[FechaIniObra]) as FechaIni,CONVERT(date,[FechaFinObra]) as FechaFin,CONVERT(date, GETDATE()) as FechaActual
	,CONVERT(decimal,DATEDIFF(DAY,FechaIniObra,CONVERT(date,GETDATE()))) / CONVERT(decimal,DATEDIFF(DAY,FechaIniObra,FechaFinObra)) as TiempoTranscurrido   FROM Proyectos where Codigo=@Proyecto



   return
 end;

 
	


