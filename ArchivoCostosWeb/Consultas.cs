using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;
using System.Data.Odbc;

using ArchivoCostosWeb.Data;


namespace WebCostosPresupuestos
{
    public class Consultas
    {
        /*Traer las ordenes de multifox*/
       public static string Ordenes(string Proyecto,int Fecha){

           string sSql = "SELECT 0,ordedet.deorsucu+ordedet.deorpres+ordedet.deorcapi+ordedet.deordest+ordedet.deormate AS 'referencia1', obradet.obrdnomb AS 'presupuesto', ordedet.deordest AS 'cod unit', unitari.unitdesc AS 'unitario', ordedet.deormate AS 'cod insu', insumos.insudesc AS 'insumo', insumos.insuunid AS 'und', ordedet.deororde AS 'comp', ordedet.deorreci AS 'ent', ordedet.deororde-ordedet.deorreci AS 'x ent', ordenes.ordefech AS 'fecha', ordedet.deornume AS 'orden', ordenes.ordetipo AS 'tipo', ordenes.ordeprov AS 'cod prov', tercero.tercnomb AS 'proveedor', ((ordedet.deorunit*(1+ordedet.deorpiva/100))+((ordedet.deoradmv/ordedet.deororde)+(ordedet.deorimpv/ordedet.deororde)+(ordedet.deorutiv/ordedet.deororde)+(ordedet.deorivav/ordedet.deororde))) AS 'vl unitario',"
           + " ((ordedet.deorunit*(1+ordedet.deorpiva/100))+((ordedet.deoradmv/ordedet.deororde)+(ordedet.deorimpv/ordedet.deororde)+(ordedet.deorutiv/ordedet.deororde)+(ordedet.deorivav/ordedet.deororde)))*ordedet.deororde AS 'costo ent', ordedet.deorusua AS 'usuario',"+Fecha
           + " FROM insumos insumos, obradet obradet, ordedet ordedet, ordenes ordenes, tercero tercero, unitari unitari"
           + " WHERE ordedet.deornume = ordenes.ordenume AND ordedet.deorpres = ordenes.ordepres AND ordedet.deorsucu = ordenes.ordesucu AND ordenes.ordeprov = tercero.terccodi AND ordedet.deorsucu = obradet.obrdcodi AND ordedet.deorpres = obradet.obrdpres AND ordedet.deormate = insumos.insucodi AND ordedet.deordest = unitari.unitcodi AND ((ordedet.deornobl<>1) AND (ordedet.deorsucu='" + Proyecto + "') AND (ordenes.ordenume >='000001') AND (ordedet.deororde > 0))";

        
          return sSql;
       }
       /*Traer el costoentrado de multifox*/
       public static string CostoEntrado(string Proyecto, int Fecha)
         {


             string sSql = "SELECT 0,obradet.obrdcodi+obradet.obrdpres+liqmate.liqmcapi+liqmate.liqmdest+liqmate.liqmmate AS 'Referencia1', obradet.obrdnomb AS 'Nombre Ppto', liqmate.liqmfech AS 'fecha', liquida.liqupedi AS 'orden', liquida.liqunume AS '# liqu.', liquida.liquprov AS 'cod terc.', tercero.tercnomb AS 'Nombre', liqmate.liqmcapi AS 'cap', capitul.capidesc AS 'Nombre cap.', liqmate.liqmdest AS 'apu', unitari.unitdesc AS 'Nombre APU', insumos.insucodi AS 'Codigo', insumos.insudesc AS 'Descripcion', insumos.insuunid AS 'Unidad', liqmate.liqmliqu AS 'cant. ent.', ((liqmate.liqmunit*(1+liqmate.liqmpiva/100))+((liqmate.liqmadmv/liqmate.liqmliqu)+(liqmate.liqmimpv/liqmate.liqmliqu)+(liqmate.liqmutiv/liqmate.liqmliqu)+(liqmate.liqmivav/liqmate.liqmliqu))) AS 'vr unit entrado', (((liqmate.liqmliqu*liqmate.liqmunit)*(1+liqmate.liqmpiva/100))+(liqmate.liqmimpv+liqmate.liqmadmv+liqmate.liqmutiv+liqmate.liqmivav)) AS 'costo entrado', liquida.liquusua AS 'usuario',"+Fecha
             + " FROM capitul capitul, insumos insumos, liqmate liqmate, liquida liquida, obradet obradet, obraspr obraspr, tercero tercero, unitari unitari" 
             + " WHERE obradet.obrdcodi = liquida.liqusucu AND obradet.obrdcodi = obraspr.obracodi AND obradet.obrdpres = liquida.liqupres AND liquida.liqupres = liqmate.liqmpres AND liquida.liqunume = liqmate.liqmnume AND liquida.liqusucu = liqmate.liqmsucu AND liquida.liquprov = tercero.terccodi AND liqmate.liqmcapi = capitul.capicomp AND liqmate.liqmdest = unitari.unitcodi AND insumos.insucodi = liqmate.liqmmate AND ((liquida.liquanul<>1) AND (liqmate.liqmnobl<>1) AND (liquida.liqufech<={d '2015-12-31'}) AND (obradet.obrdcodi='"+Proyecto+"') AND (capitul.capiobra=liqmate.liqmsucu+liqmate.liqmpres And capitul.capiobra<>''))";
             return sSql;
         }

