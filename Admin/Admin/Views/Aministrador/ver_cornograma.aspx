<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="ver_cornograma.aspx.cs" Inherits="Admin.Views.Aministrador.ver_cornograma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Cronograma de  Evento <small>Session</small></h2>
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
                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                <label for="ex4">Seleccione el evento</label>
                                <asp:ListBox ID="evento" runat="server" CssClass="form-control"
                                    OnSelectedIndexChanged="List_Click" AutoPostBack="true"></asp:ListBox>
                            </div>



                        </div>

                    </form>
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                              
                                <th>Nombre Evento</th>
                                <th>Ponente</th>
                                <th>Tema</th>
                                <th>Hora</th>
                                <th>Fecha</th>

                            </tr>
                        </thead>


                        <tbody>
                            <asp:listview runat="server" ID="listview1">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Nombre")%> </td>
                                         <td><%#Eval("Ponente")%> </td>
                                         <td><%#Eval("Tema")%> </td>
                                         <td><%#Eval("Hora")%> </td>
                                         <td><%#Eval("Fecha_creacion")%> </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:listview>

                           <%-- <%for (int i = 0; i < dteventinfo.Rows.Count; i++)
                                {
                                    drConsulta =  dteventinfo.Rows[i];
                            %>
                            <tr class='<%= (i % 2 == 0 ? "info" : "warning") %>'>
                                <td><%= (i+1)%></td>
                                <td><%=drConsulta["Nombre"].ToString().ToUpper() %></td>
                                <td><%=drConsulta["Ponente"].ToString().ToUpper() %></td>
                                <td><%=drConsulta["Tema"].ToString().ToUpper() %></td>
                                <td><%=drConsulta["Hora"].ToString().ToUpper() %></td>
                                <td><%=drConsulta["Fecha_creacion"].ToString().ToUpper() %></td>

                            </tr>
                            <%} %>--%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
     </div>






</asp:Content>






















