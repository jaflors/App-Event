﻿using Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin.Views.Aministrador
{
    public partial class calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            EventoController evc = new EventoController();
            List<Models.Evento> eve = evc.Calendario();
            for (int i = 0; i < eve.Count; i++)
            {
                if (e.Day.Date == eve[i].fecha)
                {
                    Label labelito = new Label();
                    labelito.Text = "<br>" + eve[i].p_nombre;
                    e.Cell.Controls.Add(labelito);
                }
            }

        }

    }
}