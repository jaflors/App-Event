using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class EventoController
    {
        public Evento obj = new Evento();

        public EventoController()
        {
            obj = new Evento();
        }

        public EventoController(string a,string b, string c,string d,string e)
        {
            obj.p_nombre = a;
            obj.p_descripcion = b;
            obj.p_fecha_creacion = c;
            obj.p_fecha_fin = d;
            obj.p_hora = e;


        }

        public bool update_event(string a, string b, string c, string d, string e,string f)
        {
            return obj.RealizarUpdate(a,b,c,d,e,f);
        }

        public bool insert_cronogram(string a, string b, string c, string d, string e)
        {
            return obj.Registrar_cronograma(a, b, c, d, e);
        }


        public DataTable consultar_fechas_eventos()
        {
            return obj.consultar_fechas_event();
        }

        public DataTable consultar_cantidad_usu()
        {
            return obj.consultar_cantidad_usuarios();
        }

        public DataTable consultar_detalle_inscripcion(string a, string b)
        {
            return obj.consultar_detalle_eventos(a,b);
        }

        public DataTable consulta_inscritos_eventos(string a)
        {
            return obj.TraerRegistrados_eventos(a);
        }



        public string insert_asistencia(string pk_usuario,string pk_evento)
        {
            return obj.Registrar_asistencia(pk_usuario,pk_evento);
        }

        public string insert_refrigerio(string pk_event, string pk_usu)
        {
            return obj.Registrar_refrigerios(pk_event,pk_usu);
        }


        public bool insertar_evento(Evento obj,string ruta, string pk_director){
            return obj.RegistrarEvento(obj,ruta, pk_director);
        }

        public DataTable consultarimageneventos()
        {
            return obj.consultarImagenEventos();
        }

        public DataTable consultareventosParticipante()
        {
            return obj.ConsultarEventoParticipante();
        }
        public DataTable consultareventosbanner()
        {
            return obj.ConsultarEventoBanner();
        }





        public DataTable consultareventosadmin()
        {
            return obj.consultarEventosAdmin();
        }

        public List<Evento> Calendario()
        {

            DataTable calendario1 = obj.TraerEvento();
            List<Evento> eve = new List<Evento>();
            for (int i = 0; i < calendario1.Rows.Count; i++)
            {
                Evento a = new Evento();
                a.p_nombre = calendario1.Rows[i]["Nombre"].ToString();
                a.fecha= DateTime.Parse(calendario1.Rows[i]["Fecha_creacion"].ToString());
                eve.Add(a);
            }

            return eve;
        }

        public DataTable consultareventospart(string pk_part)
        {
            return obj.consultarEventoPartc(pk_part);
        }

        public DataTable consultar_eventos_crono()
        {
            return obj.consultar_evento_crono();
        }

        public DataTable consultar_eve_views_actividad_pone()
        {
            return obj.consultar_actividad_ponent();
        }



        public DataTable consultar_eventos_Atualizar()
        {
            return obj.consultar_evento_Update();
        }

        public DataTable consultar_eventos_Director(string pk_director)
        {
            return obj.consultar_evento_Update_director(pk_director);
        }
        public DataTable consultar_certificado(string id_usu, string idevent)
        {
            return obj.consulta_certificado(id_usu,idevent);
        }




        public DataTable consultar_fechas_Director(string pk_evento)
        {
            return obj.consultar_evento_fechas_director(pk_evento);
        }




        public bool Insertar_evento_usuario(string pk_event,string var)
        {
            return obj.Registrar_usu_evento(pk_event,var);
        }

        public bool Eliminar_evento_usuario(string pk_event,string pk_usu)
        {
            return obj.eliminar_usu_evento(pk_event,pk_usu);
        }

    }
}