using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class PonenteController
    {
        public Ponente pone = new Ponente();


       public PonenteController()
        {
            pone = new Ponente();
        }

        public PonenteController(string a, string b, string c, string d, string e, string f, string g)
        {
            pone.p_nombre = a;
            pone.p_apellidos = b;
            pone.p_correo = c;
            pone.p_tipo = d;
            pone.p_contrasena = e;
            pone.p_tema = f;
            pone.p_hora = g;
        }


        public bool insert_ponente(Ponente obj)
        {
           return  pone.insertponet(obj);
        }

        public DataTable consultarPonentes(string pk_evento)
        {
            return pone.consulponente(pk_evento);
        }
        public DataTable consultarPonente_views_actividad()
        {
            return pone.consul_pone_actividad();
        }


        public DataTable consultar_info_event(string pk_evento)
        {
            return pone.consult_info_evento(pk_evento);
        }

        public bool event_asignarPonente(string pro, string var)
        {
            return pone.asignarPonente(pro,var);
        }



        public bool event_eliminarMaterial(string pro, string var)
        {
            return pone.eliminarAsignado(pro,var);
        }



    }
}