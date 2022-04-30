using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Aministrador
{
    public partial class Registrar_usu_admi : System.Web.UI.Page
    { string msj = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Registrar(object sender, EventArgs e)
        {
            try
            {
                string pk_Rol = ((new RolController()).ConsultarID_Rol(Select1.Value.ToString()));
                UsuarioController usu = new UsuarioController(Nombres.Value.ToString(), Apellidos.Value.ToString(),
                Cedula.Value.ToString(),Correo.Value.ToString(), Contrasena.Value.ToString(), Recontrasena.Value.ToString());

                if (file_usuario != null)
                {
                    if (ModelState.IsValid)
                    {
                        string img = Path.GetFileName(file_usuario.FileName);
                        string ruta = "../../Imagenes/" + img;

                        string carpeta = Path.Combine(Server.MapPath("~/Imagenes"), img);

                        if (usu.Insertar_usu_Admin(usu.usu,pk_Rol, ruta) == true)
                        {
                            file_usuario.SaveAs(carpeta);
                            msj = "Usuario registrado correctamente";
                            Response.Write("<script> alert('" + msj + "'); </script>");
                            Response.Redirect("~/Views/Aministrador/Registrar_usu_admi.aspx");

                        }
                        else
                        {
                            msj = "Error! algo salio mal";
                            Response.Write("<script> alert('" + msj + "'); </script>");
                            Response.Redirect("~/Views/Aministrador/Registrar_usu_admi.aspx");
                        }

                    }
                    else
                    {
                        msj = "intentalo de nuevo ";
                        Response.Write("<script> alert('" + msj + "'); </script>");
                        Response.Redirect("~/Views/Aministrador/Registrar_usu_admi.aspx");
                    }


                }
                else
                {
                    msj = "no has seleccionado una imagen";
                    Response.Write("<script> alert('" + msj + "'); </script>");
                    Response.Redirect("~/Views/Aministrador/Registrar_usu_admi.aspx");
                }








            
            }
            catch (Exception)
            {
                Response.Write("<script> alert('ERROR INESPERADO' ); </script>");
            }







        }


       
        
       


    }
}