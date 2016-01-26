/*===================================*/
Create proc [dbo].[InsertarReferencias]


@Referencia varchar(50)

as begin




	   
		 insert into Referencias values(@Referencia)
             
	
 
end

