<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="RSitio.aspx.cs" Inherits="Admin.Views.Sitio.RSitio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
              <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Registrar Sitio<small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                   

                     <form runat="server" id="form1" method="post" name="form1">
                      <span class="section">Sitio</span>

                      <div class="item form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nombre del Sitio <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" runat="server" class="form-control col-md-7 col-xs-12"   name="name" placeholder="Nombre Del Sistema" required="required" type="text">
                        </div>
                      </div>
                      
                   
                      <div class="ln_solid"></div>
                    
                        <div class="col-md-6 col-md-offset-3">
                            <asp:Button ID="Button1" runat="server" Text="Cancelar"   CssClass="btn btn-primary" OnClick="Button1_Click1"/>
                            <asp:Button ID="Button2" runat="server" Text="Publicar"  CssClass="btn btn-success" OnClick="Button2_Click1" />
                        </div>
                      
                         </form>
                    </div>
                  </div>
                
              </div>
            </div>



</asp:Content>
