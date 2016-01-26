

CREATE PROCEDURE [dbo].[InsertarTodosCapitulos] 
	@Proyecto varchar(6),
	@Capitulo varchar(50)
as
BEGIN
	
INSERT INTO CapitulosExcluir (Capitulo, Presupuesto, NombrePresupuesto, NombreCapitulo)
select distinct(codcapi),SUBSTRING(referencia1,0,7) AS presupuesto,presupuesto,capitulo
from [ArchivoCostos].[dbo].[CostosPptoProg] where SUBSTRING(referencia1,0,7)=@Capitulo
and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)
INSERT INTO REFERENCIAS (Referencia)
select dISTINCT(SUBSTRING(referencia1,0,7)+codcapi)
from [ArchivoCostos].[dbo].[CostosPptoProg] where  referencia1 LIKE @Capitulo+'%'
and IdFecha=(select max(IdFecha) from CostosPptoProg where SUBSTRING(referencia1,0,4)=@Proyecto)

END


