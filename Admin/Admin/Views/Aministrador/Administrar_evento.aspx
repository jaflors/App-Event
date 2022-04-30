<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Administrar_evento.aspx.cs" Inherits="Admin.Views.Aministrador.Administrar_evento" %>
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
                                <asp:listbox id="evento" runat="server" cssclass="form-control"
                                    onselectedindexchanged="List_Click" autopostback="true"></asp:listbox>
                            </div>

                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                <label id="nombrePro" runat="server" for="ex4">Evento selecionado:</label>
                                <asp:textbox id="nombreEvento" runat="server" readonly="true"
                                    cssclass="form-control"></asp:textbox>
                            </div>

                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                <label id="descripcion" runat="server" for="ex4">Descripcion Evento.</label>

                                <asp:textbox id="texto" runat="server" readonly="true" height="89" width="320"
                                    bordercolor="#D3D3D3" borderstyle="Solid" borderwidth="1"></asp:textbox>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <br />

                                            <label id="Label1" runat="server" for="ex4">Sitios Disponibes.</label>
                                            <asp:listbox id="ListarSitioDiponibles" cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple"></asp:listbox>
                                            <br />
                                        </div>
                                        <div class="col-md-1  form-group">
                                            <br />
                                            <br />
                                            <br />
                                            <asp:button id="Asignar" runat="server" text=">" onclick="Cambiar_Sitios" width="28px" />
                                            <br />
                                            <br />
                                            <asp:button id="noAsignar" runat="server" text="<" onclick="noAsignar_Click" width="28px" />

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <br />

                                            <label for="ex4">Sitios a asignar</label>
                                            <asp:listbox id="listaSitioAsignados" cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple"></asp:listbox>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="row">
                                            <br />
                                            <br />
                                            <br />
                                            
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <asp:button cssclass="btn btn-success" id="asignarVariable" runat="server"
                                                    text="Asignar Sitios" onclick="asignarSitio_Click" />
                                            </div>
                                        </div>




                                        <%-- otros materiales --%>
                                        <div class="col-md-4 col-md-offset-1 form-group">
                                            <br />

                                            <label for="ex4">Materiales Disponibes</label>
                                            <asp:listbox id="Lista_Materiales"  cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple"></asp:listbox>
                                            <br />
                                        </div>
                                        <div class="col-md-1  form-group">
                                            <br />
                                            <br />
                                            <br />
                                            <asp:button id="Button1" runat="server" text=">" onclick="Mover_Materiales" width="28px" />
                                            <br />
                                            <br />
                                            <asp:button id="Button2" runat="server" text="<" onclick="Devolver_Materiales" width="28px" />
                                            <br />
                                        </div>
                                        <div class="col-md-4  form-group">
                                            <br />
                                            <label for="ex4">Materiales a asignar</label>
                                            <asp:listbox id="Lista_Materiales_Asig" cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple"></asp:listbox>
                                            <br />
                                            <br />
                                        </div>


                                        <div class="row">
                                            <br />
                                            <br />
                                            <br />
                                           
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <asp:button cssclass="btn btn-success" id="Button3" runat="server"
                                                    text="Asignar Material " onclick="AsignarMateriales_Click" />
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
