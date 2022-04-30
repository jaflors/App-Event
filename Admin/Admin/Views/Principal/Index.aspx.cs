using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Admin.Views.Principal
{
    public partial class Index : System.Web.UI.Page
    {
        public DataTable dtimagen;
        public DataRow drimagen;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EventoController eve = new EventoController();

                dtimagen = eve.consultareventosbanner();




                for (int i = 0; i < dtimagen.Rows.Count; i++)
                {
                    drimagen = dtimagen.Rows[i];
                    HtmlGenericControl div = new HtmlGenericControl("div");
                    HtmlGenericControl div2 = new HtmlGenericControl("div");
                    div.InnerHtml = "<img src = '" + drimagen["foto"] + "'/>";
                    div2.Attributes.Add("class", "carousel-caption");
                    div2.InnerHtml = "<p>'" + drimagen["Nombre"] + "</p>";
                  
                    if (i == 0)
                    {
                        div.Attributes.Add("class", "item active");
                        div.Controls.Add(div2);
                    }
                    else
                    {
                        div.Attributes.Add("class", "item");
                        div.Controls.Add(div2);
                    }

                    //HtmlGenericControl div2 = new HtmlGenericControl("div");
                    //div2.InnerHtml = "<img src = '../../Imagenes/icono.png' class='img - responsive' style='width: 100px !important; height: 320px !important' alt='' />";
                    //div2.Attributes.Add("class", "item ");

                    Baner.Controls.Add(div);
                    //Baner.Controls.Add(div2);
                }

            }


        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            EventoController evc = new EventoController();
            List<Models.Evento> eve = evc.Calendario();
            for (int i = 0; i < eve.Count; i++)
            {
                if (e.Day.Date == eve[i].fecha)
                {
                    Label labelito = new Label();
                    labelito.Text = "<br>" + eve[i].p_nombre;
                    e.Cell.Controls.Add(labelito);
                }
            }

        }




    }
}
