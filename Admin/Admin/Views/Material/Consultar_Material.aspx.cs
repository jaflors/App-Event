using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Material
{
    public partial class Consultar_Material : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                MaterialController mate = new MaterialController();
                Material.DataSource = mate.consultarMaterial_grid();
                Material.DataBind();
            }
        }
    }
}