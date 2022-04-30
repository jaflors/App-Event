<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Actualizar_usuario.aspx.cs" Inherits="Admin.Views.Aministrador.Actualizar_usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Actualizar Usuario <small>Session</small></h2>
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
                                <label for="ex4">Seleccione el Usuario</label>
                                <asp:ListBox ID="usuario" runat="server" CssClass="form-control"
                                    OnSelectedIndexChanged="List_Click" AutoPostBack="true" Height="244px"></asp:ListBox>
                            </div>
                            <div class="col-md-8">
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
                                                        <label>Rol</label>
                                                        <asp:TextBox ID="rol" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>

                                               <%-- <div class="col-md-6 ">
                                                    <div class="form-group">
                                                        <label>Actualiza Rol </label>
                                                        <asp:TextBox ID="Textbox1" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                </div>--%>



                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <label>Actualiza Rol </label>
                                                    <div class="form-group">
                                                        <select class="form-control" id="Select1" runat="server">

                                                            <option>Rol option</option>
                                                            <option>Administrador</option>
                                                            <option>Ponente</option>
                                                            <option>Participante</option>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-lg-4"></div>
                                                <div class="col-md-4">
                                                    <br />
                                                    <asp:Button ID="Button1" align="center" Class="btn btn-success" Text="Actualizar" OnClick="Button1_Click" runat="server" />
                                                    <asp:Button ID="Button2" align="center" Class="btn btn-success" Text="Eliminar" OnClick="eliminar" runat="server" />
                                                    <br />
                                                </div>
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
