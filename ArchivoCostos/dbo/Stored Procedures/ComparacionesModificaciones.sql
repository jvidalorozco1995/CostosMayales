/*===================================*/
CREATE proc [dbo].[ComparacionesModificaciones]


@Fecha1 varchar(20),
@Fecha2 varchar(20)

as begin


SELECT 'SemanaActual' AS origen,(SELECT FECHA FROM fechas WHERE ID=@Fecha1),* FROM

(SELECT 
[referencia1]
      ,[referencia2]
      ,[referencia3]
      ,[presupuesto]
      ,[codcapi]
      ,[capitulo]
      ,[codunit]
      ,[unitario]
      ,[undunita]
      ,[cantxppto]
      ,[codinsu]
      ,[insutipo]
      ,[insumo]
      ,[unidinsu]
      ,[ctrlinven]
      ,[validación]
      ,[precioppto]
      ,[consumounitario]
      ,[consumototal]
      ,[adic]
      ,[precioaut]
      ,[PrecioCompra]
      ,[PrecioEntrado]
      ,[Ped]
      ,[aprob]
      ,[comp]
      ,[ent]
      ,[sali]
      ,[traslado]
      ,[xcomp]
      ,[xent]
      ,[saldoxunit]
      ,[SaldoXppto]
      ,[vlrEnt]
      ,[vlrEnttraslado]
      ,[VlrCompradoxent]
      ,[vlrxcomp]
      ,[VlrTraslado]
      ,[vlrproy]
      ,[Vlrini]
      ,[vlrejec]
	  

       FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1  AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
	  ) 
EXCEPT
SELECT referencia1
      ,[referencia2]
      ,[referencia3]
      ,[presupuesto]
      ,[codcapi]
      ,[capitulo]
      ,[codunit]
      ,[unitario]
      ,[undunita]
      ,[cantxppto]
      ,[codinsu]
      ,[insutipo]
      ,[insumo]
      ,[unidinsu]
      ,[ctrlinven]
      ,[validación]
      ,[precioppto]
      ,[consumounitario]
      ,[consumototal]
      ,[adic]
      ,[precioaut]
      ,[PrecioCompra]
      ,[PrecioEntrado]
      ,[Ped]
      ,[aprob]
      ,[comp]
      ,[ent]
      ,[sali]
      ,[traslado]
      ,[xcomp]
      ,[xent]
      ,[saldoxunit]
      ,[SaldoXppto]
      ,[vlrEnt]
      ,[vlrEnttraslado]
      ,[VlrCompradoxent]
      ,[vlrxcomp]
      ,[VlrTraslado]
      ,[vlrproy]
      ,[Vlrini]
      ,[vlrejec]
	   FROM  [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2  AND referencia1 in(
	  
	  
	  SELECT 
referencia1
     

       FROM [dbo].[VistaCostosPptoProg] where idfecha=@Fecha1
INTERSECT
SELECT referencia1
       FROM  [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
	  
	    ))AS LINEASAGREGADAS

UNION
SELECT 'SemanaPasada' AS origen,(SELECT FECHA FROM Fechas WHERE ID=@Fecha2),* FROM


(SELECT referencia1
      ,[referencia2]
      ,[referencia3]
      ,[presupuesto]
      ,[codcapi]
      ,[capitulo]
      ,[codunit]
      ,[unitario]
      ,[undunita]
      ,[cantxppto]
      ,[codinsu]
      ,[insutipo]
      ,[insumo]
      ,[unidinsu]
      ,[ctrlinven]
      ,[validación]
      ,[precioppto]
      ,[consumounitario]
      ,[consumototal]
      ,[adic]
      ,[precioaut]
      ,[PrecioCompra]
      ,[PrecioEntrado]
      ,[Ped]
      ,[aprob]
      ,[comp]
      ,[ent]
      ,[sali]
      ,[traslado]
      ,[xcomp]
      ,[xent]
      ,[saldoxunit]
      ,[SaldoXppto]
      ,[vlrEnt]
      ,[vlrEnttraslado]
      ,[VlrCompradoxent]
      ,[vlrxcomp]
      ,[VlrTraslado]
      ,[vlrproy]
      ,[Vlrini] 
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2  AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
	  )
EXCEPT
SELECT 
referencia1
      ,[referencia2]
      ,[referencia3]
      ,[presupuesto]
      ,[codcapi]
      ,[capitulo]
      ,[codunit]
      ,[unitario]
      ,[undunita]
      ,[cantxppto]
      ,[codinsu]
      ,[insutipo]
      ,[insumo]
      ,[unidinsu]
      ,[ctrlinven]
      ,[validación]
      ,[precioppto]
      ,[consumounitario]
      ,[consumototal]
      ,[adic]
      ,[precioaut]
      ,[PrecioCompra]
      ,[PrecioEntrado]
      ,[Ped]
      ,[aprob]
      ,[comp]
      ,[ent]
      ,[sali]
      ,[traslado]
      ,[xcomp]
      ,[xent]
      ,[saldoxunit]
      ,[SaldoXppto]
      ,[vlrEnt]
      ,[vlrEnttraslado]
      ,[VlrCompradoxent]
      ,[vlrxcomp]
      ,[VlrTraslado]
      ,[vlrproy]
      ,[Vlrini]
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProg] where idfecha=@Fecha1 AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
	  ) ) AS LINEASRETIRADAS
	  end
