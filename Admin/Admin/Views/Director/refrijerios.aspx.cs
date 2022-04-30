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
    public partial class refrijerios : System.Web.UI.Page
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
            Session["id_evento"] = evento.SelectedValue;



        }


        public void Unnamed_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("registrar"))
            {
                string id = (e.CommandArgument.ToString());
                string idevet = Session["id_evento"].ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + eve.insert_refrigerio(idevet,id) + "');", true);



            }

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