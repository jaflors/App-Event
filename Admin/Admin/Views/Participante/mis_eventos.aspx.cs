using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Participante
{
    public partial class mis_eventos : System.Web.UI.Page
    {
        public DataTable dtevent;
        public DataRow drevent;
       
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                UsuarioController usu = new UsuarioController();
                dtevent = usu.mis_eventos_inscrito(Session["login"].ToString());
                if (dtevent.Rows.Count > 0)
                {
                    drevent = dtevent.Rows[0];
                    
                }

            }

        }
    }
}