
/*===================================*/
create proc [dbo].[ComparacionesModificacionesGRUPOSLINEABASE]


@Fecha1 varchar(20),
@Fecha2 varchar(20),
@Opcion int,
@Grupo varchar(50)

as begin


IF(@Opcion=1)
 BEGIN

SELECT 'SemanaActual' AS origen,(SELECT FECHA FROM Fechas WHERE ID=@Fecha1),* FROM

(SELECT 
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
      ,[vlrejec]
	  

       FROM [dbo].[VistaCostosPptoProgSemanaActual]  where insutipo=@Grupo   AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]  where   insutipo=@Grupo
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaActual]  where  insutipo=@Grupo
	   
	  
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
	   FROM  [dbo].[VistaCostosPptoProgSemanaLineaBase]  where  insutipo=@Grupo AND referencia1 in(
	  
	  
	  SELECT 
referencia1
     

       FROM [dbo].[VistaCostosPptoProgSemanaActual] where  insutipo=@Grupo
INTERSECT
SELECT referencia1
       FROM  [dbo].[VistaCostosPptoProgSemanaLineaBase]  where   insutipo=@Grupo
	  
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
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]  where insutipo=@Grupo AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaActual]  where insutipo=@Grupo
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]  where  insutipo=@Grupo
	   
	  
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
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProgSemanaActual] where  insutipo=@Grupo AND referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]  where  insutipo=@Grupo
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaActual]  where  insutipo=@Grupo
	   
	  
	  ) ) AS LINEASRETIRADAS


	  END
	   
	   ELSE
	      BEGIN

--		           SELECT 'SemanaActual' AS origen,(SELECT FECHA FROM Fechas WHERE ID=@Fecha1),* FROM

