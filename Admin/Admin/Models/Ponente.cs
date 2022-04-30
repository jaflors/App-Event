using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Ponente
    {
        BdComun conn = new BdComun();

        public string p_nombre { get; set; }
        public string p_apellidos { get; set; }
        public string p_correo { get; set; }
        public string p_tipo { get; set; }
        public string p_contrasena { get; set; }

        public string p_tema { get; set; }

        public string p_hora { get; set; }

        public bool insertponet(Ponente obj)
        {
            Parameter[] para = new Parameter[7];

            para[0] = new Parameter("p_nombre", obj.p_nombre);
            para[1] = new Parameter("p_apellidos", obj.p_apellidos);
            para[2] = new Parameter("p_correo", obj.p_correo);
            para[3] = new Parameter("p_tipo", obj.p_tipo);
            para[4] = new Parameter("p_contrasena", obj.p_contrasena);
            para[5] = new Parameter("p_tema", obj.p_tema);
            para[6] = new Parameter("p_hora", obj.p_hora);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_ponente", para);
            return conn.Transaction(trans);


        }



        public DataTable consulponente(string pk_evento)
        {
            string sql = @"select idPonente,CONCAT(Nombre,' ',Apellido) nombre,
            if (EXISTS(select evento_idEvento from ponente_event where ponente_event.evento_idEvento=  '" + pk_evento + @"' and ponente_event.Ponente_idPonente = ponente.idPonente),'Si','No')as 'EXISTE' from ponente
            order by Nombre;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consul_pone_actividad()
        {
            string sql = @"select u.idusuario, concat(u.nombres,' ',u.apellidos) as nombres  from usuario u
            inner  join usuario_rol   on  usuario_rol.Usuario_idUsuario=  u.idusuario
            where usuario_rol.Rol_idRol=2;  ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable consult_info_evento(string pk_evento)
        {
            string sql = @"select evento.Nombre ,CONCAT(usuario.nombres,' ',usuario.apellidos)Ponente,cronograma.tema as Tema, cronograma.hora  ,DATE_FORMAT(Fecha_creacion,'%d/%m/%Y')as Fecha_creacion  from evento
           inner join cronograma on cronograma.fk_idEvento=evento.idEvento
           inner join usuario  on usuario.idusuario = cronograma.fk_idusuario
           where idEvento='" + pk_evento + "' order by hora;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }



        public bool asignarPonente(string pkEvento, string pkponente)
        {
            string[] sql = new string[1];
            sql[0] = "Insert into ponente_event (evento_idEvento,Ponente_idPonente)";
            sql[0] += "VALUES('" + pkEvento + "', '" + pkponente + "');";
            return conn.RealizarTransaccion(sql);
        }

        public bool eliminarAsignado(string pkEvento, string pkponente)
        {
            string[] sql = new string[1];
            sql[0] = @"DELETE FROM ponente_event WHERE evento_idEvento = '" + pkEvento + @"' 
                 AND Ponente_idPonente = '" + pkponente + "' ;";
            return conn.RealizarTransaccion(sql);
        }




    }
}