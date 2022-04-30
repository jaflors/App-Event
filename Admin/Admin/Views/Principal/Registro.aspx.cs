using Admin.Controllers;
using Admin.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Principal
{
    public partial class Registro : System.Web.UI.Page
    {
        string msj;

        protected void Page_Load(object sender, EventArgs e)
        {
            


        }


        protected void Registrar(object sender, EventArgs e)
        {
            Correo objcorreo = new Correo(Correo.Value.ToString(), "Registro", "Su registro a APP-EVENT a sido exitoso");

            if (objcorreo.Estado)
            {
                Response.Write("el correo se envio exitosamente...");
            }
            else
            {
                Response.Write("error al envio <br>" + objcorreo.mensaje_error);
            }


            try
            {
                UsuarioController usu = new UsuarioController(Nombres.Value.ToString(), Apellidos.Value.ToString(),
                cedula.Value.ToString(),Correo.Value.ToString(), Contrasena.Value.ToString(), Recontrasena.Value.ToString());

                if (file_usuario != null)
                {
                    if (ModelState.IsValid)
                    {
                        string img = Path.GetFileName(file_usuario.FileName);
                        string ruta = "../../Imagenes/" + img;

                        string carpeta = Path.Combine(Server.MapPath("~/Imagenes"), img);

                        if (usu.Insertar(usu.usu,ruta) == true)
                        {
                            file_usuario.SaveAs(carpeta);
                            msj = "Usuario registrado correctamente";
                            //return RedirectToAction("Agregar_Consultorio_Admin", "consultorio");
                            Response.Redirect("~/Views/Principal/Login.aspx");

                        }
                        else
                        {
                            msj = "Error! algo salio mal";
                            Response.Redirect("~/Views/Principal/Registro.aspx");
                        }

                    }
                    else
                    {
                        msj = "intentalo de nuevo ";
                        Response.Redirect("~/Views/Principal/Registro.aspx");
                    }


                }
                else
                {
                    msj = "no has seleccionado una imagen";
                    Response.Redirect("~/Views/Principal/Registro.aspx");
                }

                //string aux = usu.Insertar(usu.usu);
                //Response.Write("<script> alert('" + aux + "'); </script>");
                //Response.Redirect("Login.aspx");
            }
            catch (Exception)
            {
                Response.Write("<script> alert('ERROR INESPERADO' ); </script>");
            }






        }

      
    }
}