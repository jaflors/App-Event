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
    public partial class inscritos_eventos : System.Web.UI.Page
    {
        public DataTable dtevent, dteventinfo;
        public DataRow drConsulta;
        PonenteController pone = new PonenteController();
        EventoController eve = new EventoController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargar_eventos();



            }

        }

        protected void List_Click(object sender, EventArgs e)
        {
            listview1.DataSource = eve.consulta_inscritos_eventos(evento.SelectedValue);
            listview1.DataBind();
            Session["id_evento_inscritos"] = evento.SelectedValue;



        }


       


        public void cargar_eventos()
        {

            EventoController eve = new EventoController();
            evento.DataSource = eve.consultar_eventos_Atualizar();
            evento.DataTextField = "Nombre";
            evento.DataValueField = "idEvento";
            evento.DataBind();



            dtevent = eve.consultar_eventos_crono();
            Session["datos_dtEventos"] = dtevent;

        }













    }
}