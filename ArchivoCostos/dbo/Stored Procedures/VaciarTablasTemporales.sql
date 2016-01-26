/*===================================*/
CREATE proc [dbo].[VaciarTablasTemporales]

as begin

truncate table CostoEntradoTemp
truncate table CostosPptoProgTemp
truncate table OrdenesTemp
truncate table PedidosTemp
truncate table SalidasTemp
truncate table estados

 
end

