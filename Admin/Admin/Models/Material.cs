using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin.Models
{
    public class Material
    {
        BdComun conn = new BdComun();
        public string Nombre;
        public string Descripcion;

        public Material()
        {

        }


        public bool insert_Material(Material obj)
        {
            Parameter[] para = new Parameter[2];

            para[0] = new Parameter("p_Nombre", obj.Nombre);
            para[1] = new Parameter("p_Descripcion", obj.Descripcion);
           
            Transaction[] trans = new Transaction[1];
            trans[0] = new Transaction("insert_material", para);
            return conn.Transaction(trans);


        }




        public DataTable consultarMateial(string pk_evento)
        {
            string sql = @"select idMaterial__Evento,Nombre_Material,
	        if (EXISTS(select FK_idEvento from detalle_material where detalle_material.FK_idEvento=  '" + pk_evento + @"' and detalle_material.FK_idMaterial = material.idMaterial__Evento),'Si','No')as 'EXISTE' from material
            where Material.estado='A' order by Nombre_Material;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }

        public DataTable consultarMateial_grid()
        {
            string sql = @"SELECT Nombre_Material as Nombre,Descripcion,estado as Estado FROM material;";
            return conn.EjecutarConsulta(sql, CommandType.Text);
        }




        public bool asignarMaterial(string pkEvento, string pkMaterial)
        {
            string[] sql = new string[1];
            sql[0] = "Insert into detalle_material (FK_idEvento,FK_idMaterial)";
            sql[0] += "VALUES(" + pkEvento + ", " + pkMaterial + ");";
            return conn.RealizarTransaccion(sql);
        }

        public bool eliminarAsignado(string pkEvento, string pkMaterial)
        {
            string[] sql = new string[1];
            sql[0] = @"DELETE FROM detalle_material WHERE FK_idEvento = '" + pkEvento + @"' 
                 AND FK_idMaterial = '" + pkMaterial + "' ;";
            return conn.RealizarTransaccion(sql);
        }







    }
}