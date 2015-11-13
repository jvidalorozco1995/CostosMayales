using ArchivoCostosWeb.Data;
using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebCostosPresupuestos;
namespace ArchivoCostosWeb
{
    public partial class WebActualizar : System.Web.UI.Page
    {
        Data.DataDataContext db = new Data.DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            db.CommandTimeout = 900000;
            if(!IsPostBack){
                //llenar los proyectos
               FillProyecto();
                //si el usuario es nullo entonces nos dirijimos al login
               if (Session["Usuario"] == null) {
                   Response.Redirect("Login.aspx",false);
               }
            }
        }

        //Metodo para obtener la fecha actual
        private DateTime getFechaActual()
        {
            int anio, dia, mes, hour, minute, second, millisecond;
            DateTime dtFecha;
            anio = DateTime.Today.Year;
            mes = DateTime.Today.Month;
            dia = DateTime.Today.Day;
            hour = DateTime.Today.Hour;
            minute = DateTime.Today.Minute;
            second = DateTime.Today.Second;
            millisecond = DateTime.Today.Millisecond;
            DateTime dt = DateTime.Now;

            //dtFecha = new DateTime(anio, mes, dia,hour,minute,second,millisecond);
            return dt;
        }
        //metodo para llenar los proyectos
        private void FillProyecto()
        {
           try
            {
                CmbProyectos.DataTextField = "Proyecto";
                CmbProyectos.DataValueField = "Codigo";
                CmbProyectos.DataBind();
                CmbProyectos.Items.Insert(0, new ListItem("Seleccione Registro ...", "0"));
            }
            catch (Exception ex)
            {
                //si hay un error mostrarlo en un label
                lblerror.Visible = true;
                lblerror.Text = ex.Message;
            }
        }


        
        //obtener el filtro por cada proyecto
        public string ObtenerFiltro()
        {
            string Filtro = "";
      
            foreach (var item in db.RetornaFiltro(CmbProyectos.SelectedValue))
            {

                Filtro = item.Filtro;

            }

            //retornar el filtro
            return Filtro;
        }

        //boton ejecutar
        protected void BtnEjecutar_Click(object sender, EventArgs e)
        {
            //llamar la funcion onconfirm
              OnConfirm(sender, e);
        }
        //funcion que ejecuta la inserccion de la fecha, y  guarda los costos,ordenes,salidas 
        public void OnConfirm(object sender, EventArgs e)
        {
            db.CommandTimeout = 900000;
            try
            {
               if (CmbProyectos.SelectedIndex == 0)
                {

                    Response.Write("<script>window.alert('" + "Seleccione al menos un proyecto" + "');</script>");
                    return;
                }
                System.Threading.Thread.Sleep(500);
                string IdFecha = "";
                string Mensaje = "";
                //inserta la fecha del sistema
                string fechaSistema = Convert.ToString(getFechaActual().ToString("MM/dd/yyyy hh:mm:ss.fff"));
                db.InsertarFechaEstado(Convert.ToString(fechaSistema));
                string fechaSql = null;
                db.MinimaFechaEstados(ref fechaSql);
                if (fechaSql != Convert.ToString(fechaSistema))
                {
                    Label2.Visible = true;
                    Label2.Text = "Servidor Ocupado Intente en segundos por favor..";
                    fechaSistema = null;
                }
                else
                {
                    try
                    {
                        //vacia las tablas temporales
                        db.VaciarTablasTemporales();
                        //insertar las fechas
                        db.InsertarFechas(CmbProyectos.SelectedValue, getFechaActual(), "False", ref IdFecha);
                       //ejecutar todas las tareas a ejecutar
                        Consultas.EjecutaOrdenes(CmbProyectos.SelectedValue, ObtenerFiltro(), Convert.ToInt32(IdFecha));
                        //refrescar la grilla de las fechas
                        GridView1.DataBind();
                        //eliminar los estados
                        db.EliminarEstados();
                        //enviar alerta de datos guardados
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Datos Guardados Satisfactoriamente..!');", true);
                        
                    }
                    catch (Exception ex)
                    {
                        //eliminar los costos de las fechas en caso de que halla un error
                        db.EliminarCostosFecha(Convert.ToInt32(IdFecha));
                        db.EliminarEstados();
                        //insertar error
                        db.InsertarError(ex.Message.ToString(),DateTime.Now);
                    }
                }
            }
            catch (Exception ex) {
                //mostrar error
                lblerror.Visible = true;
                lblerror.Text = ex.Message;
            }
        }


       
        //boton para exportar a excel
        protected void BtnExportExcel_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //variable que almacena el id seleccionado
                string var = null;
                if (e.CommandName != "Page")
                {
                    //variable que almacena el id seleccionado
                     var = e.CommandArgument.ToString();
                

                }
                //crear un libro de excel
                using (XLWorkbook wb = new XLWorkbook())
                {
                    //crear una hoja de acuerdo a un datatable
                    wb.AddWorksheet(ArchivoCostosSemanaActual(var), "COSTOS100%");
                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    //contenido de la respuesta en excel
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    //nombre del archivo
                    Response.AddHeader("content-disposition", "attachment;filename=Costos100.xlsx");

                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        //guarddo el libro
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.Seek(0, SeekOrigin.Begin); // Seem to have to manually rewind stream before applying it to the 
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.Close();
                        //exporto el libro
                        Response.End();
                    }
                }
            }
            catch (Exception ex)
            {
                //muestro el error en caso de que halla uno
                lblerror.Visible = true;
                lblerror.Text = ex.Message;

            }
        }

        //cargar la grilla 
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            RadioButtonList1.SelectedValue = "0";
            CmbProyectos.SelectedIndex = 0;
            GridView1.DataBind();
            lblerror.Visible = false;
        }
        //metodo al cambiar lo del combox
        protected void CmbProyectos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CmbProyectos.SelectedIndex == 0)
            {
                //seleccionar por defecto el valor 0
                RadioButtonList1.SelectedValue = "0";
                CmbProyectos.SelectedValue = "0";
                GridView1.DataBind();
                return;
            }
            //
            lblerror.Visible = false;
            RadioButtonList1.SelectedValue = "1";
        }


        //crear un datatable y un select que me devuelve los costsos de la semana actual
        public DataTable ArchivoCostosSemanaActual(string IdFecha)
        {
            //conexion para tener el archivo de costos
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT [Id],[referencia1],[referencia2],[referencia3],[presupuesto],[codcapi],[capitulo],[codunit],[unitario],[undunita],[cantxppto],[codinsu],[insumo],[unidinsu],[consumounitario],[consumototal],[precioppto],[insutipo],[ctrlinven],[validación],[adic],[precioaut],[preciocompra],[precioentrado],[ped] ,[aprob],[comp],[ent],[sali],[traslado],[xcomp],[xent],[saldoxunit],[saldoxppto],[vlrent],[vlrenttraslado],[vlrcompradoxent],[vlrxcomp] ,[vlrtraslado],[vlrproy],[vlrproyejec],[vlrini],[vlrejec],[IdFecha] FROM [ArchivoCostos].[dbo].[CostosPptoProg]  WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(CostosPptoProg.referencia1,0,4))  and insutipo not in(select insutipo from ParametrizacionGrupos where Proyecto=substring(CostosPptoProg.referencia1,0,4)) and IdFecha='" + IdFecha + "' order by referencia1";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.CommandTimeout = 900000;
                sqlConn.Open();
                //crear datatable para llenar
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

      


        }


}