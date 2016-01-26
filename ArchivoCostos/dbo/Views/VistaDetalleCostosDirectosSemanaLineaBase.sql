CREATE VIEW dbo.VistaDetalleCostosDirectosSemanaLineaBase
AS
SELECT        SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7) AS refe, dbo.ParametrizacionIncluida.NombreObra, SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS vlrproy, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrent + dbo.VistaCostosPptoProgSemanaLineaBase.vlrcompradoxent) AS vlrcausado, SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrejec) AS vlrejecutado, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrent + dbo.VistaCostosPptoProgSemanaLineaBase.vlrcompradoxent) / SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS Causado, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrejec) / SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS Ejecutado, 
						 
						  CASE (dbo.VistaAreasProyectosAreas.Area) WHEN 0 THEN
                             (SELECT        (0)) ELSE
						 SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) 
                         / dbo.VistaAreasProyectosAreas.Area END AS vlrmt2vivienda, NULL AS vlrm2apartamento, dbo.VistaAreasProyectosAreas.Area, dbo.VistaAreasProyectosAreas.Nviviendas, 
                        CASE (dbo.VistaAreasProyectosAreas.Nviviendas) WHEN 0 THEN
                             (SELECT        (0)) ELSE SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) / dbo.VistaAreasProyectosAreas.Nviviendas end AS vlrxvivienda, NULL AS vlrapartamento, dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion
FROM            dbo.VistaCostosPptoProgSemanaLineaBase INNER JOIN
                         dbo.ParametrizacionIncluida ON SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7) = dbo.ParametrizacionIncluida.CodigoObraInmueble LEFT OUTER JOIN
                         dbo.VistaAreasProyectosAreas ON dbo.ParametrizacionIncluida.CodigoObraInmueble = dbo.VistaAreasProyectosAreas.CodigoObraInmueble INNER JOIN
                         dbo.Tipos ON dbo.Tipos.Id = dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion
WHERE        (dbo.Tipos.Tipo <> 'Gastos' AND Tipos.Tipo <> 'Torres')
GROUP BY SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7), dbo.ParametrizacionIncluida.NombreObra, dbo.VistaAreasProyectosAreas.Area, dbo.VistaAreasProyectosAreas.Nviviendas, 
                         dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion
UNION
SELECT        SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7) AS refe, dbo.ParametrizacionIncluida.NombreObra, SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS vlrproy, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrent + dbo.VistaCostosPptoProgSemanaLineaBase.vlrcompradoxent) AS vlrcausado, SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrejec) AS vlrejecutado, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrent + dbo.VistaCostosPptoProgSemanaLineaBase.vlrcompradoxent) / SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS Causado, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrejec) / SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) AS Ejecutado, 0 AS vlrmt2vivienda, 
                         SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) / dbo.VistaAreasProyectosAreas.Area AS vlrm2apartamento, dbo.VistaAreasProyectosAreas.Area, dbo.VistaAreasProyectosAreas.Nviviendas, NULL 
                         AS vlrxvivienda, SUM(dbo.VistaCostosPptoProgSemanaLineaBase.vlrproy) / dbo.VistaAreasProyectosAreas.Nviviendas AS vlrapartamento, dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion
FROM            dbo.VistaCostosPptoProgSemanaLineaBase INNER JOIN
                         dbo.ParametrizacionIncluida ON SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7) = dbo.ParametrizacionIncluida.CodigoObraInmueble LEFT OUTER JOIN
                         dbo.VistaAreasProyectosAreas ON dbo.ParametrizacionIncluida.CodigoObraInmueble = dbo.VistaAreasProyectosAreas.CodigoObraInmueble INNER JOIN
                         dbo.Tipos ON dbo.Tipos.Id = dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion
WHERE        (dbo.Tipos.Tipo <> 'Gastos' AND Tipos.Tipo = 'Torres')
GROUP BY SUBSTRING(dbo.VistaCostosPptoProgSemanaLineaBase.referencia1, 0, 7), dbo.ParametrizacionIncluida.NombreObra, dbo.VistaAreasProyectosAreas.Area, dbo.VistaAreasProyectosAreas.Nviviendas, 
                         dbo.VistaCostosPptoProgSemanaLineaBase.Clasificacion

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -672
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaDetalleCostosDirectosSemanaLineaBase';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaDetalleCostosDirectosSemanaLineaBase';

