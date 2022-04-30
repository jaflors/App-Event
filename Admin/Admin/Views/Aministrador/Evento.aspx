<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Evento.aspx.cs" Inherits="Admin.Views.Aministrador.Evento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Registro de Evento <small>Session</small></h2>
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
                    <br />
                    <form runat="server" data-parsley-validate class="form-horizontal form-label-left">
                        <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                    Nombre del Evento  <span class="required">*</span>
                                </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="name" runat="server" class="form-control col-md-7 col-xs-12" name="name" placeholder="Nombre Del Evento" required="required" type="text">
                            </div>
                        </div>
                         <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                    Director del Evento  <span class="required">*</span>
                                </label>
                           <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:DropDownList ID="List_usuario" class="form-control" runat="server" AutoPostBack="true"  ></asp:DropDownList>
                               
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                Descripciòn <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="descripcion" runat="server" class="form-control col-md-7 col-xs-12" name="descripcion" placeholder="Descripcion" required="required" type="text"></textarea>

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Fecha</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:TextBox ID="fecha" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                Fecha Finalización <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:TextBox ID="fecha2" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                Hora de Evento<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:TextBox ID="Hora" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                Imagen<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">

                                <asp:FileUpload ID="file_evento" class="form-control" runat="server" required="required" />
                            </div>
                        </div>



                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <asp:Button ID="Button1" class="btn btn-success" runat="server" OnClick="Registrar" Text="Registrar" />
                                
                            </div>
                        </div>

                    </form>
                  </div>
                </div>
              </div>
    </div>

</asp:Content>
