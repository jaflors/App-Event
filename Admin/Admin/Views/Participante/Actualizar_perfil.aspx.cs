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
    public partial class Actualizar_perfil : System.Web.UI.Page
    {
        DataTable dtusuario;
        DataRow drusuario;
        UsuarioController usu = new UsuarioController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            dtusuario = usu.consular_participante(Session["login"].ToString());
           if (dtusuario.Rows.Count >0)
            {
                drusuario = dtusuario.Rows[0];
                Nombres.Value = drusuario["nombres"].ToString();
                Apellidos.Value = drusuario["apellidos"].ToString();
                Correo.Value = drusuario["correo"].ToString();
                
                //Recontrasena.Value = drusuario["recontrasena"].ToString();
            }
           }
           
        }


        protected void Actualizar(object sender, EventArgs e)
        {
            if(usu.update_participante(Nombres.Value.ToString(),Apellidos.Value.ToString(),Correo.Value.ToString(),
               Contrasena.Value.ToString(),Session["login"].ToString())==true)
            {
                Response.Write("<script> alert('Actualizacion Exitosa'); </script>");
            }else
            {
                Response.Write("<script> alert('ERROR ACTULIZACIÓN'); </script>");
            }
        }



    }
}