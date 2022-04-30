using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Admin.Views.Participante
{
    public partial class consultar_eventos : System.Web.UI.Page
    {
        public DataTable dtevent;
        public DataRow drevent;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EventoController eve = new EventoController();

                dtevent = eve.consultareventosParticipante();




                for (int i = 0; i < dtevent.Rows.Count; i++)
                {
                    drevent = dtevent.Rows[i];
                    //HtmlGenericControl div = new HtmlGenericControl("div");
                    //div.InnerHtml = "<img style='width: 100 %; display: block; 'src ='" + drevent["foto"] + "' alt='image'      />";
                    //div.Attributes.Add("class", "image view view-first");
                  

   
                    //imagen.Controls.Add(div);
                    
                }




            }





        }
    }
}