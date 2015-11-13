using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
namespace ArchivoCostosWeb
{
    public partial class WebExportarExcelFechas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {

                //if (CmbSemanaActual.SelectedIndex == -1)
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Actual');", true);
                //    return;
                //}
                //if (CmbSemanaPasada.SelectedIndex == -1)
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Escoge, Una Semana Pasada');", true);
                //    return;
                //}

                //if (CmbLineaBase.SelectedIndex == -1)
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No Tienes, Una Linea Base, Por Favor Entra A la Parametrización del Informe y Escoge                Una Fecha Como Linea Base');", true);
                //    return;
                //}
              
                using (XLWorkbook wb = new XLWorkbook())
                {

                    wb.AddWorksheet(ArchivoCostosSemanaActual(), "Semana Actual");
                    wb.AddWorksheet(ArchivoCostosSemanaPasada(), "Semana Pasada");
                    wb.AddWorksheet(ArchivoCostosSemanaLineaBase(), "Semana LineaBase");

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=GridView.xlsx");
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }

        public DataTable ArchivoCostosSemanaActual()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE idfecha="+ Session["FechaActualExportalExcelFechas"].ToString()+"";
            //string query = "SELECT * FROM CostosPptoProg WHERE idfecha=56";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

        public DataTable ArchivoCostosSemanaPasada()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE idfecha="+ Session["FechaPasadaExportalExcelFechas"].ToString() + "";

            using (SqlConnection sqlConn = new SqlConnection(sConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, sqlConn))
            {
                sqlConn.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                return dt;
            }
        }

        public DataTable ArchivoCostosSemanaLineaBase()
        {
            string sConnectionString = ConfigurationManager.ConnectionStrings["ArchivoCostosConnectionString"].ConnectionString;
            string query = "SELECT * FROM CostosPptoProg WHERE idfecha="+Session["FechaLineaBaseExportalExcelFechas"].ToString()+ "";

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