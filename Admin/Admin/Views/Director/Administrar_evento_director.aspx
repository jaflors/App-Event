<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Administrar_evento_director.aspx.cs" Inherits="Admin.Views.Director.Administrar_evento_director" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Administrar Evento <small>Session</small></h2>
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

                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                <label id="nombrePro" runat="server" for="ex4">Evento selecionado:</label>
                                <asp:TextBox ID="nombreEvento" runat="server" ReadOnly="true"
                                    CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                <label id="descripcion" runat="server" for="ex4">Descripcion Evento.</label>

                                <asp:TextBox ID="texto" runat="server" ReadOnly="true" Height="89" Width="320"
                                    BorderColor="#D3D3D3" BorderStyle="Solid" BorderWidth="1"></asp:TextBox>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <br />

                                            <label id="Label1" runat="server" for="ex4">Sitios Disponibes.</label>
                                            <asp:ListBox ID="ListarSitioDiponibles" CssClass="select2_multiple form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                                            <br />
                                        </div>
                                        <div class="col-md-1  form-group">
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Button ID="Asignar" runat="server" Text=">" OnClick="Cambiar_Sitios" Width="28px" />
                                            <br />
                                            <br />
                                            <asp:Button ID="noAsignar" runat="server" Text="<" OnClick="noAsignar_Click" Width="28px" />

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <br />

                                            <label for="ex4">Sitios a asignar</label>
                                            <asp:ListBox ID="listaSitioAsignados" CssClass="select2_multiple form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="row">
                                            <br />
                                            <br />
                                            <br />

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <asp:Button CssClass="btn btn-success" ID="asignarVariable" runat="server"
                                                    Text="Asignar Sitios" OnClick="asignarSitio_Click" />
                                            </div>
                                        </div>




                                        <%-- otros materiales --%>
                                        <div class="col-md-4 col-md-offset-1 form-group">
                                            <br />

                                            <label for="ex4">Materiales Disponibes</label>
                                            <asp:ListBox ID="Lista_Materiales" CssClass="select2_multiple form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                                            <br />
                                        </div>
                                        <div class="col-md-1  form-group">
                                            <br />
                                            <br />
                                            <br />
                                            <asp:Button ID="Button1" runat="server" Text=">" OnClick="Mover_Materiales" Width="28px" />
                                            <br />
                                            <br />
                                            <asp:Button ID="Button2" runat="server" Text="<" OnClick="Devolver_Materiales" Width="28px" />
                                            <br />
                                        </div>
                                        <div class="col-md-4  form-group">
                                            <br />
                                            <label for="ex4">Materiales a asignar</label>
                                            <asp:ListBox ID="Lista_Materiales_Asig" CssClass="select2_multiple form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                                            <br />
                                            <br />
                                        </div>


                                        <div class="row">
                                            <br />
                                            <br />
                                            <br />

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <asp:Button CssClass="btn btn-success" ID="Button3" runat="server"
                                                    Text="Asignar Material " OnClick="AsignarMateriales_Click" />
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
