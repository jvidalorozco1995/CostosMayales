
create PROCEDURE [dbo].[FechasObra] 
	@Proyecto varchar(6)
as
BEGIN
	

    
	SELECT [Codigo],[Proyecto],[Filtro],CONVERT(date,[FechaIniObra]) as FechaIni,CONVERT(date,[FechaFinObra]) as FechaFin,CONVERT(date, GETDATE()) as FechaActual
	,CONVERT(decimal,DATEDIFF(DAY,FechaIniObra,CONVERT(date,GETDATE()))) / CONVERT(decimal,DATEDIFF(DAY,FechaIniObra,FechaFinObra)) as TiempoTranscurrido   FROM Proyectos where Codigo=@Proyecto



END

