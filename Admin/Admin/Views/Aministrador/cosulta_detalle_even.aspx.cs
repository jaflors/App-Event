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
    public partial class cosulta_detalle_even : System.Web.UI.Page
    {
        public DataTable dtConsul = new DataTable();
        public DataRow drConsul;
         public EventoController usu = new EventoController();
        string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
           
           



       }

        protected void Consultar(object sender, EventArgs e)
        {

            Session["fecha_inicio"] = fecha_inicio.Value.ToString();
            Session["fecha_fin"] = fecha_fin.Value.ToString();
            dtConsul = usu.consultar_detalle_inscripcion(fecha_inicio.Value.ToString(),fecha_fin.Value.ToString());


            if (dtConsul.Rows.Count > 0)
            {
                drConsul = dtConsul.Rows[0];

            }
        }
    }
}