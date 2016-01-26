
create function [dbo].[VistaGruposCostosIndirectosActivoSemanaPasada]
 ()
 returns @GruposCostosIndirectos table-- nombre de la tabla
 --formato de la tabla
 (
 [Tipo] varchar(250),
  vlrproy decimal(36,2),
  vlrejecutado decimal(36,2),
  vlrcausado decimal(36,2),
  causado decimal(36,2),
  ejecutado decimal(36,2),
  vlrmt2vivvienda decimal(36,2),
  vlrmt2apartamento decimal(36,2),
  area decimal(36,2),
  NViviendas int,
  vlrxvivienda decimal(36,2),
  vlrxapartamento decimal(36,2)
 )
 as
 begin
 IF(select Distinct(1) from CostosPptoProgSemanaActual where Clasificacion=3)>=1
BEGIN
insert into @GruposCostosIndirectos
    SELECT        [Tipo], [vlrproy], [vlrejecutado], [vlrcausado], [causado], [ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [area], [Nviviendas], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaGruposCostosIndirectosViviendasSemanaPasada]
	UNION
	SELECT        [Tipo], [VlrProy], [Vlrcausado], [vlrejecutado], [Causado], [Ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [AreaMt2], [Napartamentos], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaConsolidadoCostosIndirectosApartamentosSemanaPasada]
END

ELSE 
  BEGIN 
    insert into @GruposCostosIndirectos
     SELECT        [Tipo], [vlrproy], [vlrejecutado], [vlrcausado], [causado], [ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [area], [Nviviendas], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaGruposCostosIndirectosViviendasSemanaPasada]
  END;



   return
 end

 
	


