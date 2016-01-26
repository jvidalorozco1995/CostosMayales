
CREATE PROCEDURE [dbo].[InsertarTodosLosUnitarios] 
	
	@Proyecto varchar(6),
	@Presupuesto varchar(50)
AS
BEGIN
INSERT INTO UnitariosExluir(Unitario,NombreUnitario,Presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo) 
select distinct(codunit),unitario,SUBSTRING(referencia1,0,7) as refe,presupuesto,codcapi,capitulo   from [ArchivoCostos].[dbo].[CostosPptoProg] 
where SUBSTRING(referencia1,0,7)=@Presupuesto and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)

INSERT INTO REFERENCIAS(referencia)
select DISTINCT(SUBSTRING(referencia1,0,7)+codcapi+codunit)   from [ArchivoCostos].[dbo].[CostosPptoProg] 
where  referencia1 LIKE @Presupuesto+'%' and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)
END

