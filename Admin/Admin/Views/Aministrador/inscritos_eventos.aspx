<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="inscritos_eventos.aspx.cs" Inherits="Admin.Views.Aministrador.inscritos_eventos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Inscritos por eventos <small>Session</small></h2>
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
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"></div>
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"></div>
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group"></div>
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                <br />
                                <br />
                                <br />
                                <br />
                                <a href="../Reportes/Vista_reportes.aspx?tipo=5" class="btn btn-success">Generar Reporte</a>
                            </div>
                        </div>


                   
                    <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                            <tr>

                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Cedula</th>
                                  <th>Correo</th>
                               
                                


                            </tr>
                        </thead>


                        <tbody>
                            <asp:ListView runat="server" ID="listview1">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("nombres")%> </td>
                                        <td><%#Eval("apellidos")%> </td>
                                        <td><%#Eval("cedula")%> </td>
                                        <td><%#Eval("correo")%> </td>
                                        
                                        
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>


                        </tbody>
                    </table>
                         </form>
                </div>
            </div>
        </div>
    </div>






















</asp:Content>
