

create PROCEDURE [dbo].[BorraParametrosCapInsUni] 
	@Presupuesto varchar(6)
as
BEGIN
	
	
DELETE FROM CapitulosIncluir WHERE Presupuesto=@Presupuesto
DELETE FROM CapitulosExcluir WHERE Presupuesto=@Presupuesto
DELETE FROM InsumosIncluir WHERE Presupuesto=@Presupuesto
DELETE FROM InsumosExlcuir WHERE Presupuesto=@Presupuesto
DELETE FROM UnitariosIncluir WHERE Presupuesto=@Presupuesto
DELETE FROM UnitariosExluir WHERE Presupuesto=@Presupuesto





END


