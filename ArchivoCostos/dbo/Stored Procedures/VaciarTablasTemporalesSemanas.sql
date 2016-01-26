/*===================================*/
create proc [dbo].[VaciarTablasTemporalesSemanas]

as begin

truncate table [dbo].[CostosPptoProgSemanaActual]
truncate table [dbo].[CostosPptoProgSemanaLineaBase]
truncate table [dbo].[CostosPptoProgSemanaPasada]


end

