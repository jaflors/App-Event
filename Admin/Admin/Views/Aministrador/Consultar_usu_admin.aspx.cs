using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Aministrador
{
    public partial class Consultar_usu_admin : System.Web.UI.Page
    {
        public DataTable dtConsulta = new DataTable();
        public DataRow drConsulta;
        UsuarioController usu = new UsuarioController();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            dtConsulta = usu.ConsultarDatosPersonas();

            if (dtConsulta.Rows.Count >0)
            {
                drConsulta = dtConsulta.Rows[0];
            }



        }
    }
}