--(SELECT 
--referencia1
--      ,[referencia2]
--      ,[referencia3]
--      ,[presupuesto]
--      ,[codcapi]
--      ,[capitulo]
--      ,[codunit]
--      ,[unitario]
--      ,[undunita]
--      ,[cantxppto]
--      ,[codinsu]
--      ,[insutipo]
--      ,[insumo]
--      ,[unidinsu]
--      ,[ctrlinven]
--      ,[validación]
--      ,[precioppto]
--      ,[consumounitario]
--      ,[consumototal]
--      ,[adic]
--      ,[precioaut]
--      ,[PrecioCompra]
--      ,[PrecioEntrado]
--      ,[Ped]
--      ,[aprob]
--      ,[comp]
--      ,[ent]
--      ,[sali]
--      ,[traslado]
--      ,[xcomp]
--      ,[xent]
--      ,[saldoxunit]
--      ,[SaldoXppto]
--      ,[vlrEnt]
--      ,[vlrEnttraslado]
--      ,[VlrCompradoxent]
--      ,[vlrxcomp]
--      ,[VlrTraslado]
--      ,[vlrproy]
--      ,[Vlrini]
--      ,[vlrejec]
	  

--       FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1  AND referencia1 in(
	  
--	  SELECT referencia1
--     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
--INTERSECT
--SELECT 
--referencia1
     
--      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
--	  ) 
--EXCEPT
--SELECT referencia1
--      ,[referencia2]
--      ,[referencia3]
--      ,[presupuesto]
--      ,[codcapi]
--      ,[capitulo]
--      ,[codunit]
--      ,[unitario]
--      ,[undunita]
--      ,[cantxppto]
--      ,[codinsu]
--      ,[insutipo]
--      ,[insumo]
--      ,[unidinsu]
--      ,[ctrlinven]
--      ,[validación]
--      ,[precioppto]
--      ,[consumounitario]
--      ,[consumototal]
--      ,[adic]
--      ,[precioaut]
--      ,[PrecioCompra]
--      ,[PrecioEntrado]
--      ,[Ped]
--      ,[aprob]
--      ,[comp]
--      ,[ent]
--      ,[sali]
--      ,[traslado]
--      ,[xcomp]
--      ,[xent]
--      ,[saldoxunit]
--      ,[SaldoXppto]
--      ,[vlrEnt]
--      ,[vlrEnttraslado]
--      ,[VlrCompradoxent]
--      ,[vlrxcomp]
--      ,[VlrTraslado]
--      ,[vlrproy]
--      ,[Vlrini]
--      ,[vlrejec]
--	   FROM  [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2  AND referencia1 in(
	  
	  
--	  SELECT 
--referencia1
     

--       FROM [dbo].[VistaCostosPptoProg] where idfecha=@Fecha1
--INTERSECT
--SELECT referencia1
--       FROM  [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
	  
--	    ))AS LINEASAGREGADAS

--UNION
--SELECT 'SemanaPasada' AS origen,(SELECT FECHA FROM Fechas WHERE ID=@Fecha2),* FROM


--(SELECT referencia1
--      ,[referencia2]
--      ,[referencia3]
--      ,[presupuesto]
--      ,[codcapi]
--      ,[capitulo]
--      ,[codunit]
--      ,[unitario]
--      ,[undunita]
--      ,[cantxppto]
--      ,[codinsu]
--      ,[insutipo]
--      ,[insumo]
--      ,[unidinsu]
--      ,[ctrlinven]
--      ,[validación]
--      ,[precioppto]
--      ,[consumounitario]
--      ,[consumototal]
--      ,[adic]
--      ,[precioaut]
--      ,[PrecioCompra]
--      ,[PrecioEntrado]
--      ,[Ped]
--      ,[aprob]
--      ,[comp]
--      ,[ent]
--      ,[sali]
--      ,[traslado]
--      ,[xcomp]
--      ,[xent]
--      ,[saldoxunit]
--      ,[SaldoXppto]
--      ,[vlrEnt]
--      ,[vlrEnttraslado]
--      ,[VlrCompradoxent]
--      ,[vlrxcomp]
--      ,[VlrTraslado]
--      ,[vlrproy]
--      ,[Vlrini] 
--      ,[vlrejec] FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2  AND referencia1 in(
	  
--	  SELECT referencia1
--     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
--INTERSECT
--SELECT 
--referencia1
     
--      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
--	  )
--EXCEPT
--SELECT 
--referencia1
--      ,[referencia2]
--      ,[referencia3]
--      ,[presupuesto]
--      ,[codcapi]
--      ,[capitulo]
--      ,[codunit]
--      ,[unitario]
--      ,[undunita]
--      ,[cantxppto]
--      ,[codinsu]
--      ,[insutipo]
--      ,[insumo]
--      ,[unidinsu]
--      ,[ctrlinven]
--      ,[validación]
--      ,[precioppto]
--      ,[consumounitario]
--      ,[consumototal]
--      ,[adic]
--      ,[precioaut]
--      ,[PrecioCompra]
--      ,[PrecioEntrado]
--      ,[Ped]
--      ,[aprob]
--      ,[comp]
--      ,[ent]
--      ,[sali]
--      ,[traslado]
--      ,[xcomp]
--      ,[xent]
--      ,[saldoxunit]
--      ,[SaldoXppto]
--      ,[vlrEnt]
--      ,[vlrEnttraslado]
--      ,[VlrCompradoxent]
--      ,[vlrxcomp]
--      ,[VlrTraslado]
--      ,[vlrproy]
--      ,[Vlrini]
--      ,[vlrejec] FROM [dbo].[VistaCostosPptoProg] where idfecha=@Fecha1 AND referencia1 in(
	  
--	  SELECT referencia1
--     FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha2
--INTERSECT
--SELECT 
--referencia1
     
--      FROM [dbo].[VistaCostosPptoProg]  where idfecha=@Fecha1
	   
	  
--	  ) ) AS LINEASRETIRADAS
--	  END

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
	  

       FROM [dbo].[VistaCostosPptoProgSemanaActual]  where referencia1  in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaLineaBase] 
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaActual]  
	   
	  
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
	   FROM  [dbo].[VistaCostosPptoProgSemanaLineaBase]  where referencia1   in(
	  
	  
	  SELECT 
referencia1
     

       FROM [dbo].[VistaCostosPptoProgSemanaActual]
INTERSECT
SELECT referencia1
       FROM  [dbo].[VistaCostosPptoProgSemanaLineaBase] 
	  
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
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]  where referencia1  in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaActual]  
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaLineaBase] 
	   
	  
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
      ,[vlrejec] FROM [dbo].[VistaCostosPptoProgSemanaActual] where  referencia1 in(
	  
	  SELECT referencia1
     FROM [dbo].[VistaCostosPptoProgSemanaLineaBase]   
INTERSECT
SELECT 
referencia1
     
      FROM [dbo].[VistaCostosPptoProgSemanaActual]  
	   
	  
	  ) ) AS LINEASRETIRADAS ORDER BY referencia1
	END

		  END
	  

