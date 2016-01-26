CREATE VIEW dbo.VistaConsolidadoCostosIndirectosApartamentosSemanaLineaBase
AS
SELECT        'Gastos Generales Apartamentos' AS Tipo,
                             (SELECT        vlrproy AS Expr1
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_17) AS VlrProy,
                             (SELECT        vlrcausado
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_8) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_16
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_15) AS Vlrcausado,
                             (SELECT        vlrejecutado
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_7) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_14
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_13) AS vlrejecutado,
                             (SELECT        vlrcausado
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_6) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_12
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_11) /
                             (SELECT        vlrproy
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_5) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_10
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_9) AS Causado,
                             (SELECT        vlrejecutado
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_4) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_8
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_7) /
                             (SELECT        vlrproy
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_3) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_6
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_5) AS Ejecutado,
                             (SELECT        0 AS Expr1) AS vlrmt2vivienda,
                             (SELECT        vlrproy AS Expr1
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_2) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_19
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_17) /
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_4
                               WHERE        (Clasificacion = 3)) AS vlrmt2apartamento,
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_2
                               WHERE        (Clasificacion = 3)) AS AreaMt2,
                             (SELECT        ISNULL(NULLIF (SUM(Nviviendas), 0), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_3
                               WHERE        (Clasificacion = 3)) AS Napartamentos,
                             (SELECT        0 AS Expr1) AS vlrxvivienda,
                             (SELECT        vlrproy AS Expr1
                               FROM            dbo.VistaConsolidadoCostosIndirectosSemanaLineaBase AS VistaConsolidadoCostosIndirectosSemanaLineaBase_1) *
                             (SELECT        ISNULL(SUM(Area), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_18
                               WHERE        (Clasificacion = 3)) /
                             (SELECT        NULLIF (SUM(Area), 0) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_17) /
                             (SELECT        ISNULL(NULLIF (SUM(Nviviendas), 0), 1) AS Expr1
                               FROM            dbo.VistaDetalleCostosDirectosSemanaLineaBase AS VistaDetalleCostosDirectosSemanaLineaBase_1
                               WHERE        (Clasificacion = 3)) AS vlrxapartamento

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
         Top = 0
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaConsolidadoCostosIndirectosApartamentosSemanaLineaBase';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaConsolidadoCostosIndirectosApartamentosSemanaLineaBase';

