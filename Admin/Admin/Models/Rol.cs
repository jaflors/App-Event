using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Rol
    {
        BdComun conn = new BdComun();


        public string ConsultarPk(string obj)
        {
            string sql = "SELECT idRol FROM rol where rol.Nombre_Rol='" + obj + "';";
            DataTable data = conn.EjecutarConsulta(sql, CommandType.Text);
            return data.Rows[0]["idRol"].ToString();
        }











    }
}