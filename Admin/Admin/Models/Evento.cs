using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Evento
    {
        BdComun conn = new BdComun();
        public string p_nombre { get; set; }
        public string p_descripcion { get; set; }
        public string p_fecha_creacion { get; set; }
        public DateTime fecha;
        public string p_fecha_fin { get; set; }
        public string p_hora { get; set; }

        public bool RegistrarEvento(Evento obj, string rutaimg, string pk_director)
        {
            Parameter[] para = new Parameter[7];

            para[0] = new Parameter("p_nombre", obj.p_nombre);
            para[1] = new Parameter("P_fkdirector", pk_director);
            para[2] = new Parameter("p_descripcion", obj.p_descripcion);
            para[3] = new Parameter("p_fecha_creacion", obj.p_fecha_creacion);
            para[4] = new Parameter("p_fecha_fin", obj.p_fecha_fin);
            para[5] = new Parameter("p_hora", obj.p_hora);
            para[6] = new Parameter("p_imagen", rutaimg);



            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_evento", para);
            return conn.Transaction(trans);


        }



        public DataTable ConsultarEventoParticipante()
        {
            string sql = @"SELECT e.Nombre,e.Fecha_creacion,e.Fecha_fin,e.Hora,gl.foto,si.Nombre_sitio from galeria as gl
            inner join galeria_eventos as ge on gl.idGaleria = ge.FK_idGaleria 
            inner join evento as e on e.idEvento= ge.FK_idEvento 
            inner join detalle_evento as de on e.idEvento= de.Evento_idEvento
            inner join sitio as si on si.idSitio= de.Sitio_idSitio
            where e.fecha_creacion>now() or e.Fecha_fin>=now() ;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable ConsultarEventoBanner()
        {
            string sql = @"SELECT e.Nombre,e.Fecha_creacion,e.Fecha_fin,e.Hora,gl.foto from galeria as gl
            inner join galeria_eventos as ge on gl.idGaleria = ge.FK_idGaleria 
            inner join evento as e on e.idEvento= ge.FK_idEvento 
			where e.Fecha_creacion>=now() or e.Fecha_fin>=now();";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }




        public DataTable consultar_fechas_event()
        {
            string sql = @"select e.Nombre, e.fecha_creacion,e.Fecha_fin from evento as e where e.fecha_creacion =  BETWEEN CAST('2018-01-01'AS date) and CAST('2018-06-01' AS date);";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultar_cantidad_usuarios()
        {
            string sql = @"select count(*) as contador,evento.Nombre,evento.idEvento from usuario 
            inner join registro_event on registro_event.FK_idusuario=usuario.idusuario
            inner join evento on evento.idEvento=registro_event.FK_idEvento group by evento.Nombre
            order by evento.Nombre ASC;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable TraerEvento()
        {
            string sql = " select Nombre,Fecha_creacion from evento order by Fecha_creacion;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable TraerRegistrados_eventos(string id_evento)
        {
            string sql = @"select usuario.idusuario, usuario.nombres,usuario.apellidos, FORMAT(usuario.cedula,0) as cedula,usuario.correo from usuario 
            inner join registro_event on registro_event.FK_idusuario=usuario.idusuario
            inner join evento on evento.idEvento=registro_event.FK_idEvento where evento.idEvento='" + id_evento + "';";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }






        public DataTable ConsultarEvento_profe()
        {
            string sql = @"select  e.Nombre as 'Evento', usuario.nombres,e.Descripcion as 'Detalles del evento',DATE_FORMAT(e.Fecha_creacion,'%d/%m/%Y') as 'Fecha',DATE_FORMAT(e.Fecha_fin,'%d/%m/%Y')  as 'Finalizacion',e.Hora from evento as e inner join usuario on usuario.idusuario=e.usuario ;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable ConsultarEvento()
        {
            string sql = @"select  e.Nombre as Nombre, e.Descripcion as 'Detalle evento',DATE_FORMAT(e.Fecha_creacion,'%d/%m/%Y') as 'Fecha',DATE_FORMAT(e.Fecha_fin,'%d/%m/%Y')  as 'Finalizacion',e.Hora  
            from evento as e where  e.Fecha_creacion>=now() or e.Fecha_fin>=now(); ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public bool Registrar_usu_evento(string pkEvento, string pkUsuario)
        {
            string[] sql = new string[1];
            sql[0] = "Insert into registro_event (FK_idEvento,FK_idusuario)";
            sql[0] += "VALUES('" + pkEvento + "', '" + pkUsuario + "');";
            return conn.RealizarTransaccion(sql);
        }


        public bool Registrar_cronograma(string fk_evento, string fk_usuario, string tema, string fecha, string hora)
        {
            string[] sql = new string[1];
            sql[0] = "insert into cronograma (fk_idEvento,fk_idusuario,tema,fecha,hora)";
            sql[0] += "VALUES(" + fk_evento + ", " + fk_usuario + ",' " + tema + "','" + fecha + "','" + hora + "');";
            return conn.RealizarTransaccion(sql);


        }

        public string Registrar_asistencia(string id_uario, string id_evento)
        {
            string[] sql = new string[1];
            sql[0] = "insert into asis (fk_usuario, Evento_idEvento) values('" + id_uario + "','" + id_evento + "')";

            return conn.RealizarTransaccionString(sql);
        }



        public string Registrar_refrigerios(string id_uario, string id_evento)
        {
            string[] sql = new string[1];
            sql[0] = "insert into refri (fk_evento,fk_usuario ) values('" + id_uario + "','" + id_evento + "')";

            return conn.RealizarTransaccionString(sql);
        }

        








        public bool eliminar_usu_evento(string pkEvento, string pkUsuario)
        {
            string[] sql = new string[1];
            sql[0] = @"DELETE FROM registro_event WHERE FK_idEvento = '" + pkEvento + @"' 
                 AND FK_idusuario = '" + pkUsuario + "' ;";
            return conn.RealizarTransaccion(sql);
        }



        public DataTable consultarEventoPartc(string pk_participante)
        {
            string sql = @"select idEvento,Nombre,
            if (EXISTS(select FK_idEvento from registro_event where registro_event.FK_idusuario='" + pk_participante + @"' and registro_event.FK_idEvento = evento.idEvento),'Si','No')as 'EXISTE' from evento
            where evento.estado='activo' and evento.fecha_creacion>=now()  order by Nombre;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultarEventosAdmin()
        {
            string sql = @"select idEvento, Nombre ,Descripcion from evento where estado='activo' and  fecha_creacion>now() order by  Nombre ;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable consultarImagenEventos()
        {
            string sql = @"select galeria.foto from galeria 
            inner join galeria_eventos as ge on ge.FK_idGaleria =galeria.idGaleria
            inner join evento as eve on eve.idEvento= ge.FK_idEvento;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }
        public DataTable consultar_detalle_eventos(string fecha_ini, string fecha_fin)
        {
            string sql = @"select evento.Nombre,usuario.nombres, usuario.apellidos ,rol.Nombre_Rol as'Nombre Rol' from usuario 
             inner join registro_event on registro_event.FK_idusuario=usuario.idusuario
             inner join evento on evento.idEvento=registro_event.FK_idEvento
             inner join usuario_rol on usuario.idusuario=usuario_rol.Usuario_idUsuario
             inner join rol on rol.idRol=usuario_rol.Rol_idRol
             where evento.Fecha_creacion BETWEEN '" + fecha_ini + "' and '" + fecha_fin + @"'
			 ORDER BY evento.Nombre  , rol.Nombre_Rol;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultar_evento_crono()
        {
            string sql = @"select evento.Nombre ,evento.idEvento from evento where  fecha_creacion>now() or Fecha_fin>=now()  ;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable consultar_actividad_ponent()
        {
            string sql = @"select evento.Nombre ,evento.idEvento from evento  where (evento.Fecha_creacion >= now() or e.Fecha_fin>=now());";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultar_evento_Update()
        {
            string sql = @"select e.idEvento,e.Nombre,e.Descripcion,date_format(e.Fecha_creacion,'%d/%m/%Y') as fecha ,
            date_format(e.Fecha_fin,'%d/%m/%Y')as fecha_fin,e.Hora 
            from evento as e where e.Estado='activo'; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultar_evento_Update_director(string pk_director)
        {
            string sql = @"select e.idEvento,e.Nombre,e.Descripcion,date_format(e.Fecha_creacion,'%d/%m/%Y') as fecha ,
            date_format(e.Fecha_fin,'%d/%m/%Y')as fecha_fin,e.Hora 
            from evento as e where e.Estado='activo'and e.director_evento='"+ pk_director + "' and e.Fecha_creacion >= now() and e.Fecha_fin >=now() ; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable consulta_certificado(string id_usuario, string id_event)
        {
            string sql = @"select evento.Nombre,FORMAT(usuario.cedula,0) as cedula,concat(usuario.nombres,' ',usuario.apellidos) as 'Nombre_usu' from evento
            inner join registro_event on registro_event.FK_idEvento=evento.idEvento
            inner join usuario on usuario.idusuario=registro_event.FK_idusuario where usuario.idusuario='" + id_usuario + "' and evento.idEvento='" + id_event + "';";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable consultar_evento_fechas_director(string pk_evento)
        {
            string sql = @"select e.idEvento,e.Nombre,e.Descripcion,date_format(e.Fecha_creacion,'%d/%m/%Y') as fecha ,
            date_format(e.Fecha_fin,'%d/%m/%Y')as fecha_fin,e.Hora 
            from evento as e where e.Estado='activo'and e.idEvento='" + pk_evento + "' ; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }






        public bool RealizarUpdate(string nombre, string descripion, string fecha, string fecha_fin, string hora, string pk)
        {
            string[] sql = new string[1];
            sql[0] = @"UPDATE evento SET Nombre='" + nombre + "', Descripcion = '" + descripion + "', Fecha_creacion = '" + fecha + "', Fecha_fin ='" + fecha_fin + "', Hora ='" + hora + "'WHERE idEvento= '" + pk + "';";
            return conn.RealizarTransaccion(sql);
        }




    }
}