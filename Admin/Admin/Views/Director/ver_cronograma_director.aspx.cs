using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Director
{
    public partial class ver_cronograma_director : System.Web.UI.Page
    {

        public DataTable dtevent, dteventinfo;
        public DataRow drConsulta;
        PonenteController pone = new PonenteController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargar_eventos();



            }

        }



        protected void List_Click(object sender, EventArgs e)
        {
            listview1.DataSource = pone.consultar_info_event(evento.SelectedValue);
            listview1.DataBind();
            Session["id_evento"] = evento.SelectedValue;
            


        }

        public void cargar_eventos()
        {

            EventoController eve = new EventoController();
            evento.DataSource = eve.consultar_eventos_Director(Session["login"].ToString());
            evento.DataTextField = "Nombre";
            evento.DataValueField = "idEvento";
            evento.DataBind();



            dtevent = eve.consultar_eventos_crono();
            Session["datos_dtEventos"] = dtevent;

        }

















    }
}