       /*Traer el pedidos de multifox*/
       public static string Pedidos(string Proyecto, int Fecha)
         {

             string sSql = "SELECT 0,reqdeta.reqdsucu+reqdeta.reqdpre1+reqdeta.reqdcapi+reqdeta.reqddest+reqdeta.reqdmate AS 'referencia1', reqdeta.reqdcapi AS 'cod capi', reqdeta.reqddest AS 'cod unit', reqdeta.reqdmate AS 'cod insu',requisi.requfech AS 'fecha', reqdeta.reqdnume AS 'pedido', reqdeta.reqdrequ AS 'ped', (IIF(0=requapro And reqdapro<>0,0,reqdapro)) AS 'aprob', reqdeta.reqdpedi AS 'comp', (IIF(reqdeta.reqdapro-reqdeta.reqdpedi<0,0,reqdeta.reqdapro-reqdeta.reqdpedi)) AS 'x gen orden', reqdeta.reqdorde AS 'orden', reqdeta.reqdusua AS 'usuario',"+Fecha
             + " FROM reqdeta reqdeta, requisi requisi" 
             + " WHERE reqdeta.reqdnume = requisi.requnume AND reqdeta.reqdsucu = requisi.requsucu AND reqdeta.reqdpre1 = requisi.requpres AND ((reqdeta.reqdsucu Like '%"+Proyecto+"%') AND (reqdeta.reqdpre1<>''))";
             return sSql;
         }

