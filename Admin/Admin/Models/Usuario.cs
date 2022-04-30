using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Usuario
    {
        BdComun  conn = new BdComun();
        public string p_nombre { get; set; }
        public string p_apellidos { get; set; }
        public string p_cedula { get; set; }
        public string p_correo { get; set; }
        public string p_contrasena { get; set; }
        public string p_recontrasena { get; set; }
       
        public bool insertusu(Usuario obj, string rutaimg)
        {
            Parameter[] para = new Parameter[7];

            para[0] = new Parameter("p_nombre", obj.p_nombre);
            para[1] = new Parameter("p_apellidos", obj.p_apellidos);
            para[2] = new Parameter("p_cedula", obj.p_cedula);
            para[3] = new Parameter("p_correo", obj.p_correo);
            para[4] = new Parameter("p_contrasena", obj.p_contrasena);
            para[5] = new Parameter("p_recontrasena", obj.p_recontrasena);
            para[6] = new Parameter("p_imagen", rutaimg);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_usuario", para);
            return conn.Transaction(trans);


        }



        public bool insertusu_Admin(Usuario obj, string pk_rol, string rutaimg)
        {
            Parameter[] para = new Parameter[8];

            para[0] = new Parameter("p_nombre", obj.p_nombre);
            para[1] = new Parameter("p_apellidos", obj.p_apellidos);
            para[2] = new Parameter("p_cedula", obj.p_cedula);
            para[3] = new Parameter("p_correo", obj.p_correo);
            para[4] = new Parameter("p_contrasena", obj.p_contrasena);
            para[5] = new Parameter("p_recontrasena", obj.p_recontrasena);
            para[6] = new Parameter("p_rol", pk_rol);
            para[7] = new Parameter("p_imagen", rutaimg);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_usu_Admin", para);
            return conn.Transaction(trans);


        }

        public bool update_usu (string nombre, string apellido, string correo, string contrasena, string pk_usu, string idrol)
        {
           Parameter[] para = new Parameter[6];
            para[0] = new Parameter("p_nombre", nombre);
            para[1] = new Parameter("p_apellido", apellido);
            para[2] = new Parameter("p_correo", correo);
            para[3] = new Parameter("p_contrasena", contrasena);
            para[4] = new Parameter("p_idusuario", pk_usu);
            para[5] = new Parameter("p_idrol", idrol);

            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("update_uauario", para);
            return conn.Transaction(trans);



        }



        public DataTable Mis_eventos_iscrito( string pk_usuario)
        {
            string sql = @"select concat(usuario.nombres,' ',usuario.apellidos) Participante, 
			evento.Nombre as 'Nombre evento', evento.idEvento,
            DATE_FORMAT(evento.Fecha_creacion,'%d/%m/%Y') as'Fecha inicio',
            DATE_FORMAT(evento.Fecha_fin,'%d/%m/%Y')  as 'Fecha fin' from evento
            inner join registro_event on registro_event.FK_idEvento=evento.idEvento
            inner join usuario on registro_event.FK_idusuario=usuario.idusuario where usuario.idusuario='" + pk_usuario +"';";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable ConsultarDatosPersonas()
        {
            string sql = @"SELECT usu.idusuario as idusuario,usu.nombres as Nombres,usu.apellidos as Apellidos,usu.correo as Correo,R.Nombre_Rol as Rol FROM usuario usu 
            inner join usuario_rol as ur on usu.idusuario = ur.Usuario_idUsuario
            inner join rol as R on R.idRol = ur.Rol_idRol
			where usu.estado='A'order by usu.nombres; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }



        public DataTable ConsultarUsuarios()
        {
            string sql = @"SELECT usu.idusuario as idusuario,concat(usu.nombres,' ',usu.apellidos) as nombres,usu.correo as Correo,R.Nombre_Rol as Rol FROM usuario usu 
            inner join usuario_rol as ur on usu.idusuario = ur.Usuario_idUsuario
            inner join rol as R on R.idRol = ur.Rol_idRol
			where usu.estado='A'order by usu.nombres;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }




        public DataTable ConsultarParticipante( string pk)
        {
            string sql = @"SELECT nombres,apellidos,correo,contrasena,recontrasena FROM usuario WHERE idusuario='" + pk + "'";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }



        public DataTable consultar_ponente()
        {
            string sql = @"select usu.nombres, usu.apellidos, usu.idusuario from usuario as usu
            inner join usuario_rol as ur on ur.Usuario_idUsuario= usu.idusuario 
            where usu.estado='A' and ur.Rol_idRol=3 ; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultar_dias_por_evento(string id_event,string id_usuario)
        {
            string sql = @"select count(usuario.idusuario) as 'dias asistido',DATEDIFF( evento.Fecha_fin ,evento.Fecha_creacion)+1 as dias from usuario
            inner join asis on usuario.idusuario = asis.fk_usuario
            inner join evento  on evento.idEvento =asis.Evento_idEvento
            where asis.Evento_idEvento='"+ id_event + "'and usuario.idusuario= '"+ id_usuario + "'; ";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public bool RealizarUpdate_Participante(string nombre, string apellido, string correo, string contrasena, string pk)
        {
            string[] sql = new string[1];
            sql[0] = "UPDATE usuario SET nombres='" + nombre + "', apellidos = '" + apellido + "', correo = '" + correo + "', contrasena=md5('" + contrasena + "')WHERE idusuario= '" + pk + "';";
            return conn.RealizarTransaccion(sql);
        }


        public bool Cambiar_estado_usu( string pk)
        {
            string[] sql = new string[1];
            sql[0] = "UPDATE usuario SET estado='I' WHERE idusuario= '" + pk + "'; ";
            return conn.RealizarTransaccion(sql);
        }





        public DataTable ConsultarCuenta(Usuario obj)
        {
            
            string sql = "SELECT * FROM usuario WHERE correo='" + obj.p_correo + "'AND contrasena=md5('" + obj.p_contrasena + "') ;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }




        public DataTable  InsertarUsuario(Usuario obj)
        {
            string sql = "INSERT INTO usuario (nombres,apellidos,correo,contrasena,recontrasena) VALUES('" + obj.p_nombre + "','" + obj.p_apellidos + "','" + obj.p_correo + "','" + obj.p_contrasena + "','"+obj.p_recontrasena+ "'))";
            return conn.EjecutarConsulta(sql, CommandType.Text);

        }



        public DataTable consultarMenu(string idCuenta)
        {
            string sql = @"select menu.`idMenú`,menu.Titulo,menu.Icono,vista.idVista,vista.nombre,vista.url,vista.icono,vista.Menu_idMenu  from menu inner join vista on menu.`idMenú`=vista.Menu_idMenu
                         inner join rol_vista on vista.idVista=rol_vista.vista_idVista
                         inner join rol on rol.idRol=rol_vista.rol_idRol
                         inner join usuario_rol on usuario_rol.Rol_idRol=rol.idRol
                         inner join usuario on usuario.idusuario=usuario_rol.Usuario_idUsuario 
                         where usuario.idusuario='" + idCuenta+"';";

            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable ConsultarIMG(string pk_usuario)
        {
            string sql = @"select g.foto from galeria as g 
	        inner join usuario_galeria as ug  on g.idGaleria =FK_idGaleria
            where ug.FK_idusuario= '" + pk_usuario + "';";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }


        public DataTable ConsulNombreRol(string pk_usuario)
        {
            string sql = @"select Nombre_Rol from rol
	        inner join usuario_rol as ur on ur.rol_idRol= rol.idRol
	        inner join usuario on usuario.idusuario= ur.Usuario_idUsuario
	        where  usuario.idusuario= '" + pk_usuario + "';";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }






    }
}