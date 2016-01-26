
CREATE PROCEDURE [dbo].[ParametrizacionCapitulo] 
	@Proyecto varchar(6)
AS
BEGIN
	

DECLARE @codigoobrainmueble varchar(40) 
DECLARE @NombreObra varchar(150) 

DECLARE @Capitulo varchar(50)

DECLARE presupuestos CURSOR 

FOR
select codigoobrainmueble,NombreObra from Parametrizacion  WHERE PROYECTO=@Proyecto
OPEN presupuestos 
-- apertura del cursor

-- Lectura de la primera fila del cursor

FETCH presupuestos INTO  @CodigoObraInmueble,@NombreObra

WHILE (@@FETCH_STATUS = 0)

BEGIN	
  DECLARE CursorCapitulos CURSOR FOR
		SELECT DISTINCT(codcapi)
		FROM [ArchivoCostos].[dbo].[CostosPptoProg] WHERE IdFecha=(SELECT MAX(IdFecha) FROM CostosPptoProg WHERE SUBSTRING(referencia1,0,4)=@Proyecto) and SUBSTRING(referencia1,0,7)
		IN(SELECT CodigoObraInmueble FROM Parametrizacion WHERE Estado=1 ) and SUBSTRING(referencia1,0,7)=@codigoobrainmueble /*and codcapi not  IN(SELECT Filtros.Unitario FROM Parametrizacion 
		INNER JOIN Filtros ON CodigoObraInmueble = Filtros.Presupuesto
		WHERE Estado=1)*/
  OPEN CursorCapitulos 
    
	FETCH CursorCapitulos INTO  @Capitulo

	 WHILE (@@FETCH_STATUS = 0)

     BEGIN
	 -- Lectura de la siguiente fila de un cursor
	-- select @CodigoObraInmueble +' '+@Capitulo
          INSERT INTO FILTROs (Presupuesto,Unitario,Stated) VALUES(@codigoobrainmueble,@Capitulo,1)

		  FETCH CursorCapitulos INTO    @Capitulo
	 END
CLOSE CursorCapitulos

-- Libera los recursos del cursor

DEALLOCATE CursorCapitulos



-- Lectura de la siguiente fila del cursor
PRINT @codigoobrainmueble
FETCH presupuestos INTO  @CodigoObraInmueble, @NombreObra

END -- Fin del bucle WHILE

 

-- Cierra el cursor

CLOSE presupuestos

-- Libera los recursos del cursor

DEALLOCATE presupuestos

 


END

