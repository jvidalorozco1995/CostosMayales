using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebCostosPresupuestos;

namespace ArchivoCostosWeb
{
    public partial class Administracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            
            
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            Data.DataDataContext db = new Data.DataDataContext();
            db.CommandTimeout = 900000;
            db.BorrarAreas();
           // db.BorrarParametrizacion();
            Consultas.GuardarAreas();
            //Consultas.GuardarParametros();
        }
    }
}