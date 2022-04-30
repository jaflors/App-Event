<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Registrase_Event.aspx.cs" Inherits="Admin.Views.Participante.Registrase_Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
               <div class="x_title">
                    <h2>Inscripción evento <small>Session</small></h2>
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
                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                          
                                        <%-- otros eventos --%>
                                        <div class="col-md-4 col-md-offset-1 form-group">
                                            <br />
                                           
                                            <label for="ex4">Eventos Disponibes</label>
                                            <asp:listbox id="Lista_Eventos"  cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple" ></asp:listbox>
                                            <br />
                                        </div>
                                        
                                        <div class="col-md-1  form-group">
                                            <br />
                                            <br />
                                            <br />
                                            <asp:button id="Button1" runat="server" text=">" onclick="Mover_Evento" width="28px" />
                                            <br />
                                            <br />
                                            <asp:button id="Button2" runat="server" text="<" onclick="Devolver_Evento" width="28px" />
                                            <br />
                                        </div>
                                        <div class="col-md-4  form-group">
                                            <br />
                                            <label for="ex4">Eventos a Registrarse</label>
                                            <asp:listbox id="Lista_Event_Asig" cssclass="select2_multiple form-control" runat="server" selectionmode="Multiple" ></asp:listbox>
                                            <br />
                                            <br />
                                        </div>


                                        <div class="row">
                                            <br />
                                            <br />
                                            <br />
                                           
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <asp:button cssclass="btn btn-success" id="Button3" runat="server"
                                                    text="Registrase a Evento " onclick="AsignarEvento_Click" />
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
