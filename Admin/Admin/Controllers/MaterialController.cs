using Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Controllers
{
    public class MaterialController
    {



        public Material obj = new Material();

        public MaterialController()
        {
            obj = new Material();
        }

        public MaterialController(string a, string b)
        {
            obj.Nombre = a;
            obj.Descripcion= b;
        }





        public bool insertar_Material(Material obj)
        {
            return obj.insert_Material(obj);
        }


        public DataTable consultarMaterialDisponible(string pk_evento)
        {
            return obj.consultarMateial(pk_evento);
        }

        public DataTable consultarMaterial_grid()
        {
            return obj.consultarMateial_grid();
        }

        public bool event_asignarMaterial(string pro, string var)
        {
            return obj.asignarMaterial(pro, var);
        }

       

        public bool event_eliminarMaterial(string pro, string var)
        {
            return obj.eliminarAsignado(pro, var);
        }




    }
}