using Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class RolController
    {
        public Rol modelo = new Rol();

        public string ConsultarID_Rol(string obj)
        {
            return modelo.ConsultarPk(obj);


        }





    }
}