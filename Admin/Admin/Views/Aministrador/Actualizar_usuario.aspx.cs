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
    public partial class Actualizar_usuario : System.Web.UI.Page
    {
        public DataTable dtusuario;
        public DataRow drusuario;
        public UsuarioController obj2 = new UsuarioController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarUsuarrio();
            }
        }

        public void cargarUsuarrio()
        {
            
            dtusuario = obj2.ConsultarDatosPersonas();
            for (int i = 0; i < dtusuario.Rows.Count; i++)
            {
                usuario.Items.Add(dtusuario.Rows[i]["Nombres"].ToString() + "  " + dtusuario.Rows[i]["Apellidos"]);
            }
            Session["datos_dtusuario"] = dtusuario;
        }

        protected void List_Click(object sender, EventArgs e)
        {
            dtusuario = (DataTable)Session["datos_dtusuario"];//usuarios seleccionado
            if (dtusuario == null) return;
            int index = usuario.SelectedIndex;
            if (index < 0 || index >= dtusuario.Rows.Count)
            {
                return;
            }
            string pk_usuario = dtusuario.Rows[index]["idusuario"].ToString();
            Session["pk_usuario"] = pk_usuario;
            
            txt_Nombres.Text = dtusuario.Rows[index]["Nombres"].ToString();
            apellidos.Text= dtusuario.Rows[index]["Apellidos"].ToString();
            corre.Text = dtusuario.Rows[index]["Correo"].ToString();
            rol.Text = dtusuario.Rows[index]["Rol"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pk_Rol = ((new RolController()).ConsultarID_Rol(Select1.Value.ToString()));

            if (obj2.actualizar_usu(txt_Nombres.Text.ToString(),apellidos.Text.ToString(),corre.Text.ToString(),contra.Text.ToString(), Session["pk_usuario"].ToString(), pk_Rol))
            {
                Response.Write("<script> alert('Actualizacion Exitosa'); </script>");
            }
            else
            {
                Response.Write("<script> alert('ERROR ACTULIZACIÓN'); </script>");
            }


        }

        protected void eliminar(object sender, EventArgs e)
        {
            if (obj2.cambiar_estado_usu(Session["pk_usuario"].ToString()))
            {
                Response.Write("<script> alert('El usuario se elimino correctamente'); </script>");

            }
            else
            {
                Response.Write("<script> alert('Error al eliminar'); </script>");
            }

        }
    }
}