using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Administrador
{
    public partial class Registrar__Cita : System.Web.UI.Page
    {
        CitaController obj = new CitaController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                traer_barber();
                traer_Client();
                traer_Hora();
                traer_service();
            }

        }


        public void traer_barber()
        {
            List_barbero.DataSource = obj.traer_baber();
            List_barbero.DataTextField = "nombres";
            List_barbero.DataValueField = "idBarbero";
            List_barbero.DataBind();
        }

        public void traer_Client()
        {
            List_cliente.DataSource = obj.traer_Client();
            List_cliente.DataTextField = "nombres";
            List_cliente.DataValueField = "idCliente";
            List_cliente.DataBind();
        }
        public void traer_Hora()
        {
            Hora.DataSource = obj.traer_hora();
            Hora.DataTextField = "hora";
            Hora.DataValueField = "idHorario";
            Hora.DataBind();
        }
        public void traer_service()
        {
            List_servi.DataSource = obj.traer_motivo();
            List_servi.DataTextField = "descripcion";
            List_servi.DataValueField = "idmotivo";
            List_servi.DataBind();
        }
        




        protected void Registrar(object sender, EventArgs e)
        {
            
            CitaController cita= new CitaController(List_barbero.Text.ToString(),List_cliente.Text.ToString(),fecha.Text.ToString(),Hora.Text.ToString(),List_servi.Text.ToString());

             if (cita.insert_cita(cita.cit)==true)
            {
                Response.Write("<script> alert(' Cita Registrada'); </script>");
                Response.Redirect("~/Views/Administrador/Registrar _Cita.aspx");
            }


        }



    }
}