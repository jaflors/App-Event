using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class cliente
    {
        BdComun con = new BdComun();



        public string Consul_id_cliente_cita(string obj)
        {
            string sql = @"SELECT cliente.idCliente FROM usuario 
           INNER JOIN cliente ON usuario.idUsuario=cliente.usuario_idUsuario 
           WHERE usuario.idUsuario='"+obj+"'; ";
            DataTable data = con.EjecutarConsulta(sql, CommandType.Text);
            return data.Rows[0]["idCliente"].ToString();
        }



    }
}