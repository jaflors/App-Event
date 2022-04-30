using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admin.Models;
using Admin.Controllers;
using System.Data;
using System.IO;

namespace Admin.Views.Aministrador
{
    public partial class Evento : System.Web.UI.Page
    {
        public string msj = "";
        DataTable dtponet;
        UsuarioController usu = new UsuarioController();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargar_usuarios();
            }


        }

        public void cargar_usuarios()
        {

            List_usuario.DataSource = usu.ConsultarUsuarios();
            List_usuario.DataTextField = "nombres";
            List_usuario.DataValueField = "idusuario";
            List_usuario.DataBind();

        }



        protected void Registrar(object sender, EventArgs e)
        {
            try
            {
                EventoController ev = new EventoController(name.Value.ToString(),descripcion.Value.ToString(),fecha.Text,fecha2.Text,Hora.Text);
                if (file_evento != null)
                {
                    if (ModelState.IsValid)
                    {
                        string img = Path.GetFileName(file_evento.FileName);
                        string ruta = "../../Imagenes/" + img;

                        string carpeta = Path.Combine(Server.MapPath("~/Imagenes"), img);

                        if (ev.insertar_evento(ev.obj,ruta, List_usuario.SelectedValue) == true)
                        {
                            file_evento.SaveAs(carpeta);
                            msj = "Usuario evento correctamente";
                            Response.Write("<script> alert('" + msj + "'); </script>");
                            Response.Redirect("~/Views/Aministrador/Evento.aspx");

                        }
                        else
                        {
                            msj = "Error! algo salio mal";
                            Response.Write("<script> alert('" + msj + "'); </script>");
                            Response.Redirect("~/Views/Aministrador/Evento.aspx");
                        }

                    }
                    else
                    {
                        msj = "intentalo de nuevo ";
                        Response.Write("<script> alert('" + msj + "'); </script>");
                        Response.Redirect("~/Views/Aministrador/Evento.aspx");
                    }


                }
                else
                {
                    msj = "no has seleccionado una imagen";
                    Response.Write("<script> alert('" + msj + "'); </script>");
                      Response.Redirect("~/Views/Aministrador/Evento.aspx");

                }





            }
            catch (Exception)
            {
                Response.Write("<script> alert('ERROR INESPERADO' ); </script>");
            }





        }

       
    }
}