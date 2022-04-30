using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Participante
{
    public partial class Registrase_Event : System.Web.UI.Page
    {
        private Dictionary<string, int> mapita = new Dictionary<string, int>();//Para los eventos, nombre e indice en el dtEventos
        private DataTable dtEventos;
        string msj;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cargarEventosPar(Session["login"].ToString());                
            }
            //mapita.Clear();

        }
        public void cargarEventosPar(string pk_participante)
        {

            Lista_Eventos.Items.Clear();
            Lista_Event_Asig.Items.Clear();
            Lista_Eventos.Enabled = true;
            Lista_Event_Asig.Enabled = true;
           
            mapita.Clear();
            EventoController obj = new EventoController();
            dtEventos = obj.consultareventospart(pk_participante);

            string str, str2;
            int con = 0;
            foreach (DataRow dr in dtEventos.Rows)
            {
                str = dr["EXISTE"].ToString();
                str2 = dr["Nombre"].ToString();
                if (str.Equals("Si")) Lista_Event_Asig.Items.Add(str2);
                else Lista_Eventos.Items.Add(str2);
                mapita.Add(str2, con++);
            }
            Session["mapita"] = mapita;
            Session["dtEvent"] = dtEventos;


        }

        protected void Mover_Evento(object sender, EventArgs e)
        {

            while (Lista_Eventos.GetSelectedIndices().Length > 0)
            {
                Lista_Event_Asig.Items.Add(Lista_Eventos.SelectedItem);
                Lista_Eventos.Items.Remove(Lista_Eventos.SelectedItem);
            }


        }

        protected void Devolver_Evento(object sender, EventArgs e)
        {
            while (Lista_Event_Asig.GetSelectedIndices().Length > 0)
            {
                Lista_Eventos.Items.Add(Lista_Event_Asig.SelectedItem);
                Lista_Event_Asig.Items.Remove(Lista_Event_Asig.SelectedItem);
            }
        }

        protected void AsignarEvento_Click(object sender, EventArgs e)
        {

            try
            {
                if (Lista_Event_Asig.Enabled == false)
                {
                    Response.Write("<script> alert('Error, Hay Sitios registrados'); </script>");
                    return;
                }
                EventoController obj = new EventoController();
                dtEventos = (DataTable)Session["dtEvent"];
                int con = 0, activos = 0;
                mapita = (Dictionary<string, int>)Session["mapita"];
                msj = "Se cambian ";
                DataRow dr;

                for (int i = 0; i < Lista_Event_Asig.Items.Count; i++)
                {
                    dr = dtEventos.Rows[mapita[Lista_Event_Asig.Items[i].ToString()]];
                    if (!dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.Insertar_evento_usuario(dr["idEvento"].ToString(), Session["login"].ToString())) con++;
                        else dtEventos.Rows[mapita[Lista_Event_Asig.Items[i].ToString()]]["EXISTE"] = "Si";
                    }
                }

                for (int i = 0; i < Lista_Eventos.Items.Count; i++)
                {
                    dr = dtEventos.Rows[mapita[Lista_Eventos.Items[i].ToString()]];
                    if (dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.Eliminar_evento_usuario(dr["idEvento"].ToString(), Session["login"].ToString())) con++;
                        else dtEventos.Rows[mapita[Lista_Eventos.Items[i].ToString()]]["EXISTE"] = "No";
                    }
                }

                if (activos == 0)
                {
                    msj = "Sin cambios";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
                    return;
                }
                if (con == 0)
                {
                    msj += " " + activos;
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
                }
                else
                {
                    msj = "Error al actualizar alguno(s)";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
                }

            }

            catch (Exception)

            {
                //    Response.Write("<script> alert('Error inesperado'); </script>");
            }
            cargarEventosPar(Session["login"].ToString());





        }









        }
      
    }
