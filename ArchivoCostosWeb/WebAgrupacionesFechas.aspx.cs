using ArchivoCostosWeb.Data;
using System;
using System.Collections.Generic;
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

namespace ArchivoCostosWeb
{
    public partial class WebAgrupacionesFechas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                gvProyectos.DataSource = GetData("SELECT DISTINCT(PROYECTO),0 as ID FROM Fechas");
                gvProyectos.DataBind();
            }

        }

        private static DataTable GetData(string query)
        {
            // string constr = ConfigurationManager.ConnectionStrings["PruebaTreeviewEntities"].ConnectionString;
            using (SqlConnection con = new SqlConnection("Data Source=SERVIDOR2SP;Initial Catalog=ArchivoCostos;User ID=sa;Password=Qwer1234"))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void Show_Hide_OrdersGrid(object sender, EventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {
                row.FindControl("pnlOrders").Visible = true;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/images/minus.GIF";
                string customerId = gvProyectos.DataKeys[row.RowIndex].Value.ToString();
                GridView gvMeses = row.FindControl("gvMeses") as GridView;
                Session["ProyectoAgrupacionesFechas"] = customerId;
                BindOrders(customerId, gvMeses);
                
            }
            else
            {
                row.FindControl("pnlOrders").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/images/plus.GIF";
            }
        }

        private void BindOrders(string Proyecto, GridView gvMeses)
        {
            gvMeses.ToolTip = Proyecto;
            gvMeses.DataSource = GetData(string.Format(" SELECT DISTINCT(PROYECTO),Mes,Meses.Id  FROM Fechas INNER JOIN Meses on Meses.[Id]=MONTH(Fecha) where Proyecto='{0}' order by Meses.Id", Proyecto));
            gvMeses.DataBind();
        }

        protected void OnOrdersGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvMeses = (sender as GridView);
            gvMeses.PageIndex = e.NewPageIndex;
            BindOrders(gvMeses.ToolTip, gvMeses);
        }
        GridView josue;
        protected void Show_Hide_ProductsGrid(object sender, EventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {



                row.FindControl("pnlProducts").Visible = true;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/images/minus.GIF";
                string Proyecto = Convert.ToString((row.NamingContainer as GridView).DataKeys[row.RowIndex].Values["Proyecto"]);
                string Mes = Convert.ToString((row.NamingContainer as GridView).DataKeys[row.RowIndex].Values["Mes"]);
                GridView gvSemanas = row.FindControl("gvSemanas") as GridView;
                BindProducts(Proyecto, Mes, gvSemanas);
                josue = new GridView();
                josue=gvSemanas;

            }
            else
            {
                row.FindControl("pnlProducts").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/images/plus.GIF";
            }
        }
        
        private void BindProducts(string Proyecto, string Mes, GridView gvSemanas)
        {

            gvSemanas.ToolTip = Proyecto + Mes;
            gvSemanas.DataSource = GetData(string.Format("SELECT DISTINCT(PROYECTO),Mes, 'Semana:'+CONVERT(VARCHAR,(((Day(Fecha) + (Datepart(dw, Dateadd(Month, Datediff(Month, 0, Fecha), 0)) - 1) -1) / 7 + 1)),0) as semana FROM Fechas INNER JOIN Meses on Meses.[Id]=MONTH(Fecha) where Proyecto='" + Proyecto + "'AND Mes='" + Mes + "'"));
            gvSemanas.DataBind();
           
        }

        protected void OnProductsGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvSemanas = (sender as GridView);
            gvSemanas.PageIndex = e.NewPageIndex;
            BindProducts(gvSemanas.ToolTip.ToString().Substring(0, 4), gvSemanas.ToolTip.ToString().Substring(4), gvSemanas);
        }

        protected void Show_Hide_SemanasGrid(object sender, EventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {



                row.FindControl("pnlSemanas").Visible = true;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/images/minus.GIF";
                string Proyecto = Convert.ToString((row.NamingContainer as GridView).DataKeys[row.RowIndex].Values["Proyecto"]);
                string Mes = Convert.ToString((row.NamingContainer as GridView).DataKeys[row.RowIndex].Values["Mes"]);
                string Semana = Convert.ToString((row.NamingContainer as GridView).DataKeys[row.RowIndex].Values["Semana"].ToString().Substring(7, 1));
                GridView gvFechas = row.FindControl("gvFechas") as GridView;
                BindFechas(Proyecto, Mes, Semana, gvFechas);

            }
            else
            {
                row.FindControl("pnlSemanas").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/images/plus.GIF";
            }
        }

        private void BindFechas(string Proyecto, string Mes, string Semana, GridView gvFechas)
        {

            gvFechas.ToolTip = Proyecto;
            gvFechas.DataSource = GetData(string.Format("SELECT DISTINCT(PROYECTO),Mes,Fechas.Id,Fechas.Tipo,((Day(Fecha) + (Datepart(dw, Dateadd(Month, Datediff(Month, 0, Fecha), 0)) - 1) -1) / 7 + 1) as semana, Fecha FROM Fechas INNER JOIN Meses on Meses.[Id]=MONTH(Fecha) where Proyecto='" + Proyecto + "'AND Mes='" + Mes + "'AND ((Day(Fecha) + (Datepart(dw, Dateadd(Month, Datediff(Month, 0, Fecha), 0)) - 1) -1) / 7 + 1)='" + Semana + "'"));
            gvFechas.DataBind();
        }

        protected void OnSemanasGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvFechas = (sender as GridView);
            gvFechas.PageIndex = e.NewPageIndex;
            BindFechas(gvFechas.ToolTip, "ENERO", "1", gvFechas);
        }










        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                ImageButton lnkME = (ImageButton)e.Row.FindControl("ImgEliminar");

                lnkME.OnClientClick = "return confirm('Estas Seguro(a) de Eliminar Esta Fecha, Recuerda Que Tiene Información de un Proyecto Almacenado?');";


                if (e.Row.RowType == DataControlRowType.DataRow)
                {



                    Label tot = (Label)e.Row.FindControl("lblTipo");

                    string total = tot.Text;


                    

                    if (total.Equals("True"))
                    {

                        //  Estado.Text = "Conectado";
                        e.Row.BackColor = Color.FromName("#0EC652");
                        //imagen.ImageUrl = "images/online.png";
                        tot.BackColor = Color.FromName("#0EC652");
                        tot.Text = "LB";
                      

                    }
                    else
                    {
                        //  Estado.Text = "Conectado";
                        // e.Row.BackColor = Color.FromName("#CC0000");
                        tot.Text = "PY";
                     
                    }
                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void ImgEliminar_Command(object sender, CommandEventArgs e)
        {
            Data.DataDataContext db = new Data.DataDataContext();
            db.CommandTimeout = 900000;

            try
            {

                if (e.CommandName != "Page")
                {





                    //get the gridview row where the command is raised

                    GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;


                    db.EliminarCostosFecha(int.Parse(e.CommandArgument.ToString()));

                   
                    gvProyectos.DataSource = GetData("SELECT DISTINCT(PROYECTO),0 as ID FROM Fechas");
                    gvProyectos.DataBind();
                    Response.Write("<script>window.alert('" + "Se Ha Eliminado Esta Fecha..!" + "');</script>");

                }
            }
            catch (Exception ex)
            {
                 db.InsertarError(ex.Message.ToString(),DateTime.Now);

            }
        }

        protected void ImgLB_Command(object sender, CommandEventArgs e)
        {
            Data.DataDataContext db = new Data.DataDataContext();
            db.CommandTimeout = 900000;


            try
            {

                if (e.CommandName != "Page")
                {




                    
                    //get the gridview row where the command is raised

                    GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
                    
               

                    db.ActualizarCostosFecha(int.Parse(e.CommandArgument.ToString()), selectedRow.Cells[4].Text.ToString());
                    Response.Write("<script>window.alert('" + "Se ha Cambiado el Estado de Esta Fecha a Linea base" + "');</script>");
                    gvProyectos.DataSource = GetData("SELECT DISTINCT(PROYECTO),0 as ID FROM Fechas");
                    gvProyectos.DataBind();
                   /* selectedRow.DataBind();*/

                }
            }
            catch (Exception ex)
            {
                 db.InsertarError(ex.Message.ToString(),DateTime.Now);

            }
        }



        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            try
            {

                if (e.CommandName != "Page")
                {

                    ////get the gridview row where the command is raised
                    GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
                    Session["Fecha"] = int.Parse(e.CommandArgument.ToString());
                    SqlDataSource1.DataBind();
                    /* Sin error */
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter htw = new HtmlTextWriter(sw);
                    Page page = new Page();
                    HtmlForm form = new HtmlForm();
                    DataTable dt2 = ((DataView)this.SqlDataSource1.Select(DataSourceSelectArguments.Empty)).ToTable();
                    //GridView1.EnableViewState = false;
                    GridView dg = new GridView();
                    dg.EnableViewState = false;
                    dg.DataSource = dt2;
                    dg.DataBind();
                    page.EnableEventValidation = false;
                    page.DesignerInitialize();
                    page.Controls.Add(form);
                    form.Controls.Add(dg);
                    page.RenderControl(htw);
                    Response.Clear();
                    Response.Buffer = true;
                    //Response.ContentType = "application/vnd.ms-excel";
                    Response.ContentType = "text/plain";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + selectedRow.Cells[1].Text.ToString() + "-" + selectedRow.Cells[4].Text.ToString() + ".xls");
                    Response.Charset = "UTF-8";
                    Response.ContentEncoding = Encoding.Default;
                    Response.Write(sb.ToString());
                    Response.End();


                }
            }
            catch (Exception ex)
            {
                Data.DataDataContext db = new DataDataContext();
                db.CommandTimeout = 900000;
                db.InsertarError(ex.Message.ToString(),DateTime.Now);

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
        
        protected void gvProyectos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            
        }
        string currentClass = "alternateDataRow";
        
        protected void gvMeses_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Data.DataDataContext db = new Data.DataDataContext();
            db.CommandTimeout = 900000;
            var item = db.ValidarFechas(Session["ProyectoAgrupacionesFechas"].ToString());

            foreach (ValidarFechasResult a in item)
            {

               

                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        string priority = (string)DataBinder.Eval(e.Row.DataItem, "Mes");
                        if (a.Mes == priority.ToString())
                        {
                            {
                                e.Row.CssClass = currentClass;
                              //  e.Row.Style.Add("background-color","Blue"); 
                               // e.Row.BackColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                 }
            } 

        }
     }
