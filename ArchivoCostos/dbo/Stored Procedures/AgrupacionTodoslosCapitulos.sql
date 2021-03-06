﻿
CREATE PROCEDURE  [dbo].[AgrupacionTodoslosCapitulos]
@Presupuesto varchar(50)
AS
BEGIN
select SUBSTRING(referencia1,0,7) as Presupuesto,capitulo,sum(Vlrproy) as vlrproy,sum(vlrini) as vlrinicial,
CASE WHEN sum(Vlrproy)=0 THEN (SELECT 0) ELSE Round(sum(Vlrproy)  / (select sum(vlrproy) from VistaCostosPptoProgSemanaActual where SUBSTRING(referencia1,0,7)=@Presupuesto),20,2)
END as SumaIncidencia from VistaCostosPptoProgSemanaActual
where SUBSTRING(referencia1,0,7)=@Presupuesto
group by capitulo,SUBSTRING(referencia1,0,7) 
order by SumaIncidencia desc
END
