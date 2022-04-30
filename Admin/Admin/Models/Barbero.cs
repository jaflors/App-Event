using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Barbero
    {

        BdComun conn = new BdComun();
        public string p_nombre { get; set; }
        public string p_apellidos { get; set; }

        public string p_correo { get; set; }
        public string p_contrasena { get; set; }
        public string p_recontrasena { get; set; }

        public bool insertbarber(Barbero obj,string id_barberia)
        {
            Parameter[] para = new Parameter[6];

            para[0] = new Parameter("p_nombre", obj.p_nombre);
            para[1] = new Parameter("p_apellidos", obj.p_apellidos);
            para[2] = new Parameter("p_correo", obj.p_correo);
            para[3] = new Parameter("p_contrasena", obj.p_contrasena);
            para[4] = new Parameter("p_recontrasena", obj.p_recontrasena);
            para[5] = new Parameter("Id_barberia", id_barberia);


            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_barbero", para);
            return conn.Transaction(trans);


        }



        public DataTable ConsulBarbero_propieta()
        {
            string sql = @"SELECT u.idUsuario, u.nombres, u.apellidos,u.estado,b.nombre FROM usuario as u
            inner join barbero on u.idusuario=barbero.usuario_idUsuario
            inner join barberia as b on barbero.barberia_idbarberia=idbarberia where u.estado='A';  ";

            return conn.EjecutarConsulta(sql, CommandType.Text);

        }


        public DataTable ConsulBarberos()
        {
            string sql = @"SELECT u.idUsuario, u.nombres, u.apellidos,u.estado,b.nombre FROM usuario as u
            inner join barbero on u.idusuario=barbero.usuario_idUsuario
            inner join barberia as b on barbero.barberia_idbarberia=idbarberia;  ";

            return conn.EjecutarConsulta(sql, CommandType.Text);

        }
        public DataTable ConsulBarberos_propietario_2(string id_barberia)
        {
            string sql = @"SELECT u.idUsuario, u.nombres, u.apellidos,u.estado,b.nombre FROM usuario as u
            inner join barbero on u.idusuario=barbero.usuario_idUsuario
            inner join barberia as b on barbero.barberia_idbarberia=idbarberia where u.estado='A'and b.idbarberia= '" + id_barberia + "';  ";

            return conn.EjecutarConsulta(sql, CommandType.Text);

        }
        public DataTable ConsulBarbero_propietario(string id_barberia)
        {
            string sql = @"SELECT  barbero.idBarbero,  u.idUsuario,concat(u.nombres, ' ', u.apellidos) as nombres, u.estado, b.nombre FROM usuario as u
            inner join barbero on u.idusuario= barbero.usuario_idUsuario
            inner join barberia as b on barbero.barberia_idbarberia= idbarberia where u.estado= 'A'and b.idbarberia='"+id_barberia+"'; ";

            return conn.EjecutarConsulta(sql, CommandType.Text);

        }


        



    }
}