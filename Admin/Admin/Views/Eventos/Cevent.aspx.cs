using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admin.Models;
namespace Admin.Views.Aministrador
{
    public partial class Cevent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Models.Evento evento = new Models.Evento();
                eventos.DataSource = evento.ConsultarEvento();
                eventos.DataBind();
            }
          
      
        }
    }
}