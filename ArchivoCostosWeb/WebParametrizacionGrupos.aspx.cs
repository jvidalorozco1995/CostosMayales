using ArchivoCostosWeb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArchivoCostosWeb
{
    public partial class WebParametrizacionGrupos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //validar si el usuario esta logeado
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void CheckSeleccionar_CheckedChanged(object sender, EventArgs e)
        {
            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)GridView1.Rows[selRowIndex].FindControl("CheckSeleccionar");
        
            //revisar si esta chekeado el combox
           if (cb.Checked)
            {
               //si lo esta eliminamos la paramaetrizacion por grupos
                db.EliminarParametrizacionGrupos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[1].Text);

            }
            else
            {
               //sino insertamos la parametrizacion
                db.InsertarParametrizacionGrupos(Cmbproyectos.SelectedValue, GridView1.Rows[selRowIndex].Cells[1].Text);

            }
        }
        //cuando se crea la linea en la grilla
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

            Data.DataDataContext db = new DataDataContext();
            db.CommandTimeout = 900000;
            string existe = "";
            string clasificacion = "";
            //recorrer las lineas de la grilla
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chek = ((CheckBox)GridView1.Rows[i].FindControl("CheckSeleccionar"));
                //DropDownList cmbparametro = ((DropDownList)GridView1.Rows[i].FindControl("CmbClasificacion"));

                //si existe la parametricacion
                db.ExisteParametrizacionGrupos(Cmbproyectos.SelectedValue, GridView1.Rows[i].Cells[1].Text, ref existe);
                if (existe != "0")
                {

                    //chekeamos
                    chek.Checked = false;

                }
                else
                {
                    //no lo chekeamos
                    chek.Checked = true;
                   

                }


            }
        }

        protected void Cmbproyectos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}