       /*Traer las salidas de multifox*/
       public static string Salidas(string Proyecto, int Fecha)
         {

             string sSql = "SELECT 0,salidas.saliobra+salidas.salicapi+salidas.saliunit+salidas.saliinsu AS 'referencia', salidas.salifech AS 'fecha', salidas.saliliqu AS 'liquidacion', salidas.salivale AS 'vale consumo', salidas.salisali AS 'salida', salidas.salitipo AS 'tipo sa', salidas.salicapi AS 'cod capi', salidas.saliunit AS 'cod unita', salidas.saliinsu AS 'cod insum', insumos.insudesc AS 'insumo', salidas.salicant AS 'cant', salidas.salicost*(1+salidas.salipiva/100+ordenes.ordeadmi/100+ordenes.ordeimp1/100+ordenes.ordeutil/100+(ordenes.ordeutil/100*ordenes.ordeivau/100))*salidas.salicant AS 'cost sali',"
        + " salidas.saliobse , salidas.saliusua," + Fecha
        + " FROM insumos insumos, liquida liquida, ordenes ordenes, salidas salidas" 
        + " WHERE insumos.insucodi = salidas.saliinsu AND salidas.saliliqu = liquida.liqunume AND liquida.liqupedi = ordenes.ordenume AND ((salidas.salitipo<>$4) AND (salidas.salianul<>1) AND (LEFT(saliobra,3)='"+Proyecto+"') AND (salidas.saliobra=liquida.liqusucu+liquida.liqupres And salidas.saliobra=ordenes.ordesucu+ordenes.ordepres And salidas.saliobra<>''))";
             
             return sSql;
         }
       /*Traer el costospresupuesto de multifox*/
       public static string CostosPresuProg(string Proyecto, string Filtro, int Fecha)
         {

             string sSql = "SELECT 0,detactr.dectobra+detactr.dectcapi+detactr.dectunit+detactr.dectinsu AS 'referencia1', detactr.dectobra+detactr.dectcapi+detactr.dectunit AS 'referencia2', detactr.dectobra+detactr.dectinsu AS 'referencia3', obradet.obrdnomb AS 'presupuesto', detactr.dectcapi AS 'cod capi', capitul.capidesc AS 'capitulo', detactr.dectunit AS 'cod unit', unitari.unitdesc AS 'unitario', unitari.unitunid AS 'und unita', cantobr.cantcant AS 'cant x ppto', detactr.dectinsu AS 'cod insu', insumos.insutipo, insumos.insudesc AS 'insumo', insumos.insuunid AS 'unid insu', precins.precinve AS 'ctrl inven', detactr.dectavan AS 'validación', precins.precvalo AS 'precio ppto', detauni.detacant AS 'consumo unitario', detactr.dectauti AS 'consumo total', detactr.dectadic AS 'adic', precins.precautv AS 'precio aut',"+ Fecha
        + " FROM cantobr cantobr, capitul capitul, detactr detactr, detauni detauni, insumos insumos, obradet obradet, precins precins, unitari unitari" 
        + " WHERE detactr.dectunit = unitari.unitcodi AND detactr.dectcapi = capitul.capicomp AND detactr.dectobra = capitul.capiobra AND detactr.dectinsu = insumos.insucodi AND cantobr.cantcomp = detactr.dectcapi AND cantobr.cantobra = detactr.dectobra AND cantobr.cantunit = detactr.dectunit AND detauni.detaobra = detactr.dectobra AND detauni.detaunit = detactr.dectunit AND detauni.detainsu = detactr.dectinsu AND precins.precobra = detactr.dectobra AND precins.preccodi = detactr.dectinsu AND ((detactr.dectobra=obradet.obrdcodi+obradet.obrdpres  AND (obradet.obrdcodi='"+Proyecto+"')))";
                  return sSql;
         }


       /*Traer las areas de multifox*/
         public static string GuardarAreasConsulta() {

         
             string sSql = "SELECT 1,LEFT(inmuebl.inmuobra,3) AS 'Proyecto',obradet.obrdnomb, inmuebl.inmuobra, bloques.bloqcodi, bloques.bloqdesc, inmuebl.inmucodi, inmuebl.inmuvent, inmuebl.inmuarea FROM bloques bloques, inmuebl inmuebl, obradet obradet WHERE inmuebl.inmuobra = bloques.bloqobra AND ((inmuebl.inmuobra=obradet.obrdcodi+obradet.obrdpres) AND (bloques.bloqcodi=right(inmuebl.inmubloq,2)))";
             return sSql;
         }
         /*seleccionar la parametrizaciones de multifox*/
          public static string GuardarParametrizacion() {


              string sSql = "SELECT 1,[Proyecto],[NombreObra],[CodigoObraInmueble],[Nviviendas],[VlrManzana],[Area],'0','0' FROM [ArchivoCostos].[dbo].[VistaAreasProyectosAreas]";
              return sSql;
         }


          
        /*metodo para copiar la semana*/
          public static string CopiarSemana(int IdFecha)
          {

              string sSql = "SELECT [referencia1],[referencia2],[referencia3],[presupuesto],[codcapi],[capitulo],[codunit],[unitario],[undunita],[cantxppto],[codinsu],[insutipo],[insumo],[unidinsu],[ctrlinven],[validación],[precioppto],[consumounitario],[consumototal],[adic],[precioaut],[preciocompra],[precioentrado],[ped],[aprob],[comp],[ent],[sali],[traslado],[xcomp],[xent],[saldoxunit],[saldoxppto],[vlrent],[vlrenttraslado],[vlrcompradoxent],[vlrxcomp],[vlrtraslado],[vlrproy],[vlrproyejec],[vlrini],[vlrejec],[IdFecha],(SELECT CLASIFICACION FROM PARAMETRIZACIONINCLUIDA WHERE CodigoObraInmueble=SUBSTRING(referencia2,0,7)) FROM [ArchivoCostos].[dbo].[CostosPptoProg] WHERE IdFecha=" + IdFecha + "and SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1)  and referencia1  NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(CostosPptoProg.referencia1,0,4))  and insutipo not in(select insutipo from ParametrizacionGrupos where Proyecto=substring(CostosPptoProg.referencia1,0,4))";
              return sSql;
          }


        

