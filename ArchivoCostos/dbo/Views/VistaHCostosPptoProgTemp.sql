CREATE VIEW [dbo].[VistaHCostosPptoProgTemp]
AS
SELECT        referencia1 AS refe, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, 
                         ctrlinven, validación, precioppto, consumounitario, consumototal, adic, precioaut, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaPromedioValorUnitarioOrdenesTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        PromVrUnit
                               FROM            [dbo].[VistaPromedioValorUnitarioOrdenesTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS precioCompra, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaValorPromedioEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaValorPromedioEntradoCostoEntradoTemp].referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        VlrPromEntrado
                               FROM            [dbo].[VistaValorPromedioEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaValorPromedioEntradoCostoEntradoTemp].referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS precioEntrado, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaPedidoPedidosTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        ped
                               FROM            [dbo].[VistaPedidoPedidosTemp]
                               WHERE        (referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS ped, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaAprobadoPedidosTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        aprob
                               FROM            [dbo].[VistaAprobadoPedidosTemp]
                               WHERE        (referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS aprob, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaCompradoOrdenesTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        comp
                               FROM            [dbo].[VistaCompradoOrdenesTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS comp, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        ent
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        (referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS ent, CASE [dbo].[CostosPptoProgTemp].ctrlinven WHEN 'False' THEN CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        [dbo].[VistaEntradoCostoEntradoTemp].[ent]
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        [dbo].[VistaEntradoCostoEntradoTemp].[referencia1] = [dbo].[CostosPptoProgTemp].[referencia1]) ELSE
                             (SELECT        (0)) END ELSE CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaSalidaSalidasTemp]
                               WHERE        (Referencia = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        [dbo].[VistaSalidaSalidasTemp].[sali]
                               FROM            [dbo].[VistaSalidaSalidasTemp]
                               WHERE        [dbo].[VistaSalidaSalidasTemp].[referencia] = [dbo].[CostosPptoProgTemp].[referencia1]) ELSE
                             (SELECT        (0)) END END AS sali, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaTransladoSalidasTemp]
                               WHERE        (Referencia = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        traslado
                               FROM            [dbo].[VistaTransladoSalidasTemp]
                               WHERE        (referencia = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS traslado, consumototal + adic - CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaCompradoOrdenesTemp] AS comp_2
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        comp
                               FROM            [dbo].[VistaCompradoOrdenesTemp] AS comp_2
                               WHERE        (Referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS xcomp, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaCompradoOrdenesTemp]
                               WHERE        ([dbo].[VistaCompradoOrdenesTemp].Referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        comp
                               FROM            [dbo].[VistaCompradoOrdenesTemp]
                               WHERE        ([dbo].[VistaCompradoOrdenesTemp].Referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END - CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        (referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        ent
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaEntradoCostoEntradoTemp].referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS xent, CASE [dbo].[CostosPptoProgTemp].ctrlinven WHEN 'FALSE' THEN
                             (SELECT        0) ELSE CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        [dbo].[VistaEntradoCostoEntradoTemp].[referencia1] = [dbo].[CostosPptoProgTemp].[referencia1]) THEN
                             (SELECT        [dbo].[VistaEntradoCostoEntradoTemp].[ent]
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        [dbo].[VistaEntradoCostoEntradoTemp].[referencia1] = [dbo].[CostosPptoProgTemp].[referencia1]) ELSE
                             (SELECT        (0)) END - CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaSalidaSalidasTemp]
                               WHERE        [dbo].[VistaSalidaSalidasTemp].[referencia] = [dbo].[CostosPptoProgTemp].[referencia1]) THEN
                             (SELECT        [dbo].[VistaSalidaSalidasTemp].[sali]
                               FROM            [dbo].[VistaSalidaSalidasTemp]
                               WHERE        [dbo].[VistaSalidaSalidasTemp].[referencia] = [dbo].[CostosPptoProgTemp].[referencia1]) ELSE
                             (SELECT        (0)) END - CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaTransladoSalidasTemp]
                               WHERE        (referencia = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        traslado
                               FROM            [dbo].[VistaTransladoSalidasTemp]
                               WHERE        (referencia = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END END AS saldoxunit, CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaEntradoCostoEntradoTemp].[referencia1] = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        ent
                               FROM            [dbo].[VistaEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaEntradoCostoEntradoTemp].[referencia1] = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END * CASE WHEN EXISTS
                             (SELECT        (1)
                               FROM            [dbo].[VistaValorPromedioEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaValorPromedioEntradoCostoEntradoTemp].referencia1 = dbo.CostosPptoProgTemp.referencia1)) THEN
                             (SELECT        [VlrPromEntrado]
                               FROM            [dbo].[VistaValorPromedioEntradoCostoEntradoTemp]
                               WHERE        ([dbo].[VistaValorPromedioEntradoCostoEntradoTemp].referencia1 = dbo.CostosPptoProgTemp.referencia1)) ELSE
                             (SELECT        (0)) END AS vlrent
FROM            dbo.CostosPptoProgTemp


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[53] 2[13] 3) )"
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
         Begin Table = "CostosPptoProgTemp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 34
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1755
         Alias = 3660
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaHCostosPptoProgTemp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VistaHCostosPptoProgTemp';

