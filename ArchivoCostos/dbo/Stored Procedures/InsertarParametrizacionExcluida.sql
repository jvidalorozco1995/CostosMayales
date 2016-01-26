/*===================================*/
create proc [dbo].[InsertarParametrizacionExcluida]

@Proyecto varchar(50),
@NombreObra varchar(250),
@CodigoObraInmueble varchar(20),
@Nviviendas int,
@vlrproy decimal(18,2),
@Area decimal(18,2),
@Clasificacion int,
@Estado int

as begin

		 insert into ParametrizacionExcluida values(@Proyecto,@NombreObra,@CodigoObraInmueble,@Nviviendas,@vlrproy,@Area,@Clasificacion,@Estado)
            
end

