using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArchivoCostosWeb
{
    public partial class WebDetalleInforme : System.Web.UI.Page
    {
        decimal totalcapitulo = 0;
        decimal totalinicialcapitulo = 0;
        decimal totalincidenciacapitulo = 0;

        decimal totalunitarios= 0;
        decimal totalinicialunitarios= 0;
        decimal totalincidenciaunitarios = 0;

        decimal totalinsumos = 0;
        decimal totalinicialinsumos = 0;
        decimal totalincidenciainsumos = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                /*Si la session es igual a null*/
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        /*Exporta el archivo a excel*/
        protected void BrnExportar_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=Proy_x.xls");


            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);
            Label lbla = new Label();
            lbla.Text = "PRESUPUESTO: " + DropDownList1.SelectedItem.Text;
            lbla.ForeColor =Color.Red;
            lbla.Font.Name = "Calibri";
            lbla.Font.Size = 18;
            lbla.RenderControl(htmlWrite);
            Label lblcap = new Label();
            lblcap.Text = "CAPITULOS";
            lblcap.ForeColor = Color.Red;
            lblcap.Font.Name = "Calibri";
            lblcap.Font.Size = 14;
            Label lblblanco = new Label();
            lblblanco.Text = "";
            lblblanco.RenderControl(htmlWrite);
            htmlWrite.Write("</br>");
           // lblcap.RenderControl(htmlWrite);
            GridView1.RenderControl(htmlWrite);
            Label lblunit = new Label();
            lblunit.Text = "UNITARIOS";
            lblunit.ForeColor = Color.Red;
            lblunit.Font.Name = "Calibri";
            lblunit.Font.Size = 14;
            lblunit.RenderControl(htmlWrite);
            GridView2.RenderControl(htmlWrite);
            Label lblinsu = new Label();
            lblinsu.Text = "INSUMOS";
            lblinsu.ForeColor = Color.Red;
            lblinsu.Font.Name = "Calibri";
            lblinsu.Font.Size = 14;
            lblinsu.RenderControl(htmlWrite);
            GridView3.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());

            Response.End();
        }
        /*no borrar esto*/
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        /*Refrescar una grilla*/
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblqy = (Label)e.Row.FindControl("vlrproy");
                Label lblvalorinicial = (Label)e.Row.FindControl("vlrinicialcapitulo");
                Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lblsumaincidencia");

                decimal qty = decimal.Parse(lblqy.Text.Replace("$",""));
                decimal vlr = decimal.Parse(lblvalorinicial.Text.Replace("$", ""));
                decimal vlrsumainicidencia = decimal.Parse(lbltotalSumaIncidencia.Text.Replace("%",""));

                totalcapitulo = totalcapitulo + qty;
                totalinicialcapitulo = totalinicialcapitulo + vlr;
                totalincidenciacapitulo = totalincidenciacapitulo + vlrsumainicidencia;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalqty = (Label)e.Row.FindControl("lbltotalvlrproyectado");
                Label lblTotalinicial = (Label)e.Row.FindControl("lbltotalinicialcapitulo");
                Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lbltotalSumaIncidencia");

                lblTotalqty.Text = totalcapitulo.ToString("C");
                lblTotalinicial.Text = totalinicialcapitulo.ToString("C");
                lbltotalSumaIncidencia.Text = String.Format("{0:N2}", (totalincidenciacapitulo))+"%"; 
              
            }

        }
        /*Refrescar una grilla*/
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblqy = (Label)e.Row.FindControl("vlrproyunitarios");
                Label lblvalorinicial = (Label)e.Row.FindControl("vlrinicialunitarios");
                Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lblsumaincidenciaunitarios");

                decimal qty = decimal.Parse(lblqy.Text.Replace("$", ""));
                decimal vlr = decimal.Parse(lblvalorinicial.Text.Replace("$", ""));
                decimal vlrsumainicidenciaunitarios = decimal.Parse(lbltotalSumaIncidencia.Text.Replace("%", ""));

                totalunitarios = totalunitarios + qty;
                totalinicialunitarios = totalinicialunitarios + vlr;
                totalincidenciaunitarios = totalincidenciaunitarios + vlrsumainicidenciaunitarios;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalqty = (Label)e.Row.FindControl("lbltotalinicialunitarios");
               Label lblTotalinicial = (Label)e.Row.FindControl("lbltotalvlrproyectadounitarios");
               Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lbltotalSumaIncidenciaunitarios");

               lblTotalinicial.Text  = totalunitarios.ToString("C");
               lblTotalqty.Text = totalinicialunitarios.ToString("C");
               lbltotalSumaIncidencia.Text = String.Format("{0:N2}", (totalincidenciaunitarios)) + "%";
                
            }
        }
        /*Refrescar una grilla*/
        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblqy = (Label)e.Row.FindControl("vlrproyinsumos");
                Label lblvalorinicial = (Label)e.Row.FindControl("vlrinicialinsumos");
                Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lblsumaincidenciainsumos");

                decimal qty = decimal.Parse(lblqy.Text.Replace("$", ""));
                decimal vlr = decimal.Parse(lblvalorinicial.Text.Replace("$", ""));
                decimal vlrsumainicidenciainsumos = decimal.Parse(lbltotalSumaIncidencia.Text.Replace("%", ""));

                totalinsumos = totalinsumos + qty;
                totalinicialinsumos = totalinicialinsumos + vlr;
                totalincidenciainsumos = totalincidenciainsumos + vlrsumainicidenciainsumos;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblTotalqty = (Label)e.Row.FindControl("lbltotalvlrproyectadoinsumos");
                Label lblTotalinicial = (Label)e.Row.FindControl("lbltotalinicialinsumos");
                Label lbltotalSumaIncidencia = (Label)e.Row.FindControl("lbltotalSumaIncidenciainsumos");

                 lblTotalinicial.Text=   totalinicialinsumos.ToString("C");
                 lblTotalqty.Text = totalinsumos.ToString("C");
                lbltotalSumaIncidencia.Text = String.Format("{0:N2}", (totalincidenciainsumos)) + "%";
                

            }
        }
    }
}