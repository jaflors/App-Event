using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Admin.Conexion;
namespace Admin.Models
{
    public class Sitio
    {
        BdComun conn = new BdComun();
        public string nombre;
         
        public Sitio ( string a)
        {
            nombre = a;

        }

        public Sitio()
        {

        }

     
        public bool RegistrarSitio(Sitio obj)
        {
            string sql = "insert into sitio values(DEFAULT,'" + obj.nombre + "','activo')" ;
            return conn.RegistrarDatos(sql, CommandType.Text);
        }

        public DataTable consultarSitios( string pk_evento)
        {
            string sql = @"select idSitio,Nombre_sitio,
	        if (EXISTS(select Evento_idEvento from detalle_evento where detalle_evento.Evento_idEvento= '" + pk_evento + @"' and 
            detalle_evento.Sitio_idSitio = sitio.idSitio),'Si','No')as 'EXISTE' from sitio 
            where sitio.Estado='activo' order by Nombre_sitio;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public bool asignarSitio(string pkEvento, string pkSitio)
        {
            string[] sql = new string[1];
            sql[0] = "Insert into detalle_evento (Evento_idEvento,Sitio_idSitio)";
            sql[0] += "VALUES(" + pkEvento + ", " + pkSitio + ");";
            return conn.RealizarTransaccion(sql);
        }

        public bool eliminarAsignado(string pkEvento, string pkSitio)
        {
            string[] sql = new string[1];
            sql[0] = @"DELETE FROM detalle_evento WHERE Evento_idEvento = '" + pkEvento + @"' 
                 AND Sitio_idSitio = '" + pkSitio + "' ;";
            return conn.RealizarTransaccion(sql);
        }

        public DataTable consultarSitios_Grid()
        {
            string sql = @"select Nombre_sitio as Nombre,;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


    }
}