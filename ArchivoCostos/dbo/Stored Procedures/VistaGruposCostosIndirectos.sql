

CREATE PROCEDURE [dbo].[VistaGruposCostosIndirectos] 
	

as
BEGIN

	IF(select Distinct(1) from CostosPptoProgSemanaActual where Clasificacion=3)>=1
BEGIN
    SELECT        [Tipo], [vlrproy], [vlrejecutado], [vlrcausado], [causado], [ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [area], [Nviviendas], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaGruposCostosIndirectosViviendas]
	UNION
	SELECT        [Tipo], [VlrProy], [Vlrcausado], [vlrejecutado], [Causado], [Ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [AreaMt2], [Napartamentos], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaConsolidadoCostosIndirectosApartamentos]
END

ELSE 
  BEGIN 
     SELECT        [Tipo], [vlrproy], [vlrejecutado], [vlrcausado], [causado], [ejecutado], [vlrmt2vivienda], [vlrmt2apartamento], [area], [Nviviendas], [vlrxvivienda], [vlrxapartamento]
	FROM            [ArchivoCostos].[dbo].[VistaGruposCostosIndirectosViviendas]
  END

  end



