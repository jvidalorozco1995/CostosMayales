/*===================================*/
CREATE proc [dbo].[EliminarReferencias]


@Referencia varchar(50)

as begin




	   
		 DELETE FROM Referencias WHERE REFERENCIA LIKE @Referencia+'%'
             
	
 
end

