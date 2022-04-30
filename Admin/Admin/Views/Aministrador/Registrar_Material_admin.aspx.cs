using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Aministrador
{
    public partial class Registrar_Material_admin : System.Web.UI.Page
    {
        public string msj = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Registrar(object sender, EventArgs e)
        {
            try
            {
                MaterialController obj = new MaterialController(txt_Nombre.Value.ToString(), txt_descripcion.Value.ToString());
                if (obj.insertar_Material(obj.obj) == true)
                {
                    msj = "Material registrado correctamente";
                    Response.Write("<script> alert('" + msj + "'); </script>");
                    Response.Redirect("~/Views/Aministrador/Registrar_Material_admin.aspx");
                }
                else
                {
                    msj = "Algo salio mal";
                    Response.Write("<script> alert('" + msj + "'); </script>");
                    Response.Redirect("~/Views/Aministrador/Registrar_Material_admin.aspx");
                }

            }
            catch (Exception)
            {
                Response.Write("<script> alert('ERROR INESPERADO' ); </script>");
            }


        }
    }
}