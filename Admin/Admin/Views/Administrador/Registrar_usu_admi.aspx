﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Registrar_usu_admi.aspx.cs" Inherits="Admin.Views.Administrador.Registrar_usu_admi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Usuarios Registrados <small>Session</small></h2>
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
                    <a class="btn btn-primary" data-toggle="modal" data-target="#myModal" >Registrar Usuario</a>
                    <form runat="server" class="form-horizontal form-label-left">



                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                    <tr class="headings">

                                        <th>Nombres </th>
                                        <th>Apellidos</th>
                                        <th>Rol</th>
                                        <th>Estado</th>

                                        <th style="width: 20%">Acción </th>

                                        <th class="bulk-actions" colspan="7">
                                            <a class="antoo" style="color: #fff; font-weight: 500;">Bulk Actions ( <span class="action-cnt"></span>) <i class="fa fa-chevron-down"></i></a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:ListView runat="server" ID="list_usuarios">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("nombres")%> </td>
                                                <td><%#Eval("apellidos")%> </td>
                                                <td><%#Eval("Nombre")%> </td>
                                                <td><%#Eval("estado")%> </td>
                                                <td>
                                                    
                                                    <asp:LinkButton runat="server" OnCommand="Unnamed_Command"  CssClass="btn btn-danger btn-xs" CommandArgument='<%#Eval("idUsuario")%>' CommandName="eliminar"><i class="fa fa-trash-o"></i>
                                                    Eliminar </asp:LinkButton>

                                                    <asp:LinkButton  CommandArgument='<%#Eval("idUsuario")%>' CssClass="btn btn-info btn-xs" OnCommand="traer_usuario" runat="server"  CommandName="traer" ><i class="fa fa-pencil"></i>
                                                    Actualizar</asp:LinkButton>
                                                   
                                                   
                                                  
                                                    
                                                    <%-- data-toggle="modal" data-target="#myModal"--%>
                                                </td>


                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Usuario</h4>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Modal- body-->
                                            <div class="row">


                                                <div class="col-lg-12">
                                                    <br />
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">

                                                            <div class="row">
                                                                <div class="col-md-6 ">
                                                                    <div class="form-group">
                                                                        <label>Nombre</label>

                                                                        <asp:TextBox ID="txt_Nombres" class="form-control" runat="server" required=""></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 ">
                                                                    <div class="form-group">
                                                                        <label>Apellidos</label>
                                                                        <asp:TextBox ID="apellidos" class="form-control" runat="server" required=""></asp:TextBox>

                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6 ">
                                                                    <div class="form-group">
                                                                        <label>Correo</label>

                                                                        <asp:TextBox ID="corre" TextMode="Email" class="form-control" runat="server" required=""></asp:TextBox>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6 ">
                                                                    <div class="form-group">
                                                                        <label>Contraseña</label>

                                                                        <asp:TextBox ID="contra" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6 ">
                                                                    <div class="form-group">
                                                                        <label>Comfirmar Contraseña</label>
                                                                        <asp:TextBox ID="recontra" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"    data-dismiss="modal">Close</button>
                                            <asp:Button ID="guardar" class="btn btn-primary" AutoPostBack="true" runat="server" OnClick="Registrar" Text="Registrar" />

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
