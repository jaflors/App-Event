using Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class ClienteController
    {

        cliente cli = new cliente();

        public string traer_id_cliente(string id_usu)
        {
          return cli.Consul_id_cliente_cita(id_usu);
        }

    }
}