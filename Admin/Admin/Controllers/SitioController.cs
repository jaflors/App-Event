using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class SitioController
    {
        protected Sitio obj;

        public SitioController()
        {
            obj = new Sitio();
        }

        public DataTable consultarSitiosDisponibles(string pk_evento)
        {
            return obj.consultarSitios(pk_evento);
        }

        public bool event_asignarSitio(string pro, string var)
        {
            return obj.asignarSitio(pro, var);
        }

        public bool event_eliminarSitio(string pro, string var)
        {
            return obj.eliminarAsignado(pro, var);
        }


    }
}