        /*metodo para copiar la tabla*/
         public static string CopiarTabla(int Fecha)
         {
             ArchivoCostosWeb.Data.DataDataContext db = new ArchivoCostosWeb.Data.DataDataContext();
             db.CommandTimeout = 900000;
         
            
       string sSql =
       " SELECT 0,[refe]"
     + ",[referencia2]"
     + ",[referencia3]"
     +",[presupuesto]"
     +",[codcapi]"
      + " ,[capitulo]"
      + " ,[codunit]"
      + " ,[unitario]"
      + " ,[undunita]"
      + " ,[cantxppto]"
      + " ,[codinsu]"
      + " ,[insutipo]"
     + "  ,[insumo]"
     + "  ,[unidinsu]"
      + " ,[ctrlinven]"
      + " ,[validación]"
      + " ,[precioppto]"
      + " ,[consumounitario]"
       + ",[consumototal]"
      + " ,[adic]"
      + " ,[precioaut]"
      + " ,[PrecioCompra]"
       + ",[PrecioEntrado]"
      + " ,[Ped]"
      + " ,[aprob]"
       + ",[comp]"
       + ",[ent]"
       + ",[sali]"
       + ",[traslado]"
       + ",[xcomp]"
      + " ,[xent]"
       + ",[saldoxunit]"
       + ",[SaldoXppto]"
       + ",[vlrEnt]"
       + ",[vlrEnttraslado]"
       + ",[VlrCompradoxent]"
       + ",[vlrxcomp]"
       + ",[VlrTraslado]"
       + ",[vlrproy]"
       + ",[vlrproyejec]"
       + ",[Vlrini]"
       + ",[vlrejec],"+Fecha+"FROM [ArchivoCostos].[dbo].[VistaLaGranVistaVistaHhastaValorEntrado]";
             return sSql;
         }


