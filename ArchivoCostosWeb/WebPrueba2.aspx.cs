using ClosedXML.Excel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebCostosPresupuestos
{
    public partial class WebPrueba2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
              

                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                try {
                /*GridView dt = Session["Grilla"] as GridView;
                // UpdateButton_Click(null, null);
                //Session["OUTPUTFILE"] = CmbProyectos.SelectedValue + "-" + getFechaActual();

                ////ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'file.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
                if (dt != null)
                {
                    

                    //GridView1.DataBind();
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter htw = new HtmlTextWriter(sw);

                    Page page = new Page();
                    HtmlForm form = new HtmlForm();


                    page.EnableEventValidation = false;
                    page.DesignerInitialize();
                    page.Controls.Add(form);

                    dt.EmptyDataText = "No hay registros de esta fecha";
                    form.Controls.Add(dt);
                    Session["Grilla"] = null;
                    page.RenderControl(htw);
                    //  System.Threading.Thread.Sleep(500);
                    Response.Clear();
                    Response.Buffer = true;
                    //Response.ContentType = "application/vnd.ms-excel";
                    Response.ContentType = "text/plain";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + Session["ProyectoGrilla"].ToString() + "-" + getFechaActual() + ".xls");
                    Response.Charset = "UTF-8";
                    Response.ContentEncoding = Encoding.Default;
                    Response.Write(sb.ToString());
                   
                    Response.Flush();
                    Response.End();
                   
                }*/

                           

                    

                }
                catch (Exception ex)
                {
                   LblError.Text = ex.Message.ToString();
                }
                
            } 
   

        }

    }
}
