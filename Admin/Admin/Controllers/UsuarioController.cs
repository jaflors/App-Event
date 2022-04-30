using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class UsuarioController
    {
        public Usuario usu = new Usuario();


        public UsuarioController()
        {
            usu = new Usuario();
        }

        public UsuarioController(string a, string b, string c, string d,string e,string f)
        {
            usu.p_nombre = a;
            usu.p_apellidos = b;
            usu.p_cedula = c;
            usu.p_correo = d;
            usu.p_contrasena = e;
            usu.p_recontrasena = f;
        }

        public DataTable ConsultarDatosPersonas()
        {
            return usu.ConsultarDatosPersonas();
        }

        public DataTable ConsultarUsuarios()
        {
            return usu.ConsultarUsuarios();
        }

        public bool actualizar_usu(string a,string b,string c,string d,string e,string f)
        {
            return usu.update_usu(a,b,c,d,e,f);
        }
        public bool update_participante(string a, string b, string c, string d, string e)
        {
            return usu.RealizarUpdate_Participante(a, b, c, d, e);
        }

        public DataTable consular_participante(string pk)
        {
            return usu.ConsultarParticipante(pk);
        }


        public DataTable traer_dias_evento(string id_evento,string idusuario)
        {
            return usu.consultar_dias_por_evento(id_evento,idusuario);
        }

        public bool Insertar(Usuario obj, string ruta)
        {
            return usu.insertusu(obj, ruta);
        }

        public bool Insertar_usu_Admin(Usuario obj, string pk_Rol, string ruta)
        {
            return usu.insertusu_Admin(obj,pk_Rol, ruta);
        }

        public DataTable consul_ponenet()
        {
            return usu.consultar_ponente();
        }


        public DataTable mis_eventos_inscrito(string pk_usuario)
        {
            return usu.Mis_eventos_iscrito(pk_usuario);
        }


        public DataTable consultarImg(string pk_usuario)
        {
            return usu.ConsultarIMG(pk_usuario);
        }

        public DataTable consultarNombreRol(string pk_usuario)
        {
            return usu.ConsulNombreRol(pk_usuario);
        }

        public bool cambiar_estado_usu(string pk)
        {
            return usu.Cambiar_estado_usu(pk);
        }


    }

}