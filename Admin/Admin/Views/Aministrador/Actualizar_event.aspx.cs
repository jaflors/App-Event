using Admin.Controllers;
using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Aministrador
{
    public partial class Actualizar_event : System.Web.UI.Page
    {
        public DataTable dtevent, dtinscritos;
        public DataRow drconsulta;
        EventoController obj2 = new EventoController();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargarEventos();
            }

        }

        

        public void cargarEventos()
        {

            dtevent = obj2.consultar_eventos_Atualizar();
            for (int i = 0; i < dtevent.Rows.Count; i++)
            {
                List_eventos.Items.Add(dtevent.Rows[i]["Nombre"].ToString());
            }
            Session["datos_dtevent"] = dtevent;
        }

        protected void List_eventos_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtevent = (DataTable)Session["datos_dtevent"];//eventos seleccionados 


            if (dtevent == null) return;
            int index = List_eventos.SelectedIndex;
            if (index < 0 || index >= dtevent.Rows.Count)
            {
                return;
            }
            string pk_event = dtevent.Rows[index]["idEvento"].ToString();
            Session["pk_event"] = pk_event;

            name.Value = dtevent.Rows[index]["Nombre"].ToString();
            Session["nombre_ev"]=dtevent.Rows[index]["Nombre"].ToString();
            descripcion.Value = dtevent.Rows[index]["Descripcion"].ToString();
            Label1.Text = dtevent.Rows[index]["fecha"].ToString();
            Label2.Text = dtevent.Rows[index]["fecha_fin"].ToString();
            Hora.Text = dtevent.Rows[index]["Hora"].ToString();

        }


        protected void Actualizar(object sender, EventArgs e)
        {

            dtinscritos = obj2.consulta_inscritos_eventos(Session["pk_event"].ToString());

            for (int i = 0; i < dtinscritos.Rows.Count; i++)
            {
                drconsulta = dtinscritos.Rows[i];
                string mail = drconsulta["correo"].ToString();

                Correo objcorreo = new Correo(mail.ToString(), "Cambio de fechas Evento", "Se cambiaron las fechas del evento '" + Session["nombre_ev"].ToString() + "' a  '" + fecha.Value.ToString() + "'- '" + fecha2.Text + "'      ");
            }




            if (obj2.update_event(name.Value.ToString(),descripcion.Value.ToString(),fecha.Value.ToString(),
                fecha2.Text,Hora.Text, Session["pk_event"].ToString()))
            {
                Response.Write("<script> alert('Actualizacion Exitosa'); </script>");
                
            }else
            {
                Response.Write("<script> alert('Error'); </script>");
            }
        }

        
    }
}