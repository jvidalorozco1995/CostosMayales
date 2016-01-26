/*===================================*/
create proc [dbo].[InsertarFechas]


@Proyecto varchar(50),
@Fecha datetime,
@Tipo varchar(20),
@mjs varchar(60)out
as begin



/*if(@Tipo='True')
 begin
if not exists(select Proyecto from LineaBase where proyecto =@Proyecto  and Tipo='True')
      begin
 */

 /*if(select Count(Fecha) from LineaBase where Fecha=@Fecha and Proyecto=@Proyecto and Tipo=@Tipo)>=1
    begin 
        set  @mjs='Ya se insertaron registros en el proyecto el dia de hoy'    
	end
	
	else*/
	    
	/*begin */
	   
		 insert into Fechas values(@Fecha,@Proyecto,@Tipo)
               set  @mjs=SCOPE_IDENTITY()
	/*end*/

	   
	  /* end
          
		   else
		   begin
		     Update LineaBase set Fecha=@fecha
               set  @mjs='Lineas base Actualizada'
        end 
end
else if(@Tipo='False')
begin
   if not exists(select Proyecto from LineaBase where proyecto =@Proyecto and Fecha=@Fecha and Tipo='False')
      begin
 
              insert into LineaBase values(@Fecha,@Proyecto,@Tipo)
               set  @mjs='Lineas base insertada'
			   
	   end
          
		   else
		   begin
		     return 0
        end 
  end    */
end

