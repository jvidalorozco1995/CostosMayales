/*===================================*/
CREATE proc [dbo].[InsertarError]


@Error varchar(500),
@Fecha datetime

as begin




		 insert into Error values(@Error,@Fecha)
              
	
end

