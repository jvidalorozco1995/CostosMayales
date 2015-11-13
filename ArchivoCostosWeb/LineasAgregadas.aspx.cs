using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCostosPresupuestos
{
    public partial class LineasAgregadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               

                    TxtProyecto.Text = Session["Proyecto"].ToString();
                    LblActual.Text = Session["IdFechaActual"].ToString();
                    LblPasada.Text = Session["IdFechaPasada"].ToString();
                    TxtSemanaPasada.Text = Session["SemanaPasada"].ToString();
                    TxtSemanaActual.Text = Session["SemanaActual"].ToString();



                    if (String.IsNullOrEmpty(GridView2.SortExpression)) GridView2.Sort("referencia1", SortDirection.Ascending);
                    GridView2.DataBind();

              
                
             

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void BtnExportar_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "LINEAS AGREGADAS" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView2.GridLines = GridLines.Both;
            GridView2.HeaderStyle.Font.Bold = true;
            GridView2.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();   
        }

        protected void LineasAgregadasSQLDATASOURCE_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 300000;
        }
    }
}