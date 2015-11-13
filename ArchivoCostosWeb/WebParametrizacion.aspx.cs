using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebCostosPresupuestos;

using ArchivoCostosWeb.Data;

namespace ArchivoCostosWeb
{
    public partial class WebParametrizacion : System.Web.UI.Page
    {
        CheckBox cb;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    //valida si la session es null
                    if (Session["Usuario"] == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                //recargar la grilla
                GridView1.DataBind();

            }
        }
        protected void GridView1_DataBinding(object sender, EventArgs e)
        {



        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int? existe = 0;
            string clasificacion = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                //checkbox seleccionado
                CheckBox chek = ((CheckBox)GridView1.Rows[i].FindControl("CheckSeleccionar"));

                //combo seleccionado
                DropDownList cmbparametro = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));

                //validar si existe la parametrizacion
                db.ExisteParametrizacion(GridView1.Rows[i].Cells[3].Text , ref existe,ref clasificacion);
                if (existe != 0)
                {


                    chek.Checked = false;
                    
                }
                else {
                    
                    chek.Checked = true;
                    try
                    {
                        cmbparametro.SelectedValue = clasificacion.ToString();
                    }
                    catch (Exception EX) { 
                    
                    } 
                
                }


            }


        }

        protected void CmbPresupuestos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            

        }

        public void OnConfirm(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
            }
        }
        /*cuando cambia el checbox*/
        protected void CheckSeleccionar_CheckedChanged(object sender, EventArgs e)
        {


            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            //check seleccionar
            CheckBox cb = (CheckBox)GridView1.Rows[selRowIndex].FindControl("CheckSeleccionar");
            //link que abre los capitulos unitarios de un presupuesto

            LinkButton Link2 = (LinkButton)GridView1.Rows[selRowIndex].FindControl("LinkButton5");
           
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "return OnConfirm();", true);
            //cb.Attributes.Add("onclick", "return confirm('Are you sure ?')");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

            if (cb.Checked)
            {
               //metodo para borrar el parametro
                db.BorraParametrosCapInsUni(GridView1.Rows[selRowIndex].Cells[3].Text);
                //metodo para borrar las referencias de la paremetrizacion
                db.EliminarReferencias(GridView1.Rows[selRowIndex].Cells[3].Text);
              
            }
            else
            {
                //metodo para borrar el parametro
                db.EliminarReferencias(GridView1.Rows[selRowIndex].Cells[3].Text);
                //metodo para borrar las referencias de la paremetrizacion
                db.InsertarReferencias(GridView1.Rows[selRowIndex].Cells[3].Text);
                
                //db.BorraParametrosCapInsUni(GridView1.Rows[selRowIndex].Cells[3].Text);
               // db.InsertarTodosCapitulos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());
               // db.InsertarTodosLosUnitarios(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());
               /// db.InsertarTodosInsumos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());

            }


             //borrar la parametrizacion por proyecto
            db.BorrarParametrizacion(Cmbproyectos.SelectedValue);
 



            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                //encontrar el boton en la grilla
                LinkButton Link = (LinkButton)GridView1.Rows[i].FindControl("LinkButton5");
                //selecciona para saber si el check esta seleccionado
                bool seleccionado = ((CheckBox)GridView1.Rows[i].FindControl("CheckSeleccionar")).Checked;
                if (seleccionado == true)
                {
                   //si lo esta inserto el estado 1
                    DropDownList dv = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));
                    db.InsertarParametrizacionIncluida(GridView1.Rows[i].Cells[1].Text.ToString(), Link.Text, GridView1.Rows[i].Cells[3].Text.ToString(), Convert.ToInt32(GridView1.Rows[i].Cells[4].Text), Convert.ToDecimal(GridView1.Rows[i].Cells[5].Text.Substring(1)), Convert.ToDecimal(GridView1.Rows[i].Cells[6].Text), Convert.ToInt32(dv.SelectedValue), 1);
    
                }
                else
                {
                    //sino lo esta inserto el estado 0
                    DropDownList dv = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));
                    db.InsertarParametrizacionExcluida(GridView1.Rows[i].Cells[1].Text.ToString(), Link.Text, GridView1.Rows[i].Cells[3].Text.ToString(), 0, 0, 0, Convert.ToInt32(dv.SelectedValue), 0);
                 

                }
               
            }

        }
        //si selecciono confirmo el cambio
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                const string DevConfirm = "if (!confirm('¿ Estas seguro(a) de continuar con este cambio ?')) return false;";
                cb = e.Row.FindControl("CheckSeleccionar") as CheckBox;
                cb.Attributes.Add("onclick", DevConfirm);

            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            try
            {

                    
                    GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
                    LinkButton LinkPresupuesto = ((LinkButton)GridView1.Rows[selectedRow.RowIndex].FindControl("LinkButton5"));
                    /*Sessiones*/
                    Session["Presupuest"] = LinkPresupuesto.Text;
                    Session["Referencia"] = GridView1.Rows[selectedRow.RowIndex].Cells[3].Text;
                    Session["Proyecto"] = Cmbproyectos.SelectedValue;
                    CheckBox chek = ((CheckBox)GridView1.Rows[selectedRow.RowIndex].FindControl("CheckSeleccionar"));

                    if (chek.Checked)
                    {   
                        Session["Incluir"] = "NoIncluir";
                        this.mp1.Show();

                    }
                    else
                    {
                        //sino se ha seleccionado el presupuesto envio una alerta
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Selecciona un Presupuesto');", true);

                    }
                
            }
            catch (Exception ex)
            {
                throw ex;

            }      
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Remove("Presupuest");
            Session.Remove("Referencia");
            Session.Remove("Capitulo");
            Session.Remove("Unitario");
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "CloseA();", true); 
        }
        /*Cada ves que cambia el combox borrar la parametrizacion y guardar la nueva*/
        protected void CmbClasificacion_SelectedIndexChanged(object sender, EventArgs e)
        {
             Data.DataDataContext db = new DataDataContext();
             db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((DropDownList)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)GridView1.Rows[selRowIndex].FindControl("CheckSeleccionar");
            LinkButton Link2 = (LinkButton)GridView1.Rows[selRowIndex].FindControl("LinkButton5");
            DropDownList cmb = (DropDownList)GridView1.Rows[selRowIndex].FindControl("CmbClasificacion");
            
            //sino se le ha seleccionado el presupuesto te manda a seleccionarlo
            if (cb.Checked==false)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Seleccione Primero el Presupuesto')", true);
                return;
            }
            if (cb.Checked)
            {
              
            }
            else
            {
                //Insertamos la parametrizacion del proyecto 
                db.InsertarTodosCapitulos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());
                db.InsertarTodosLosUnitarios(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());
                db.InsertarTodosInsumos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[3].Text.ToString());
            }


            //borramos la parametrizacion
            db.BorrarParametrizacion(Cmbproyectos.SelectedValue);
 


            //recorremos toda grilla
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                
                LinkButton Link = (LinkButton)GridView1.Rows[i].FindControl("LinkButton5");

                bool seleccionado = ((CheckBox)GridView1.Rows[i].FindControl("CheckSeleccionar")).Checked;
                if (seleccionado == true)
                {

                    DropDownList dv = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));
                     db.InsertarParametrizacionIncluida(GridView1.Rows[i].Cells[1].Text.ToString(), Link.Text, GridView1.Rows[i].Cells[3].Text.ToString(), Convert.ToInt32(GridView1.Rows[i].Cells[4].Text), Convert.ToDecimal(GridView1.Rows[i].Cells[5].Text.Substring(1)), Convert.ToDecimal(GridView1.Rows[i].Cells[6].Text), Convert.ToInt32(dv.SelectedValue), 1);

                }
                else
                {
                    DropDownList dv = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));
                    db.InsertarParametrizacionExcluida(GridView1.Rows[i].Cells[1].Text.ToString(), Link.Text, GridView1.Rows[i].Cells[3].Text.ToString(), 0, 0, 0, Convert.ToInt32(dv.SelectedValue), 0);
                  
                }
               
            }
        }
        //cuando cambia de proyecto
        protected void Cmbproyectos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Proyecto"] = Cmbproyectos.SelectedValue;
        }
        //para abrir la ventana de agrupaciones por fechas
        protected void LinkLineasBase_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebAgrupacionesFechas.aspx");
                
        }
        //para abrir los grupos
        protected void LinkGrupos_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebParametrizacionGrupos.aspx");
                
        }

      

        
       

        

    }
}

   

