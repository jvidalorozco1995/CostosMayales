using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArchivoCostosWeb
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebAgrupacionesFechas.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebComparaciones.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInforme.aspx");
        }

      
        protected void Control_de_Almacen_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebActualizar.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebParametrizacion.aspx");
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
          

            Response.Redirect("Login.aspx");
        }

    }
}