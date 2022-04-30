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
    public partial class Administrar_evento_director : System.Web.UI.Page
    {
        private Dictionary<string, int> mapa = new Dictionary<string, int>();//Para los sitio, nombre e indice en el dtSitio
        private Dictionary<string, int> mapita = new Dictionary<string, int>();//Para los Materiales, nombre e indice en el dtMateriales
        private Dictionary<string, int> mapote = new Dictionary<string, int>();//Para los ponetes, nombre e indice en el dtponente

        private DataTable dtEventos, dtSitios, dtMateriales;
        public string msj = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargarEventos();

            }
            //mapa.Clear();



        }







        //Seleccionar Eventos

        public void cargarEventos()
        {
            ListarSitioDiponibles.Items.Clear();
            listaSitioAsignados.Items.Clear();
            evento.Items.Clear();

            EventoController obj2 = new EventoController();
            dtEventos = obj2.consultar_eventos_Director(Session["login"].ToString());
            for (int i = 0; i < dtEventos.Rows.Count; i++)
            {
                evento.Items.Add(dtEventos.Rows[i]["Nombre"].ToString());
            }
            Session["datos_dtEventos"] = dtEventos;
        }
        protected void List_Click(object sender, EventArgs e)
        {
            dtEventos = (DataTable)Session["datos_dtEventos"];//Eventos seleccionado
            if (dtEventos == null) return;
            int index = evento.SelectedIndex;
            if (index < 0 || index >= dtEventos.Rows.Count)
            {
                return;
            }
            string pk_event = dtEventos.Rows[index]["idEvento"].ToString();
            Session["pk_event"] = pk_event;
            nombreEvento.Text = evento.SelectedItem.ToString();
            texto.Text = dtEventos.Rows[index]["Descripcion"].ToString();
            cargarSitios(pk_event);
            cargarMateriales(pk_event);


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
        }



        //selecionar sistios
        public void cargarSitios(string pk_evento)
        {

            ListarSitioDiponibles.Items.Clear();
            listaSitioAsignados.Items.Clear();
            ListarSitioDiponibles.Enabled = true;
            listaSitioAsignados.Enabled = true;
            mapa.Clear();
            SitioController obj = new SitioController();
            dtSitios = obj.consultarSitiosDisponibles(pk_evento);

            string str, str2;
            int con = 0;
            foreach (DataRow dr in dtSitios.Rows)
            {
                str = dr["EXISTE"].ToString();
                str2 = dr["Nombre_sitio"].ToString();
                if (str.Equals("Si")) listaSitioAsignados.Items.Add(str2);
                else ListarSitioDiponibles.Items.Add(str2);
                mapa.Add(str2, con++);
            }
            Session["mapa"] = mapa;
            Session["dtSitios"] = dtSitios;


        }



        protected void Cambiar_Sitios(object sender, EventArgs e)
        {
            while (ListarSitioDiponibles.GetSelectedIndices().Length > 0)
            {
                listaSitioAsignados.Items.Add(ListarSitioDiponibles.SelectedItem);
                ListarSitioDiponibles.Items.Remove(ListarSitioDiponibles.SelectedItem);
            }

        }


        protected void noAsignar_Click(object sender, EventArgs e)
        {
            while (listaSitioAsignados.GetSelectedIndices().Length > 0)
            {
                ListarSitioDiponibles.Items.Add(listaSitioAsignados.SelectedItem);
                listaSitioAsignados.Items.Remove(listaSitioAsignados.SelectedItem);
            }

        }

        protected void asignarSitio_Click(object sender, EventArgs e)
        {
            try
            {
                if (listaSitioAsignados.Enabled == false)
                {
                    Response.Write("<script> alert('Error, Hay Sitios registrados'); </script>");
                    return;
                }
                SitioController obj = new SitioController();
                dtSitios = (DataTable)Session["dtSitios"];
                int con = 0, activos = 0;
                mapa = (Dictionary<string, int>)Session["mapa"];
                msj = "Se cambian ";
                DataRow dr;

                for (int i = 0; i < listaSitioAsignados.Items.Count; i++)
                {
                    dr = dtSitios.Rows[mapa[listaSitioAsignados.Items[i].ToString()]];
                    if (!dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.event_asignarSitio(Session["pk_event"].ToString(), dr["idSitio"].ToString())) con++;
                        else dtSitios.Rows[mapa[listaSitioAsignados.Items[i].ToString()]]["EXISTE"] = "Si";
                    }
                }

                for (int i = 0; i < ListarSitioDiponibles.Items.Count; i++)
                {
                    dr = dtSitios.Rows[mapa[ListarSitioDiponibles.Items[i].ToString()]];
                    if (dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.event_eliminarSitio(Session["pk_event"].ToString(), dr["idSitio"].ToString())) con++;
                        else dtSitios.Rows[mapa[ListarSitioDiponibles.Items[i].ToString()]]["EXISTE"] = "No";
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
                Response.Write("<script> alert('Error inesperado'); </script>");
            }
            cargarSitios(Session["pk_event"].ToString());
        }



        public void cargarMateriales(string pk_evento)
        {

            Lista_Materiales.Items.Clear();
            Lista_Materiales_Asig.Items.Clear();
            Lista_Materiales.Enabled = true;
            Lista_Materiales_Asig.Enabled = true;
            mapita.Clear();
            MaterialController obj = new MaterialController();
            dtMateriales = obj.consultarMaterialDisponible(pk_evento);

            string str, str2;
            int con = 0;
            foreach (DataRow dr in dtMateriales.Rows)
            {
                str = dr["EXISTE"].ToString();
                str2 = dr["Nombre_Material"].ToString();
                if (str.Equals("Si")) Lista_Materiales_Asig.Items.Add(str2);
                else Lista_Materiales.Items.Add(str2);
                mapita.Add(str2, con++);
            }
            Session["mapita"] = mapita;
            Session["dtMaterial"] = dtMateriales;


        }
        //mover items materiales


        protected void Mover_Materiales(object sender, EventArgs e)
        {
            while (Lista_Materiales.GetSelectedIndices().Length > 0)
            {
                Lista_Materiales_Asig.Items.Add(Lista_Materiales.SelectedItem);
                Lista_Materiales.Items.Remove(Lista_Materiales.SelectedItem);
            }

        }

        protected void Devolver_Materiales(object sender, EventArgs e)
        {
            while (Lista_Materiales_Asig.GetSelectedIndices().Length > 0)
            {
                Lista_Materiales.Items.Add(Lista_Materiales_Asig.SelectedItem);
                Lista_Materiales_Asig.Items.Remove(Lista_Materiales_Asig.SelectedItem);
            }

        }



        protected void AsignarMateriales_Click(object sender, EventArgs e)
        {
            try
            {
                if (Lista_Materiales_Asig.Enabled == false)
                {
                    Response.Write("<script> alert('Error, Hay Materiales registrados'); </script>");
                    return;
                }
                MaterialController obj = new MaterialController();
                dtMateriales = (DataTable)Session["dtMaterial"];
                int con = 0, activos = 0;
                mapita = (Dictionary<string, int>)Session["mapita"];
                msj = "Se cambian ";
                DataRow dr;

                for (int i = 0; i < Lista_Materiales_Asig.Items.Count; i++)
                {
                    dr = dtMateriales.Rows[mapita[Lista_Materiales_Asig.Items[i].ToString()]];
                    if (!dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.event_asignarMaterial(Session["pk_event"].ToString(), dr["idMaterial__Evento"].ToString())) con++;
                        else dtMateriales.Rows[mapita[Lista_Materiales_Asig.Items[i].ToString()]]["EXISTE"] = "Si";
                    }
                }

                for (int i = 0; i < Lista_Materiales.Items.Count; i++)
                {
                    dr = dtMateriales.Rows[mapita[Lista_Materiales.Items[i].ToString()]];
                    if (dr["EXISTE"].ToString().Equals("Si"))
                    {
                        activos++;
                        if (!obj.event_eliminarMaterial(Session["pk_event"].ToString(), dr["idMaterial__Evento"].ToString())) con++;
                        else dtMateriales.Rows[mapita[Lista_Materiales.Items[i].ToString()]]["EXISTE"] = "No";
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
                Response.Write("<script> alert('Error inesperado'); </script>");
            }
            cargarMateriales(Session["pk_event"].ToString());
        }
    }
}