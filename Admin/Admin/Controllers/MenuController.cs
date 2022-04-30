using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace Admin.Models
{
    public class MenuController
    {
        public void CargarMenu(string Login, HtmlGenericControl MenuGeneral)
        {
            Usuario Usuari = new Usuario();
            DataTable Data = Usuari.consultarMenu(Login);

            List<Menu> Nivel = new List<Menu>();
            //CREAR MENUS GENERALES
            DataTable First_Level = Data.AsEnumerable().Select(row =>
            {
                DataRow newRow = Data.NewRow();
                newRow["Titulo"] = row.Field<string>("Titulo");
                newRow["Icono"] = row.Field<string>("Icono");
                newRow["idMenú"] = row.Field<Int32>("idMenú");
                return newRow;
            }).Distinct(DataRowComparer.Default).CopyToDataTable();

            foreach (DataRow it in First_Level.Rows)
                Nivel.Add(new Menu(it));
            int index;
            //ASIGNAR VISTAS A MENUS
            foreach (DataRow it in Data.Rows)
            {

                index = IsMenu(it, Nivel, "Menu_idMenu");
                Nivel[index].vistas.Add(new vista(it));

            }
            //CREAR MENU
            HtmlGenericControl ULMENU = new HtmlGenericControl("ul");
            ULMENU.Attributes.Add("class", "nav");
            ULMENU.Attributes.Add("style", "color: white; margin-top: 10px;");
            ULMENU.Attributes.Add("class","nav side-menu");    
            MenuGeneral.Controls.Add(ULMENU);

            foreach (Menu it in Nivel)
            {
                ULMENU.Controls.Add(it.CrearMenu());
            }
        }
        public bool IsCero(DataRow it, string Name)
        {
            if (it[Name].ToString().Equals("0"))
                return true;
            else return false;
        }


        public int IsMenu(DataRow row, List<Menu> menus, string Name)
        {
            int index = 0, ID = Convert.ToInt32(row[Name].ToString());
            foreach (Menu it in menus)
            {
                if (it.id == ID)
                    return index;
                index++;
            }
            return -1;
        }
    }

    public class Menu
    {
        public int id;
        public string Nombre;
        public string Icono;

        public List<vista> vistas = new List<vista>();

        public Menu(DataRow it)
        {
            this.id = Convert.ToInt32(it["idMenú"].ToString());
            this.Nombre = it["Titulo"].ToString();
            this.Icono = it["Icono"].ToString();
        }

        public HtmlGenericControl CrearMenu()
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl ul = new HtmlGenericControl("ul");

            a.InnerHtml = "<i class='" + Icono + "'></i>" + Nombre + "<span class='fa fa-chevron-down'></span>";
            a.Attributes.Add("href", "#");

            ul.Attributes.Add("class", "nav child_menu");
            ul.Attributes.Add("style", "display: none;");


            foreach (vista it in vistas)
            {
                ul.Controls.Add(it.CrearVista());
            }

            li.Controls.Add(a);
            li.Controls.Add(ul);
            return li;
        }
    }



    public class vista
    {
        public int padre;
        public string nombre;
        public string icono;
        public string url;

        public vista(DataRow it)
        {
            this.padre = Convert.ToInt32(it["Menu_idMenu"].ToString());
            this.nombre = it["nombre"].ToString();
            this.icono = it["icono1"].ToString();
            this.url = it["url"].ToString();
        }
        public HtmlGenericControl CrearVista()
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            HtmlGenericControl a = new HtmlGenericControl("a");

            a.InnerHtml = "<i class='" + icono + "'></i>" + nombre;
            a.Attributes.Add("href", Convert.ToString(url));

            li.Controls.Add(a);
            return li;
        }
    }
}