        /*Esto es la parte mas importante, pues es la que sincroniza con el servidor trae la informacion y la inserta en sql server por medio de datatables*/
         public static void EjecutaOrdenes(string Proyecto, string Filtro, int IdFecha)
         {





             string Mensaje = "";

             DataDataContext db = new DataDataContext();
             db.CommandTimeout = 900000;

             /*DIA 11-11-2014 3:57 PM COMENTADA ESTA LINEA*/
            /* if (db.ValidarSiHayRegistros() >= 1)
             {

                 Mensaje = "Servidor ocupado, intente nuevamente";
                 return;

             }
             else
             {*/

                 string sConnectionString1 = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                 string sConnectionString2 = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                 string sConnectionString3 = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                 string sConnectionString4 = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                 string sConnectionString5 = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;


                 //Abrir la Conexion
                 Utilidades cn = new Utilidades();


                 //Ejecutar los Comando que Deseemos.
                // Recordemos que el Metodo Ejecutar no Regresa un Objeto del tipo DataSet que es como una Colecion de Tablas. Y si queremos poner el resultado del comando en una Tabla hariamos lo siguiente:
               //Antes de Terminar permiten Recomendarles la forma de utilizar la clase Conexion y el Manejo de Excepciones.


                 try
                 {



                     SqlBulkCopy copia = new SqlBulkCopy(sConnectionString1);
                     SqlBulkCopy copia2 = new SqlBulkCopy(sConnectionString2);
                     SqlBulkCopy copia3 = new SqlBulkCopy(sConnectionString3);
                     SqlBulkCopy copia4 = new SqlBulkCopy(sConnectionString4);
                     SqlBulkCopy copia5 = new SqlBulkCopy(sConnectionString5);

                     /*Copia a las tablas ordenes y ordenes temporales*/
                     cn.Abrir1();
                         DataTable TablaOrdenes = cn.VerTabla1(Consultas.Ordenes(Proyecto, IdFecha), "OrdenesTemp");
                         copia.DestinationTableName = "OrdenesTemp";
                         copia.BulkCopyTimeout = 900000;
                         copia.WriteToServer(TablaOrdenes);
                         copia.DestinationTableName = "Ordenes";
                         copia.WriteToServer(TablaOrdenes);
                     cn.Cerrar1();

                     /*Copia a las tablas costoentrado y costoentrado temporales*/
                     cn.Abrir2();
                         DataTable TablaConsultas = cn.VerTabla2(Consultas.CostoEntrado(Proyecto, IdFecha), "CostoEntradoTemp");
                         copia2.DestinationTableName = "CostoEntradoTemp";
                         copia2.BulkCopyTimeout = 900000;
                         copia2.WriteToServer(TablaConsultas);
                         copia2.DestinationTableName = "CostoEntrado";
                         copia2.WriteToServer(TablaConsultas);
                     cn.Cerrar2();

                     /*Copia a las tablas Pedidos y Pedidos temporales*/
                     cn.Abrir3();
                         DataTable TablaPedidos = cn.VerTabla3(Consultas.Pedidos(Proyecto, IdFecha), "PedidosTemp");
                         copia3.DestinationTableName = "PedidosTemp";
                         copia3.BulkCopyTimeout = 900000;
                         copia3.WriteToServer(TablaPedidos);
                         copia3.DestinationTableName = "Pedidos";
                         copia3.WriteToServer(TablaPedidos);
                     cn.Cerrar3();

                     /*Copia a las tablas Salidas y Salidas temporales*/
                     cn.Abrir4();
                         DataTable TablaSalidas = cn.VerTabla4(Consultas.Salidas(Proyecto, IdFecha), "SalidasTemp");
                         copia4.DestinationTableName = "SalidasTemp";
                         copia4.BulkCopyTimeout = 900000;
                         copia4.WriteToServer(TablaSalidas);
                         copia4.DestinationTableName = "Salidas";
                         copia4.WriteToServer(TablaSalidas);
                     cn.Cerrar4();

                     /*Copia a las tablas CostosPptoProgTemp temporales*/
                     cn.Abrir5();
                         DataTable TablaCostoPresProg = cn.VerTabla5(Consultas.CostosPresuProg(Proyecto, Filtro, IdFecha), "CostosPptoProgTemp");
                         copia5.DestinationTableName = "CostosPptoProgTemp";
                         copia5.BulkCopyTimeout = 900000;
                         copia5.WriteToServer(TablaCostoPresProg);
                     cn.Cerrar5();

                
                     //Guarda una copia de la fecha con los campos calculados de las vistas
                     GuardarCopia(IdFecha);
          
                     //cerrar las conexiones de las tablas
                     TablaOrdenes.Dispose();
                     TablaConsultas.Dispose();
                     TablaPedidos.Dispose();
                     TablaSalidas.Dispose();
                     TablaCostoPresProg.Dispose();

                     //metodo para vaciar las tablas temporales
                     db.VaciarTablasTemporales();

                     //metodos para borrar las areas
                     db.BorrarAreas();
                     //metodos para guardar las areas
                     Consultas.GuardarAreas();
                   
                 }

                 catch (Exception ex) // Maneja los Posibles Errores
                 {
                      //Metodo para insertar el error
                      db.InsertarError(ex.Message.ToString(),DateTime.Now);
                 }

                 finally
                 {
                     //metodo para cerrar las conexiones
                     cn.Cerrar1();
                     cn.Cerrar2();
                     cn.Cerrar3();
                     cn.Cerrar4();
                     cn.Cerrar5();
                 }

         }
         //Metodo para actualizar los usuarios
         public static void ActualizarUsuarios()
         {
             //Cadena para hacer las consultas
             string CADENA;

             //Metodos de conexiones
             string sConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


             OdbcConnection conexSql = new OdbcConnection(sConnectionString);

             //metodo para abrir las cadenas de conexiones
             OdbcConnection objcon = new OdbcConnection(sConnectionString);
             objcon.Open();

             //Cadena de string
             CADENA = "SELECT usuario.usuacodi, usuario.usuapass, emplead.emplnomb FROM emplead emplead, usuario usuario WHERE emplead.emplterc = usuario.usuaterc";

             //DataAdapter que se llena 
             OdbcDataAdapter daUsuariofox = new OdbcDataAdapter(CADENA, objcon);

             //creamos un dataset
             DataSet dsUsuariofox = new DataSet();

             //llenamos el esquema
             daUsuariofox.FillSchema(dsUsuariofox, SchemaType.Source, "usuario_FOX");
             daUsuariofox.Fill(dsUsuariofox, "usuario_FOX");
             //creamos un datatable
             DataTable tbUsuariofox = new DataTable();
             tbUsuariofox = dsUsuariofox.Tables["usuario_FOX"];

             //////////////////////// sql
             string sConnectionStringsql;
             sConnectionStringsql = ("Server=servidor2sp;Database= CONTROL_ALMACEN;User Id=sa;Password=Qwer1234;");
             SqlConnection objConnsql = new SqlConnection(sConnectionStringsql);
             objConnsql.Open();
             SqlDataAdapter dausuariosql = new SqlDataAdapter("Select * From Usuarios", objConnsql);
             DataSet dsusuariosql = new DataSet();
             dausuariosql.FillSchema(dsusuariosql, SchemaType.Source, "usuario_sql");
             dausuariosql.Fill(dsusuariosql, "usuario_sql");

             DataTable dtusuariosql = new DataTable();
             dtusuariosql = dsusuariosql.Tables["usuario_sql"];

             /////////////
             compararUsuarios(tbUsuariofox, dtusuariosql, objConnsql);
             //cerramos la conexion
             objConnsql.Close();
             objcon.Close();
         }

