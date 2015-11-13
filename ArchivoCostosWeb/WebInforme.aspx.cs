using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using ArchivoCostosWeb.Data;
using WebCostosPresupuestos;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using ClosedXML.Excel;
using System.IO;
using System.Collections;
namespace ArchivoCostosWeb
{
    public partial class WebInforme : System.Web.UI.Page
    {
        decimal sum=0;
        DataTable dtVariacion;
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.LinkButton1);
            scriptManager.RegisterPostBackControl(this.BtnEjecutar);

            if (!IsPostBack)
            {
                //si el usuario es null retornamos al login
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            
        }

        //lista de una session
        public List<string> Lista
        {
            get
            {
                if (HttpContext.Current.Session["Lista"] == null)
                {
                    HttpContext.Current.Session["Lista"] = new List<string>();
                }
                return HttpContext.Current.Session["Lista"] as List<string>;
            }
            set
            {
                HttpContext.Current.Session["Lista"] = value;
            }

        }
        //crear boton ejecutar 
        protected void BtnEjecutar_Click(object sender, EventArgs e)
        {
            try
            {

                //sino se ha escogido nada del combox enviar mensaje de alerta
                if (CmbSemanaActual.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, una Semana Actual');", true);
                    return;
                }
                //sino se ha escogido nada del combox enviar mensaje de alerta
                if (CmbSemanaPasada.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Pasada');", true);
                    return;
                }
                //sino se ha escogido nada del combox enviar mensaje de alerta
                if (CmbLineaBase.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Tienes, Una Linea Base, Por Favor Entra A la Parametrización Del Informe y Escoge Una Fecha Como Linea Base');", true);
                    return;
                }

                DataDataContext db = new DataDataContext();
                db.CommandTimeout = 900000;
                //metodo para vaciar las tablas temporales
                db.VaciarTablasTemporalesSemanas();

                BtnEjecutar.Visible = false;
                LinkButton1.Visible = false;
                //guardar una copia de la semana actual en las tablas temporales
                Consultas.GuardarCopiaSemanaActual(Convert.ToInt32(CmbSemanaActual.SelectedValue));
               // db.EliminarReferencia(Convert.ToInt32(CmbSemanaActual.SelectedValue));
                //guardar una copia de la semana pasada en las tablas temporales
                Consultas.GuardarCopiaSemanaPasada(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
               // db.EliminarReferencia(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
                //guardar una copia de la semana lineabase en las tablas temporales
                Consultas.GuardarCopiaSemanaLineaBase(Convert.ToInt32(CmbLineaBase.SelectedValue));
                //eliminar las referencias por proyectos
                db.EliminarReferencia(Cmbproyectos.SelectedValue);

                AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "iiiiiii", " OcultarParametros();", true);
                AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "ttttt", " MostrarReporte();", true);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", "open      ('WebDetalleInforme.aspx','NewWindow','top=0,left=0,width=1400,height=800,status=yes,resizable=yes,scrollbars=yes');", true);
                AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "dfdsfdf", " OcultarParametros();", true);

                //añadir lista de parametros
                List<ReportParameter> list = new List<ReportParameter>();
                ReportParameter param = new ReportParameter("SemanaActual", CmbSemanaActual.SelectedItem.Text);
                ReportParameter param1 = new ReportParameter("SemanaPasada", CmbSemanaPasada.SelectedItem.Text);
                ReportParameter param2 = new ReportParameter("LineaBase", CmbLineaBase.SelectedItem.Text);
                ReportParameter Proyecto = new ReportParameter("Proyecto", Cmbproyectos.SelectedItem.Text);

                list.Add(param);
                list.Add(param1);
                list.Add(param2);
                list.Add(Proyecto);

