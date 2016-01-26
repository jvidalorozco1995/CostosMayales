

CREATE PROCEDURE [dbo].[InsertarTodosInsumos] 
    @Proyecto varchar(6),
	@Presupuesto varchar(50)
	
AS
BEGIN
insert into InsumosExlcuir (Insumo,NombreInsumo,Presupuesto,NombrePresupuesto,Capitulo,NombreCapitulo,Unitario,NombreUnitario)
select distinct(codinsu),insumo,SUBSTRING(referencia1,0,7) as refe,presupuesto,codcapi,capitulo,codunit,unitario   from [ArchivoCostos].[dbo].[CostosPptoProg] 
where SUBSTRING(referencia1,0,7)=@Presupuesto and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)
insert into referencias(referencia)
select SUBSTRING(referencia1,0,7)+codcapi+codunit+codinsu  from [ArchivoCostos].[dbo].[CostosPptoProg] 
where  referencia1 LIKE @Presupuesto+'%' and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)

END