         public static void compararUsuarios(DataTable Dt1, DataTable Dt2, SqlConnection objConnsql)
         {
             Boolean contador;
             SqlCommand cmd;
             {

                 foreach (DataRow row1 in Dt1.Rows)
                 {
                     contador = false;
                     foreach (DataRow row2 in Dt2.Rows)
                     {
                         string cadena2 = row1["usuacodi"].ToString();
                         string cadena3 = row2["Usuario"].ToString();
                         if (row1["usuacodi"].ToString() == row2["Usuario"].ToString())
                         {

                             contador = true;
                             // consulta
                             string cadena = "Update Usuarios set Usuario = '" + row1["usuacodi"].ToString() + "', Clave = '" + row1["usuapass"].ToString() + "', Nombre = '" + row1["emplnomb"].ToString() + "' WHERE Usuario = '" + row1["usuacodi"].ToString() + "'";

                             cmd = new SqlCommand(cadena, objConnsql);
                             cmd.ExecuteNonQuery();
                         }

                     }
                     if (contador == false)
                     {
                         string cadena = "Insert into Usuarios (Usuario, Clave, Nombre) values ( '" + row1["usuacodi"].ToString() + "','" + row1["usuapass"].ToString() + "','" + row1["emplnomb"].ToString() + "')";
                         cmd = new SqlCommand(cadena, objConnsql);
                         cmd.ExecuteNonQuery();
                     }
                 }
              }
         }

        
         //guarda toda la vista de cost
         public static void GuardarCopia(int IdFecha)
         {
             //Abrir la Conexion
             Utilidades cn = new Utilidades();

             string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
             try
             {
                 //Copiamos los datos a la tabla costospptoprog
                 SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                 copia.BulkCopyTimeout = 900000;
                 DataTable TablaCopia = cn.DatosCopiar(Consultas.CopiarTabla(IdFecha));
                 copia.DestinationTableName = "CostosPptoProg";
                 copia.WriteToServer(TablaCopia);

                 TablaCopia.Dispose();
             }
             catch (Exception ex)
             {
                 /*Metodo para insertar el error*/
                 DataDataContext db = new DataDataContext();
                 db.CommandTimeout = 900000;
                 db.InsertarError(ex.Message.ToString(),DateTime.Now);
           
             }

         }


