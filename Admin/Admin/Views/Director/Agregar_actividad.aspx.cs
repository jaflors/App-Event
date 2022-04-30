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
    public partial class Agregar_actividad : System.Web.UI.Page
    {

        EventoController eve = new EventoController();
        PonenteController pone = new PonenteController();
        DataTable dtevent;
        DataRow drevent;
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


            List_eventos.DataSource = eve.consultar_eventos_Director(Session["login"].ToString());
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
            }
            else
            {
                Response.Write("<script> alert('Algo salio mal'); </script>");

            }
        }

      

        protected void List_eventos_click(object sender, EventArgs e)
        {
            dtevent = eve.consultar_fechas_Director(List_eventos.SelectedValue);

            if (dtevent.Rows.Count > 0)
            {
                drevent = dtevent.Rows[0];
                Label1.Visible = true;
                Label1.Text = drevent["fecha"].ToString() + "-" + drevent["fecha_fin"].ToString();


            }
        }
    }
}