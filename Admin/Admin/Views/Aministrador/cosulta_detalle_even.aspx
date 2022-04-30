<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="cosulta_detalle_even.aspx.cs" Inherits="Admin.Views.Aministrador.cosulta_detalle_even" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">

                <div class="x_title">
                    <h2>Consultas Reportes<small>Users</small></h2>
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

                <form runat="server">
                    <div class="row">

                         <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                              <label  for="first-name">Fecha inicio<span class="required">*</span></label>
                             </div>
                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                            
                            <input id="fecha_inicio" type="date" runat="server" required="required" class="form-control">
                       </div>
                         <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                              <label  for="first-name">Fecha fin<span class="required">*</span></label>
                             </div>
                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                            <input id="fecha_fin" type ="date" runat="server" required="required" class="form-control">
                        </div>
                        
                            <asp:Button ID="Nuevo" CssClass="btn btn-success" EnableViewState="false" runat="server" Text="Consultar" OnClick="Consultar" />
                             <a href="../Reportes/Vista_reportes.aspx?tipo=1" class="btn btn-success">Reporte</a>


                    </div>

                </form>
                <div class="x_content">

                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>N°</th>
                                <th>Nombre Evento</th>
                                <th>Nombres </th>
                                <th>Apellidos </th>
                                <th>Rol </th>

                            </tr>
                        </thead>


                        <tbody>

                            <%for (int i = 0; i < dtConsul.Rows.Count; i++)
                                {
                                    drConsul= dtConsul.Rows[i];
                                        %>
                            <tr class='<%= (i % 2 == 0 ? "info" : "warning") %>'>
                                <td><%= (i+1)%></td>
                                <td><%=drConsul["Nombre"].ToString().ToUpper() %></td>
                                <td><%=drConsul["nombres"].ToString().ToUpper() %></td>
                                <td><%=drConsul["apellidos"].ToString().ToUpper() %></td>
                                <td><%=drConsul["Nombre Rol"].ToString().ToUpper() %></td>
                                
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