         public static void GuardarCopiaSemanaActual(int IdFecha)
         {
             //Abrir la Conexion
             Utilidades cn = new Utilidades();
             DataDataContext db = new DataDataContext();
             db.CommandTimeout = 900000;
             string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
             try
             {
                 /*Guardarmos una copia*/
                 SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                 DataTable TablaCopia = cn.DatosCopiar(Consultas.CopiarSemana(IdFecha));
                 copia.DestinationTableName = "CostosPptoProgSemanaActual";
                 copia.WriteToServer(TablaCopia);

                 TablaCopia.Dispose();
             }
             catch (Exception ex)
             {
                 //Metodo para insertar error
                db.InsertarError(ex.Message.ToString(),DateTime.Now);
             }

         }

         public static void GuardarCopiaSemanaPasada(int IdFecha)
         {
             //Abrir la Conexion
             Utilidades cn = new Utilidades();
             DataDataContext db = new DataDataContext();
             db.CommandTimeout = 900000;
             string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
             try
             {
                 //metodo para guardar una copia de la semana pasada
                 SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                 DataTable TablaCopia = cn.DatosCopiar(Consultas.CopiarSemana(IdFecha));
                 copia.DestinationTableName = "CostosPptoProgSemanaPasada";
                 copia.WriteToServer(TablaCopia);
                 //metodo para cerrar la tabla
                 TablaCopia.Dispose();
             }
             catch (Exception ex)
             {
                 //metodo para insertar error
                  db.InsertarError(ex.Message.ToString(),DateTime.Now);
             }

         }

         public static void GuardarCopiaSemanaLineaBase(int IdFecha)
         {
             //Abrir la Conexion
             Utilidades cn = new Utilidades();
             DataDataContext db = new DataDataContext();
             db.CommandTimeout = 900000;
             string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
             try
             {
                 /*Metodo para hacer una copia*/
                 SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                 DataTable TablaCopia = cn.DatosCopiar(Consultas.CopiarSemana(IdFecha));
                 copia.DestinationTableName = "CostosPptoProgSemanaLineaBase";
                 copia.WriteToServer(TablaCopia);

                 TablaCopia.Dispose();
             }
             catch (Exception ex)
             { 
                 //metodo para insertar error
                db.InsertarError(ex.Message.ToString(),DateTime.Now);
             }

         }

        /*Metodo para guardar las areas*/
        public static void GuardarAreas()
        {
            //Abrir la Conexion
            Utilidades cn = new Utilidades();

            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            try
            {
                /*copiar en la tabla areas*/
                cn.Abrir5();
                    SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                    DataTable TablaCopia = cn.VerTabla5(Consultas.GuardarAreasConsulta(),"Areas");
                    copia.DestinationTableName = "Areas";
                    copia.WriteToServer(TablaCopia);
                cn.Cerrar5();
            }
            catch (Exception ex)
            {

                DataDataContext db = new DataDataContext();
                db.CommandTimeout = 900000;
                 db.InsertarError(ex.Message.ToString(),DateTime.Now);
       
            }

        }

        //guardar parametros  
        public static void GuardarParametros()
        {
            //Abrir la Conexion
            Utilidades cn = new Utilidades();

            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            try
            {
                //Guardar la parametrizacion
                cn.Abrir5();
                SqlBulkCopy copia = new SqlBulkCopy(sConnectionString);
                DataTable TablaCopia = cn.DatosCopiar(Consultas.GuardarParametrizacion());
                //Tabla de la parametrizacion
                copia.DestinationTableName = "Parametrizacion";
                //escribir en el servidor
                copia.WriteToServer(TablaCopia);
                cn.Cerrar5();
            }
            catch (Exception ex)
            {
                DataDataContext db = new DataDataContext();
                db.CommandTimeout = 900000;
                db.InsertarError(ex.Message.ToString(),DateTime.Now);
            }

        }
     
        
    }
}