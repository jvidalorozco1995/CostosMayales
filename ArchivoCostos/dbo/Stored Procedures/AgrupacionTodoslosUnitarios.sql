
CREATE PROCEDURE  [dbo].[AgrupacionTodoslosUnitarios]
@Presupuesto varchar(50)
AS
BEGIN
select SUBSTRING(referencia1,0,7) as Presupuesto,unitario,sum(Vlrproy) as vlrproy,sum(vlrini) as vlrinicial,
CASE WHEN sum(Vlrproy)=0 THEN (SELECT 0) ELSE round(sum(Vlrproy)  / (select sum(vlrproy) from VistaCostosPptoProgSemanaActual where SUBSTRING(referencia1,0,7)=@Presupuesto),20,2)
END as SumaIncidencia from VistaCostosPptoProgSemanaActual
where SUBSTRING(referencia1,0,7)=@presupuesto
group by unitario,SUBSTRING(referencia1,0,7) 
order by SumaIncidencia desc
END
