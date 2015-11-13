using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ArchivoCostosWeb.Data;

namespace WebCostosPresupuestos
{
    public partial class Login : System.Web.UI.Page
    {
         int bandera;
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {


            try{
                //Consulta que actualiza los usuarios
                Consultas.ActualizarUsuarios();

                //Coge el usuario de la pagina
                string usuario = TxtUsuario.Text.ToUpper();
                //Coge la contraseña de la caja de texto
                string pass = txtpass.Text;

                //variable para guardar la cadena de conexion
                string sConnectionStringsql;
                sConnectionStringsql = ("Server=SERVIDOR2SP;Database= CONTROL_ALMACEN;User Id=sa;Password=Qwer1234;");
               //Aqui ejecuto la cadena de conexion
                SqlConnection objConnsql = new SqlConnection(sConnectionStringsql);
                //Abrir la cadena de conexion
                objConnsql.Open();
                //lenar adapter de la consulta de usuarios
                SqlDataAdapter dausuariosql = new SqlDataAdapter("Select * From Usuarios", objConnsql);
                //crear el dataset que se llena con la consulta
                DataSet dsusuariosql = new DataSet("Pubs");
                //llenar la tabla con el esquema
                dausuariosql.FillSchema(dsusuariosql, SchemaType.Source, "usuario_sql");
                dausuariosql.Fill(dsusuariosql, "usuario_sql");
                //crear datatable
                DataTable dtusuariosql = new DataTable();
                //nombrar la tabla y posicion donde se van a guardar los datos
                dtusuariosql = dsusuariosql.Tables["usuario_sql"];
                bandera = 1;
                //recorrer dataset
                foreach (DataRow row1 in dtusuariosql.Rows)
                {
                    //si el usuario es igual al usuario del datatable
                    if (usuario.ToString() == row1["Usuario"].ToString())
                    {
                        //Metodo para desencriptar
                        string frase = pass.ToString();
                        Byte[] codigos = System.Text.ASCIIEncoding.ASCII.GetBytes(frase);
                        string cadena = null;
                        foreach (Byte element in codigos)
                        {
                            cadena = cadena + Convert.ToChar(element + 2).ToString();
                            pass = cadena;
                        }
                        //Metodo para desencriptar la clave
                        if (pass.ToString() == row1["Clave"].ToString())
                        {
                            SqlCommand cmd;
                            string Stringsql;
                            //variable para guardar la cadena de conexion
                            Stringsql = ("Server=SERVIDOR2SP;Database= CONTROL_ALMACEN;User Id=sa;Password=Qwer1234;");
                            SqlConnection objConn = new SqlConnection(Stringsql);
                            objConn.Open();
                            //variable para insertar y registrar el ingreso del usuario
                            string caden = "Insert into Usuarios_Ingreso(Usuario) values ('" + usuario + "')";
                            cmd = new SqlCommand(caden, objConn);
                            //ejecutar query
                            cmd.ExecuteNonQuery();
                            //cerrar la conexion
                            objConn.Close();
                           //almacenar la session del usuario
                            Session["Usuario"] = TxtUsuario.Text;
                            //redireccionar a la pagina de actualizacion
                            Response.Redirect("WebActualizar.aspx");
                        }
                        else
                        {
                            //alerta en caso de que la contraseña sea invalida
                            Response.Write("<script>window.alert('" + "Usuario o Contraseña" + "');</script>");
                    
                            //limpiar la caja de texto
                            txtpass.Text = "";
                            //colocar el foco a la contraseña
                            txtpass.Focus();
                            return;
                        }
                    }
                
                }

                if(bandera == 1)
                {
                    //si el usuario no existe entonces mandar alerta de que el usuario no ha sido registrado, en caso de que no exista en la base de datos
                   Response.Write("<script>window.alert('" + "El usuario ingresado no ha sido registrado." + "');</script>");
                    
                    return;
                }
            }
            catch(Exception ex)
            {
                //en caso de que halla una excepcion guardarla en la base de datos con la fecha actual
                DataDataContext db = new DataDataContext();
                db.CommandTimeout = 900000;
                db.InsertarError(ex.Message.ToString(),DateTime.Now);
                //partir aplicacion
                throw ex;
            }

        }











            /*Data.DataDataContext db = new Data.DataDataContext();
            string a = "";
            db.ValidarLogin(TxtUsuario.Text, TxtContrasena.Text, ref a);

            if (a.Equals("1")) {

                // Response.Write("<script>window.alert('" + "Logueado" + "');</script>"); 

                Response.Redirect("Menu.aspx");
            } else {
                Response.Write("<script>window.alert('" + "Usuario o Contraseña Incorrecta" + "');</script>"); 
            }*/

        }      
  }
