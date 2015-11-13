using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ArchivoCostosWeb.Data;
using AjaxControlToolkit;

namespace ArchivoCostosWeb
{
    public partial class WebPopop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //tenemos el usuario validamos si es valido
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                try
                {
                    TxtPresupuesto.Text = Session["Presupuest"].ToString();
                    Label1.Text = Session["Referencia"].ToString();
                }
                catch (Exception ex) { 
                
                
                }
            }

            this.RegisterPostBackControl();
        }
        //cuando cambia el checkbox
        protected void CheckSeleccionar_CheckedChanged(object sender, EventArgs e)
        {

            
        }
        //cargar grilla capitulos
        protected void GridCapitulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;

            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Find the checkbox control in header and add an attribute
                ((CheckBox)e.Row.FindControl("cbSelectAllCapitulos")).Attributes.Add("onclick", "javascript:SelectAll('" +
                        ((CheckBox)e.Row.FindControl("cbSelectAllCapitulos")).ClientID + "')");
            
            
            }
            int? existe = 0;
            string clasificacion = "";
            for (int i = 0; i < GridCapitulos.Rows.Count; i++)
            {
                /*Check capitulos*/
                CheckBox chek = ((CheckBox)GridCapitulos.Rows[i].FindControl("CheckCapitulos"));
                //validar si existe parametrizacion
                db.ExisteParametrizacion(GridCapitulos.Rows[i].Cells[3].Text+GridCapitulos.Rows[i].Cells[1].Text, ref existe,ref clasificacion);
                if (existe != 0)
                {
                    //ponemos el chek en false
                    chek.Checked = false;
                  
                }
                else {
                    //ponemos el chek en true
                    chek.Checked = true;
                }

            }
          
        }

      
        /*link de capitulos*/
        protected void LinkCapitulo_Click(object sender, EventArgs e)
        {
             try
            {
                    GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
                    LinkButton LinkPresupuesto = ((LinkButton)GridCapitulos.Rows[selectedRow.RowIndex].FindControl("LinkCapitulo"));
                    CheckBox chek = ((CheckBox)GridCapitulos.Rows[selectedRow.RowIndex].FindControl("CheckCapitulos"));
                    Session["Capitulo"] = GridCapitulos.Rows[selectedRow.RowIndex].Cells[1].Text;
                    if (chek.Checked)
                    {
                        //registro del javascript para mostrar los unitarios
                        AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "carga", "ShowUnitarios();", true);

                    }
                    else
                    {
                        //sino esta seleccionado entonces alerta para seleccionar al menos un capitulo
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Selecciona un capitulo al menos');", true);

                    }
            }
            catch (Exception ex)
            {
                throw ex;

            }      
        }

        //grid unitarios
        protected void GridUnitarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int? existe = 0;
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Find the checkbox control in header and add an attribute
                ((CheckBox)e.Row.FindControl("cbSelectAllUnitarios")).Attributes.Add("onclick", "javascript:SelectAllUnitarios('" +
                        ((CheckBox)e.Row.FindControl("cbSelectAllUnitarios")).ClientID + "')");


            }

            
            for (int i = 0; i < GridUnitarios.Rows.Count; i++)
            {
                CheckBox chek = ((CheckBox)GridUnitarios.Rows[i].FindControl("CheckUnitarios"));
    
                string a = Session["Capitulo"].ToString();
                string clasificacion = "";
                db.ExisteParametrizacion(GridUnitarios.Rows[i].Cells[3].Text+a+GridUnitarios.Rows[i].Cells[1].Text, ref existe,ref clasificacion);
                if (existe != 0)
                {

                    chek.Checked = false;
                    
                }
                else {

                    chek.Checked = true;
                }


            }
          
        }

        protected void ScriptManager1_AsyncPostBackError(object sender,
           AsyncPostBackErrorEventArgs e)
        {
            ToolkitScriptManager1.AsyncPostBackErrorMessage =
                "Oh, Disculpame me he equivocado vuelve a intentar: " +
                e.Exception.Message;
        }
        /*registramos el posback de los controles que seleccionan los capitulos, y unoitarios*/
        private void RegisterPostBackControl()
        {
            foreach (GridViewRow row in GridCapitulos.Rows)
            {
           
                CheckBox cb = row.FindControl("CheckCapitulos") as CheckBox;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(cb);

            }

            foreach (GridViewRow row in GridUnitarios.Rows)
            {

                CheckBox cb = row.FindControl("CheckUnitarios") as CheckBox;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(cb);

            }
            foreach (GridViewRow row in GridInsumos.Rows)
            {

                CheckBox cb = row.FindControl("CheckInsumos") as CheckBox;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(cb);

            }
        }

    
        protected void LinkUnitario_Click(object sender, EventArgs e)
        {
            try
            {
                UpdatePanel1.Update();
                UpdatePanel2.Update();
                UpdatePanel3.Update();
                GridViewRow selectedRow = ((Control)sender).Parent.NamingContainer as GridViewRow;
                int ki = selectedRow.RowIndex;
                LinkButton LinkUnitario = ((LinkButton)GridUnitarios.Rows[selectedRow.RowIndex].FindControl("LinkUnitario"));
                CheckBox chek = ((CheckBox)GridUnitarios.Rows[selectedRow.RowIndex].FindControl("CheckUnitarios"));
                //Session["asas"] = LinkUnitario.Text;
                Session["Unitario"] = GridUnitarios.Rows[selectedRow.RowIndex].Cells[1].Text;
                Session["NombreUnitario"] = LinkUnitario.Text;
                //Session["Capitulo"]

                if (chek.Checked)
                {

                    AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "carga", "ShowInsumos();", true);

                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Selecciona un unitario al menos');", true);

                }

            }
            catch (Exception ex) {
                throw ex;
            }
        }

        protected void BtnAtrasCapitulos_Click(object sender, ImageClickEventArgs e)
        {
            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "carga", "ShowAtrasCapitulos();", true);
        }

        protected void GridInsumos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int? existe = 0;
            string clasificacion = "";
            for (int i = 0; i < GridInsumos.Rows.Count; i++)
            {
                CheckBox chek = ((CheckBox)GridInsumos.Rows[i].FindControl("CheckInsumos"));
                //DropDownList cmbparametro = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));


                db.ExisteParametrizacion(Label1.Text+Session["Capitulo"].ToString()+Session["Unitario"].ToString()+GridInsumos.Rows[i].Cells[1].Text, ref existe, ref clasificacion);
                if (existe != 0)
                {
                    //seleccionamos en falso
                    chek.Checked = false;

                }
                else {
                    //seleccionamos en true
                    chek.Checked = true;
                
                }


            }
        }
        //grid de insumos 
        protected void GridInsumos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Find the checkbox control in header and add an attribute
                ((CheckBox)e.Row.FindControl("cbSelectAllInsumos")).Attributes.Add("onclick", "javascript:SelectAllInsumos('" +
                        ((CheckBox)e.Row.FindControl("cbSelectAllInsumos")).ClientID + "')");


            }

            int? existe = 0;
             string clasificacion = "";
            for (int i = 0; i < GridInsumos.Rows.Count; i++)
            {
                CheckBox chek = ((CheckBox)GridInsumos.Rows[i].FindControl("CheckInsumos"));
                //DropDownList cmbparametro = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));

                //comprobar si la parametrizacion existe
                db.ExisteParametrizacion(Label1.Text+Session["Capitulo"].ToString()+Session["Unitario"].ToString()+GridInsumos.Rows[i].Cells[1].Text,ref existe,ref clasificacion);
                if (existe != 0)
                {
                    //ponemos el check en false
                    chek.Checked = false;

                }
                else {
                    //ponemos el check en true
                    chek.Checked = true;
                }


            }
            
        }

        protected void CheckInsumos_CheckedChanged(object sender, EventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)GridInsumos.Rows[selRowIndex].FindControl("CheckInsumos");
          
            if (cb.Checked)
            {
                //eliminar insumos a excluir 
                db.EliminarInsumoExcluir(Label1.Text, Session["Capitulo"].ToString(), Session["Unitario"].ToString(), GridInsumos.Rows[selRowIndex].Cells[1].Text);
                db.EliminarReferencias(Label1.Text + Session["Capitulo"].ToString() + Session["Unitario"].ToString() + GridInsumos.Rows[selRowIndex].Cells[1].Text);
             
            }
            else
            {
                //insertar insumos a excluir 
                db.InsertarInsumosExcluir(Label1.Text, TxtPresupuesto.Text, Session["Capitulo"].ToString(), GridInsumos.Rows[selRowIndex].Cells[4].Text, Session["Unitario"].ToString(), Session["NombreUnitario"].ToString(), GridInsumos.Rows[selRowIndex].Cells[1].Text, GridInsumos.Rows[selRowIndex].Cells[2].Text);
                db.InsertarTodosInsumos(Session["Proyecto"].ToString(), Label1.Text + Session["Capitulo"].ToString() + Session["Unitario"].ToString() + GridInsumos.Rows[selRowIndex].Cells[1].Text);
        
            }
        
        }

        protected void BtnCerrar_Click(object sender, EventArgs e)
        {

            /*metodo para remover las sessiones*/
            Session.Remove("Presupuest");
            Session.Remove("Referencia");
            Session.Remove("Capitulo");
            Session.Remove("Unitario");
            
       
        }

        protected void BtnAtrasUnitarios_Click(object sender, ImageClickEventArgs e)
        {
            AjaxControlToolkit.ToolkitScriptManager.RegisterStartupScript(this, typeof(Page), "carga", " ShowAtrasUnitarios();", true);
           
        }

        protected void CheckUnitarios_CheckedChanged(object sender, EventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)GridUnitarios.Rows[selRowIndex].FindControl("CheckUnitarios");
            LinkButton LinkUnitario = ((LinkButton)GridUnitarios.Rows[selRowIndex].FindControl("LinkUnitario"));

            if (cb.Checked)
            {
                //eliminar referencias a excluir 
                db.EliminarReferencias(GridUnitarios.Rows[selRowIndex].Cells[3].Text + Session["Capitulo"].ToString() + GridUnitarios.Rows[selRowIndex].Cells[1].Text);
                db.EliminarUnitarioExcluir(GridUnitarios.Rows[selRowIndex].Cells[3].Text, Session["Capitulo"].ToString(), GridUnitarios.Rows[selRowIndex].Cells[1].Text);
            }
            else
            {
                //insertar unitarios a excluir 
                db.InsertarUnitarioExcluir(Label1.Text, TxtPresupuesto.Text, Session["Capitulo"].ToString(), GridUnitarios.Rows[selRowIndex].Cells[4].Text, GridUnitarios.Rows[selRowIndex].Cells[1].Text, LinkUnitario.Text);
                db.InsertarTodosLosUnitarios(Session["Proyecto"].ToString(), GridUnitarios.Rows[selRowIndex].Cells[3].Text + Session["Capitulo"].ToString() + GridUnitarios.Rows[selRowIndex].Cells[1].Text);
               
            }
    
        }

        protected void CheckCapitulos_CheckedChanged(object sender, EventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)GridCapitulos.Rows[selRowIndex].FindControl("CheckCapitulos");
            LinkButton LinkCapitulos = ((LinkButton)GridCapitulos.Rows[selRowIndex].FindControl("LinkCapitulo"));

            if (cb.Checked)
            {
                //eliminar las referencias de los capitulos
                db.EliminarReferencias(GridCapitulos.Rows[selRowIndex].Cells[3].Text + GridCapitulos.Rows[selRowIndex].Cells[1].Text);
                db.EliminarCapituloExcluir(GridCapitulos.Rows[selRowIndex].Cells[3].Text, GridCapitulos.Rows[selRowIndex].Cells[1].Text);
    
            }
            else
            {
                //insertar la parametrizacion de los capitulos
                db.InsertarCapitulosExcluir(GridCapitulos.Rows[selRowIndex].Cells[3].Text, TxtPresupuesto.Text, GridCapitulos.Rows[selRowIndex].Cells[1].Text, LinkCapitulos.Text);
                db.InsertarTodosCapitulos(Session["Proyecto"].ToString(), GridCapitulos.Rows[selRowIndex].Cells[3].Text + GridCapitulos.Rows[selRowIndex].Cells[1].Text);
             
            }
     
        }

      


     
      

        }

        
     

        
    }
