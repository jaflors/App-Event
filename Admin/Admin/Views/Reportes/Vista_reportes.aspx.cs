using Admin.Conexion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Drawing;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using Admin.Controllers;


namespace Admin.Views.Reportes
{
    public partial class Vista_reportes : System.Web.UI.Page
    {
        public EventoController eve = new EventoController();
        PonenteController pone = new PonenteController();
        UsuarioController usu = new UsuarioController();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                string tipo = Request.Params["tipo"].ToString();
                this.generarReporte(tipo);
            
    
        }

        public void generarReporte(string tipo)
        {
            switch (tipo)
            {
                case "1":
                    DataTable eventos = eve.consultar_detalle_inscripcion(Session["fecha_inicio"].ToString(), Session["fecha_fin"].ToString());
                    reporte_evento reporte = new reporte_evento();
                    reporte.SetDataSource(eventos);
                    CrystalReportViewer1.ReportSource = reporte;
                    CrystalReportViewer1.DataBind();
                    reporte.SetParameterValue("titulo", "REPORTE DE INSCRITOS EVENTOS");
                    reporte.SetParameterValue("empresa","App-Event");
                    reporte.SetParameterValue("universidad", "Univesridad de la Amazonia ");
                    reporte.SetParameterValue("footer", "© Todos los Derechos Reservados | Sistemas de Gestion de Eventos App-Event | Florencia");

                    break;
                case "2":
                    DataTable detalle_event =pone.consultar_info_event(Session["id_evento"].ToString());
                    cronograma_reporte reporte2 = new cronograma_reporte();
                    reporte2.SetDataSource(detalle_event);
                    CrystalReportViewer1.ReportSource = reporte2;
                    CrystalReportViewer1.DataBind();
                    reporte2.SetParameterValue("titulo", "REPORTE DE CRONOGRAMA EVENTO");
                    reporte2.SetParameterValue("empresa", "App-Event");
                    reporte2.SetParameterValue("universidad", "Univesridad de la Amazonia ");
                    reporte2.SetParameterValue("footer", "© Todos los Derechos Reservados | Sistemas de Gestion de Eventos App-Event | Florencia");
                    break;
                case "3":
                    DataTable misevent = usu.mis_eventos_inscrito(Session["login"].ToString());
                    reporte_miseventos reporte3 = new reporte_miseventos();
                    reporte3.SetDataSource(misevent);
                    CrystalReportViewer1.ReportSource = reporte3;
                    CrystalReportViewer1.DataBind();
                    reporte3.SetParameterValue("titulo", "REPORTE EVENTOS INSCRITO");
                    reporte3.SetParameterValue("empresa", "App-Event");
                    reporte3.SetParameterValue("universidad", "Univesridad de la Amazonia ");
                    reporte3.SetParameterValue("footer", "© Todos los Derechos Reservados | Sistemas de Gestion de Eventos App-Event | Florencia");
                    break;
                case "4":
                    DataTable otr = eve.consultar_certificado(Session["login"].ToString(), Session["evento_asistencia"].ToString());
                    reporte_certificado reporte4 = new reporte_certificado();
                    reporte4.SetDataSource(otr);
                    CrystalReportViewer1.ReportSource = reporte4;
                    CrystalReportViewer1.DataBind();
                    reporte4.SetParameterValue("universidad", "Universidad de la Amazonia");
                    reporte4.SetParameterValue("hace", "Hace Constar que");
                    reporte4.SetParameterValue("cedula", "Con CEDULA DE CIUDADANIA No.");
                    reporte4.SetParameterValue("asistio", "Asistió al  evento ");
                    break;

                case "5":
                    DataTable inscritos = eve.consulta_inscritos_eventos(Session["id_evento_inscritos"].ToString());
                    reporte_inscritos reporte5 = new reporte_inscritos();
                    reporte5.SetDataSource(inscritos);
                    CrystalReportViewer1.ReportSource = reporte5;
                    CrystalReportViewer1.DataBind();
                    reporte5.SetParameterValue("titulo", "REPORTE EVENTOS INSCRITO");
                    reporte5.SetParameterValue("empresa", "App-Event");
                    reporte5.SetParameterValue("universidad", "Univesridad de la Amazonia ");
                    reporte5.SetParameterValue("footer", "© Todos los Derechos Reservados | Sistemas de Gestion de Eventos App-Event | Florencia");
                    break;


            }
        }



    }
}