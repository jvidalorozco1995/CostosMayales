
CREATE FUNCTION [dbo].[VistaProyecciondeGastosGenerales]

(

@Proyecto VARCHAR(20)

)

RETURNS TABLE

AS

RETURN 

(

select  [vlrejecutado]*1/TiempoTranscurrido as vlrproy,vlrcausado,vlrejecutado,vlrcausado/vlrproy as 'causado',vlrejecutado/vlrproy as 'ejecutado', ([vlrejecutado]*1/TiempoTranscurrido) /(SELECT SUM(Area) AS Expr1
                               FROM            dbo.VistaAreasProyectosAreas AS VistaAreasProyectosAreas_3
                               WHERE        (Proyecto = @Proyecto)) as vlrmt2vivienda,  (SELECT SUM(Area) AS Expr1
                               FROM            dbo.VistaAreasProyectosAreas AS VistaAreasProyectosAreas_3
                               WHERE        (Proyecto = @Proyecto)) AS area,(SELECT SUM(Nviviendas) AS Expr1
                               FROM            dbo.VistaAreasProyectosAreas AS VistaAreasProyectosAreas_3
                               WHERE        (Proyecto = @Proyecto)) AS Nviviendas,
							   ([vlrejecutado]*1/TiempoTranscurrido) / (SELECT SUM(Nviviendas) AS Expr1
                               FROM            dbo.VistaAreasProyectosAreas AS VistaAreasProyectosAreas_3
                               WHERE        (Proyecto = @Proyecto)) AS vlrxvivienda
from [dbo].[VistaConsolidadoCostosIndirectos],[dbo].[FuncionFechasObra](@Proyecto)

) 
