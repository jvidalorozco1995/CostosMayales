/*===================================*/
CREATE proc [dbo].[CopiarTablaCostosPptoProg]



@IdFecha int

as begin

		 /*SELECT * INTO MyNewTable FROM MyTable*/
		 INSERT INTO CostosPptoProg
		 SELECT *,@IdFecha FROM [dbo].[VistaLaGranVistaVistaHhastaValorEntrado]
		
	
end

