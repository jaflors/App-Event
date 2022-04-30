<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="mis_eventos.aspx.cs" Inherits="Admin.Views.Participante.mis_eventos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Eventos Inscrito<small>Session</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Settings 1</a>
                                </li>
                                <li><a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <form runat="server" class="form-horizontal form-label-left">
                        <div class="row">
                            
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                <a href="../Reportes/Vista_reportes.aspx?tipo=3" class="btn btn-success">Generar Reporte</a>
                            </div>

                            </div>
                            </form>



                  
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                              
                                <th>Participante</th>
                                <th>Nombre Evento</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Fin</th>
                                

                            </tr>
                        </thead>


                        <tbody>
                            
                            <%for (int i = 0; i <  dtevent.Rows.Count; i++)
                                {
                                    drevent =  dtevent.Rows[i];
                            %>
                            <tr class='<%= (i % 2 == 0 ? "info" : "warning") %>'>
                                
                                <td><%=drevent["Participante"].ToString().ToUpper() %></td>
                                <td><%=drevent["Nombre Evento"].ToString().ToUpper() %></td>
                                <td><%=drevent["Fecha Inicio"].ToString().ToUpper() %></td>
                                <td><%=drevent["Fecha Fin"].ToString().ToUpper() %></td>
                                

                            </tr>
                            <%} %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
     </div>










</asp:Content>