                //mostrar boton comparar
                BtnComparar.Visible = true;
                BtnCompararLineaBase.Visible = true;
                LinkButton1.Visible = true;
                //refrescar el reporte
                this.ReportViewer1.LocalReport.SetParameters(list);
                this.ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex) {

                throw ex;
            }
        }

        protected void BtnComparar_Click(object sender, EventArgs e)
        {
            //sino se ha escogido nada del combox enviar mensaje de alerta
            if (CmbSemanaActual.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Actual');", true);
                return;
            }
            //sino se ha escogido nada del combox enviar mensaje de alerta
            if (CmbSemanaPasada.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Pasada');", true);
                return;
            }

            //sino se ha escogido nada del combox enviar mensaje de alerta
            if (CmbLineaBase.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Tienes, Una Linea Base, Por Favor Entra A la Parametrización del Informe y Escoge Una Fecha Como Linea Base');", true);
                return;
            }
            System.Threading.Thread.Sleep(500);
            //guardar session de la semana actual del informe
            Session["SemanaActualInforme"] = CmbSemanaActual.SelectedValue;
            //guardar session de la semana pasada del informe
            Session["SemanaPasadaInforme"] = CmbSemanaPasada.SelectedValue;
            //guardar session de la semana line base del informe
            Session["SemanaLineaBaseInforme"] = CmbLineaBase.SelectedValue;
            //guardar session de el proyecto del informe
            Session["ProyectoInforme"] = Cmbproyectos.SelectedValue;

          
            DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            //vaciar las tablas temporales
            db.VaciarTablasTemporalesSemanas();

          
            //guardar una copia de la semana actual
            Consultas.GuardarCopiaSemanaActual(Convert.ToInt32(CmbSemanaActual.SelectedValue));
            // db.EliminarReferencia(Convert.ToInt32(CmbSemanaActual.SelectedValue));
            //guardar una copia de la semana pasada
            Consultas.GuardarCopiaSemanaPasada(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
            // db.EliminarReferencia(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
            //guardar una copia de la semana linea  base
            Consultas.GuardarCopiaSemanaLineaBase(Convert.ToInt32(CmbLineaBase.SelectedValue));
            //eliminar referncias
            db.EliminarReferencia(Cmbproyectos.SelectedValue);

            //abrir comparaciones en una nueva pestaña
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", "open('WebComparaciones.aspx','NewWindow','top=0,left=0,width=800,height=600,status=yes,resizable=yes,scrollbars=yes');", true);
            //ocultar los parametros
            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "ppppp", " OcultarParametros();", true);
         

        }
        protected void BtnCompararLineaBase_Click(object sender, EventArgs e)
        {
            if (CmbSemanaActual.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Actual');", true);
                return;
            }
            if (CmbSemanaPasada.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Pasada');", true);
                return;
            }

            if (CmbLineaBase.SelectedIndex == -1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Tienes, Una Linea Base, Por Favor Entra A la Parametrización del Informe y Escoge Una Fecha Como Linea Base');", true);
                return;
            }

            Session["SemanaActualInforme"] = CmbSemanaActual.SelectedValue;
            Session["SemanaPasadaInforme"] = CmbSemanaPasada.SelectedValue;
            Session["SemanaLineaBaseInforme"] = CmbLineaBase.SelectedValue;
            Session["ProyectoInforme"] = Cmbproyectos.SelectedValue;

            DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            db.VaciarTablasTemporalesSemanas();



            Consultas.GuardarCopiaSemanaActual(Convert.ToInt32(CmbSemanaActual.SelectedValue));
            // db.EliminarReferencia(Convert.ToInt32(CmbSemanaActual.SelectedValue));
            Consultas.GuardarCopiaSemanaPasada(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
            // db.EliminarReferencia(Convert.ToInt32(CmbSemanaPasada.SelectedValue));
            Consultas.GuardarCopiaSemanaLineaBase(Convert.ToInt32(CmbLineaBase.SelectedValue));
            db.EliminarReferencia(Cmbproyectos.SelectedValue);


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", "open('WebComparacionesLineaBase.aspx','NewWindow','top=0,left=0,width=800,height=600,status=yes,resizable=yes,scrollbars=yes');", true);
            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "dfdsfdf", " OcultarParametros();", true);
           
        }

        protected void BtnAtras_Click(object sender, EventArgs e)
        {

            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "asas", " MostrarParametros();", true);
            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "kkkkkk", " OcultarReporte();", true);

            BtnComparar.Visible = false;
            BtnCompararLineaBase.Visible = false;
            LinkButton1.Visible = true;
            BtnEjecutar.Visible = true;

        }

      
        //click de exportar todo a excel
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
           

                if (CmbSemanaActual.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Actual');", true);
                    return;
                }
                if (CmbSemanaPasada.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Pasada');", true);
                    return;
                }

                if (CmbLineaBase.SelectedIndex == -1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Tienes, Una Linea Base, Por Favor Entra A la Parametrización del Informe y Escoge               Una Fecha Como Linea Base');", true);
                    return;
                }
                System.Threading.Thread.Sleep(500);
               
                //Exportar todo a excel semana actual, pasada, lineabase, lineasagregadas,lineasretiradas
                using (XLWorkbook wb = new XLWorkbook())
                {

                    wb.AddWorksheet(ArchivoCostosSemanaActual(), "SEMANA ACTUAL");
                    wb.AddWorksheet(Ordenes(), "ORDENES");
                    wb.AddWorksheet(CostoEntrado(), "COSTO_ENTRADO");
                    wb.AddWorksheet(ArchivoCostosSemanaPasada(), "SEMANA PASADA");
                    wb.AddWorksheet(ArchivoCostosSemanaLineaBase(), "SEMANA LINEABASE");
                    wb.AddWorksheet(DatosCopiar(), "COMPARACIONES");
                    wb.AddWorksheet(DatosSemanaActualLineasAgregadas(), "LINEAS AGREGADAS SEM ACTUAL");
                    wb.AddWorksheet(DatosSemanaActualLineasRetiradas(), "LINEAS RETIRADAS SEM ACTUAL");
                    wb.AddWorksheet(DatosSemanaLineaBaseLineasAgregadas(), "LINEAS AGREGADAS SEM LINEABASE");
                    wb.AddWorksheet(DatosSemanaLineaBaseLineasRetiradas(), "LINEAS RETIRADAS SEM LINEABASE");

                    //wb.Worksheet(1).Column("Variacion").;  ("A4").Value = "Decimal";

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=Fechas comparadas"+Cmbproyectos.SelectedItem.Text+".xlsx");



                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.Seek(0, SeekOrigin.Begin); // Seem to have to manually rewind stream before applying it to the 
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }

            }
            catch (Exception ex) {

                throw ex;
            }
        }



        //datatable semaana actual
        public DataTable ArchivoCostosSemanaActual()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(CostosPptoProg.referencia1,0,4))  and insutipo not in(select insutipo from ParametrizacionGrupos where Proyecto=substring(CostosPptoProg.referencia1,0,4)) and IdFecha='" + CmbSemanaActual.SelectedValue + "'";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.CommandTimeout = 900000;
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

        //datatable semana pasada
        public DataTable ArchivoCostosSemanaPasada()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(CostosPptoProg.referencia1,0,4))  and insutipo not in(select insutipo from ParametrizacionGrupos where Proyecto=substring(CostosPptoProg.referencia1,0,4)) and IdFecha='" + CmbSemanaPasada.SelectedValue + "'";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.CommandTimeout = 900000;
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }
        //datatable semanalineabase
        public DataTable ArchivoCostosSemanaLineaBase()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(CostosPptoProg.referencia1,0,4))  and insutipo not in(select insutipo from ParametrizacionGrupos where Proyecto=substring(CostosPptoProg.referencia1,0,4)) and IdFecha='" + CmbLineaBase.SelectedValue + "'";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.CommandTimeout = 900000;
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

        //datatable ordenes
        public DataTable Ordenes()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "select Id, Referencia1, Presupuesto, Cod_Unit, Unitario, Cod_Insumo, Insumo, Und, Comp, Ent, PorEnt, Fecha, Orden, Tipo, Cod_Prov, Proveedor, VlrUnita, CostEnt,     Usuario, IdFecha from ordenes WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(referencia1,0,4)) and idfecha='" + CmbSemanaActual.SelectedValue + "'";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                cmd.CommandTimeout = 900000;
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }
        //datatable CostoEntrado
        public DataTable CostoEntrado()
        {
            
                string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
                string query = "select Id, referencia1, nombppto, fecha, orden, Nliqu, codterc, nombre, cap, nombrecap, apu, nombapu, codigo, descripcion, unidad, cantent, vlrunitentrado, costoentrado, usuario, IdFecha from [dbo].[CostoEntrado] WHERE  SUBSTRING(referencia1,0,7) IN(SELECT CodigoObraInmueble FROM ParametrizacionIncluida WHERE Estado=1) and referencia1 NOT IN (SELECT referencia FROM Referencias where SUBSTRING(referencia,0,4) LIKE substring(referencia1,0,4)) and idfecha='" + CmbSemanaActual.SelectedValue + "'";

                using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
                using (SqlCommand cmd = new SqlCommand(query, sqlConn))
                {
                    cmd.CommandTimeout = 900000;
                    sqlConn.Open();
                    DataTable dt = new DataTable();
                    dt.Load(cmd.ExecuteReader());
                    return dt;
                }
            
            
        }

       //Datatable que coge el datasource comparo y ordeno por referencia
        public DataTable DatosCopiar() {

            DataTable dt5 = ((DataView)this.CargarGrilla.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv = dt5.DefaultView;
            dv.Sort = "referencia1 desc";
            DataTable sortedDT = dv.ToTable();
            CompararDatatable(sortedDT);

            return sortedDT;
        }
        //Datos de la semana de lineas agregadas
        public DataTable DatosSemanaActualLineasAgregadas()
        {

            DataTable dt5 = ((DataView)this.LineasAgregadas.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv = dt5.DefaultView;


            return dv.ToTable();
        }
     
        //Datos de la semana de lineas retiradas
        public DataTable DatosSemanaActualLineasRetiradas()
        {

            DataTable dt5 = ((DataView)this.LineasRetiradas.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv = dt5.DefaultView;


            return dv.ToTable();
        }
       
        //Datos de la semana de lineas base lineas retiradas
        public DataTable DatosSemanaLineaBaseLineasRetiradas()
        {

            DataTable dt5 = ((DataView)this.LineasRetiradasLineaBase.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv = dt5.DefaultView;


            return dv.ToTable();
        }

        //Datos de la semana de lineas base lineas agregadas
        public DataTable DatosSemanaLineaBaseLineasAgregadas()
        {

            DataTable dt5 = ((DataView)this.LineasAgregadasLineaBase.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv = dt5.DefaultView;


            return dv.ToTable();
        }

        //saca la variacion de los valores
        public void Encontrar()
        {

            decimal sum = 0;

            VaciarData();


            DataView dv = (DataView)CargarGrilla.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();


            DataTable dt5 = ((DataView)this.CargarGrilla.Select(DataSourceSelectArguments.Empty)).ToTable(); // your data table
            DataView dv2 = dt5.DefaultView;
            dv2.Sort = "referencia1 desc";
            DataTable sortedDT = dv2.ToTable();
            CompararDatatable(sortedDT);


            DeleteDuplicateFromDataTable(dt, "insutipo");


            sum += Convert.ToDecimal((from row in sortedDT.AsEnumerable()
                                      select Convert.ToDecimal(row.Field<string>("Variacion"))).Sum());

            Lista.Add("Total:" + sum.ToString());
            Inicializar();



            foreach (DataRow row2 in dt.Rows)
            {

                string ac = row2["insutipo"].ToString().Trim();



                decimal valor = ((from row in sortedDT.AsEnumerable()
                                  where row.Field<string>("insutipo") == ac
                                  select Convert.ToDecimal(row.Field<string>("Variacion"))).Sum());

                string numero = String.Format("{0:C2}", valor);
                Lista.Add(
                 ac + ":" + (from row in sortedDT.AsEnumerable()
                             where row.Field<string>("insutipo") == ac
                             select Convert.ToDecimal(row.Field<string>("Variacion"))).Sum());


                Llenar(ac, valor);




            }

            AsignarData();


      


        }

        //elimina lo duplicado de un datatable
        protected DataTable DeleteDuplicateFromDataTable(DataTable dtDuplicate, string columnName)
        {

            try
            {
                Hashtable hashT = new Hashtable();
                ArrayList arrDuplicate = new ArrayList();

                foreach (DataRow row in dtDuplicate.Rows)
                {
                    if (hashT.Contains(row[columnName]))
                        arrDuplicate.Add(row);

                    else
                        hashT.Add(row[columnName], string.Empty);

                }
                foreach (DataRow row in arrDuplicate)

                    dtDuplicate.Rows.Remove(row);

                return dtDuplicate;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //resta la variacion
        public void CompararDatatable(DataTable tbl1)
        {
            /* if (tbl1.Rows.Count != tbl2.Rows.Count || tbl1.Columns.Count != tbl2.Columns.Count)
                 return false;
             */
            try
            {
                tbl1.Columns.Add(new DataColumn("Variacion", Type.GetType("System.String")));
                for (int i = 0; i < tbl1.Rows.Count; i++)
                {
                    int d = i + 1;
                    for (int c = 0; c < tbl1.Columns.Count; c++)
                    {


                        if (espar(i))
                        {

                            if (tbl1.Rows[i]["vlrproy"] != tbl1.Rows[d]["vlrproy"])
                            {

                                tbl1.Rows[i]["Variacion"] = (Convert.ToDecimal(tbl1.Rows[i][40]) - Convert.ToDecimal(tbl1.Rows[d][40])).ToString();
                                //tbl1.Rows[i+1]["Variacion"] = ((Convert.ToDecimal(tbl1.Rows[i][40]) - Convert.ToDecimal(tbl1.Rows[d][40]))* -1).ToString();

                            }
                        }
                        else
                        {

                        }
                    }

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        //verifica si un  numero es par
        public bool espar(int numero)
        {

            if ((numero % 2) == 0)
            {
                return true;
            }
            else
            {
                return false;
            }


        }

        //agrega una columna variacion a el datatable
        public void Inicializar()
        {
            dtVariacion = new DataTable();
            dtVariacion.Columns.AddRange(new DataColumn[2] { new DataColumn("Grupo", typeof(string)), new DataColumn("Variacion", typeof(decimal)) });

        }
        //llena la data de acuerdo a un grupo
        public void Llenar(string Grupo, decimal Variacion)
        {
            dtVariacion.Rows.Add(Grupo, Variacion);
        }
        //vacia la data
        public void VaciarData()
        {
            Inicializar();
            dtVariacion.Clear();
           
        }
        public void AsignarData(){}
        DataTable datacompa;
        //metodo para saber las fechas obras del pryecto
        public DataTable InformeFechasObras()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(sConnectionString);
            datacompa = new DataTable();
            string strMsg = "";
            try
            {

                conn.Open();
                SqlCommand cmdProc = new SqlCommand("FechasObra", conn);

                cmdProc.CommandType = CommandType.StoredProcedure;
                cmdProc.Parameters.AddWithValue("@Proyecto", Cmbproyectos.SelectedValue);
                cmdProc.ExecuteNonQuery();
                strMsg = "Saved successfully.";

                datacompa.Load(cmdProc.ExecuteReader());
            }
            catch (Exception ex) { 
             
             
            }

            return datacompa;
        }
        //metodo para sacar el total del proyecto
        public DataTable InformeTotalProyecto()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM TotalProyecto";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }
       



    }

}