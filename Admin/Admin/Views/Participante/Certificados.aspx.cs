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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public DataTable dtevent, dtdias ;
        public DataRow drevent,drdias;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UsuarioController usu = new UsuarioController();
                listview1.DataSource = usu.mis_eventos_inscrito(Session["login"].ToString());
                listview1.DataBind();

            }


        }

        public void Unnamed_Command(object sender, CommandEventArgs e)
        {
            UsuarioController usu = new UsuarioController();

            if (e.CommandName.Equals("registrar"))
            {
                string idevent = (e.CommandArgument.ToString());
                Session["evento_asistencia"] = idevent;
                string idusuario = Session["login"].ToString();
                dtdias = usu.traer_dias_evento(idevent,idusuario);
                if (dtdias.Rows.Count>0)
                {
                    drdias = dtdias.Rows[0];
                    int dias_asistidos= Convert.ToInt32 ( drdias["dias asistido"].ToString());
                    int dias_evento = Convert.ToInt32(drdias["dias"].ToString());
                    int asistencia_real = dias_evento * 2;
                    if (dias_asistidos== asistencia_real)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('entro');", true);
                        Response.Redirect("../Reportes/Vista_reportes.aspx?tipo=4");

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('No se Cumplió la asistencia ');", true);
                    }

                }

                
                

            }

        }





    }
}