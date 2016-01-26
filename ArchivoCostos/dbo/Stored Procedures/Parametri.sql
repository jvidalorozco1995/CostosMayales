-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Parametri 
	@Proyecto varchar(6)
AS
BEGIN
SELECT  SUBSTRING(referencia1,0,4) as Proyecto,presupuesto,SUBSTRING(referencia1,0,7) as referencia,

CASE  
  
  WHEN Area IS NULL
    THEN 
	   (SELECT 0)
    ELSE
	   (SELECT Area from [ArchivoCostos].[dbo].[VistaAreasProyectosAreas] where [CodigoObraInmueble] =SUBSTRING(referencia1,0,7))
	   END AS 
Area,CASE   WHEN Nviviendas IS NULL
    THEN 
	   (SELECT 0)
    ELSE
	   (SELECT Nviviendas from [ArchivoCostos].[dbo].[VistaAreasProyectosAreas] where [CodigoObraInmueble] =SUBSTRING(referencia1,0,7))
	   END AS 
Nviviendas,SUM(vlrproy) as vlrproy
      
  FROM [ArchivoCostos].[dbo].[CostosPptoProg] 
  
   left join [ArchivoCostos].[dbo].[VistaAreasProyectosAreas]on SUBSTRING(referencia1,0,7)=CodigoObraInmueble
   where  SUBSTRING(referencia1,0,4)=@Proyecto and IdFecha=(select max(IdFecha) from [ArchivoCostos].[dbo].[CostosPptoProg]  where SUBSTRING(referencia1,0,4)=@Proyecto)
  group by presupuesto,SUBSTRING(referencia1,0,7),Area,Nviviendas,SUBSTRING(referencia1,0,4) order by presupuesto
END
