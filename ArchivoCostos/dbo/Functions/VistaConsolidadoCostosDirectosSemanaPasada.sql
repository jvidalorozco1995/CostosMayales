
create FUNCTION [dbo].[VistaConsolidadoCostosDirectosSemanaPasada]

(



)

RETURNS TABLE

AS

RETURN 

(

WITH CTE
AS
(
SELECT        SUM(vlrproy) AS vlrproy , SUM(vlrcausado) AS vlrcausado, SUM(vlrejecutado) AS vlrejecutado, SUM(vlrcausado) / SUM(vlrproy) AS causado, SUM(vlrejecutado) / SUM(vlrproy) AS Ejecutado, SUM(vlrproy) 
                         / Area AS vlrmt2vivienda,(SELECT 0) as vlrmt2apartamento, Area, Nvivienda, SUM(vlrproy) / Nvivienda AS vlrxvivienda,(SELECT 0) AS vlrxapartamento
FROM            dbo.VistaGruposCostosDirectosSemanaPasada where clasificacion<>'Torres'
GROUP BY Area, Nvivienda
UNION
SELECT        SUM(vlrproy) AS vlrproy, SUM(vlrcausado) AS vlrcausado, SUM(vlrejecutado) AS vlrejecutado, 
              SUM(vlrcausado) / SUM(vlrproy) AS causado, SUM(vlrejecutado) / SUM(vlrproy) AS Ejecutado,(SELECT 0) as vlrmt2vivienda, SUM(vlrproy) 
                         / Area AS vlrmt2apartamento, Area, Nvivienda,(SELECT 0), SUM(vlrproy) / Nvivienda AS vlrxapartamento
FROM            dbo.VistaGruposCostosDirectosSemanaPasada where clasificacion='Torres'
GROUP BY Area, Nvivienda)
          
	

SELECT SUM(vlrproy) as vlrproy,sum(vlrcausado) as vlrcausado,sum(vlrejecutado) as vlrejecutado,sum(vlrcausado)/SUM(vlrproy) as Causado,sum(vlrejecutado)/SUM(vlrproy) as Ejecutado,Sum(vlrmt2vivienda) as vlrmt2vivienda,sum(vlrmt2apartamento) as vlrmt2apartamento,sum(Area) as Area,sum(Nvivienda) as Nvivienda,sum(vlrxvivienda) as vlrxvivienda,sum(vlrxapartamento) as vlrxapartamento from CTE

  
   
) 
