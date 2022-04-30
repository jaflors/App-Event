using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Eventos
{
    public partial class cronograma : System.Web.UI.Page
    {
        EventoController eve = new EventoController();
        PonenteController pone = new PonenteController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargar_eventos();
                cargar_ponentes();
            }
        }

        public void cargar_eventos()
        {

           
            List_eventos.DataSource = eve.consultar_eve_views_actividad_pone();
            List_eventos.DataTextField = "Nombre";
            List_eventos.DataValueField = "idEvento";
            List_eventos.DataBind();
        }


        public void cargar_ponentes()
        {

            List_ponente.DataSource = pone.consultarPonente_views_actividad();
            List_ponente.DataTextField = "nombres";
            List_ponente.DataValueField = "idusuario";
            List_ponente.DataBind();

        }

        protected void guardar(object sender, EventArgs e)
        {
            if (eve.insert_cronogram(List_eventos.SelectedValue, List_ponente.SelectedValue, tema.Value.ToString(),
                fecha.Text, Hora.Text))
            {
                Response.Write("<script> alert('Registro Exitoso'); </script>");
                Response.Redirect("~/Views/Eventos/cronograma.aspx");
            }else
            {
                Response.Write("<script> alert('Algo salio mal'); </script>");
             
            }
        }
    }
}