<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="consultar_eventos.aspx.cs" Inherits="Admin.Views.Participante.consultar_eventos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Eventos Registrados<small> gallery design </small></h2>
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

                    <div class="row">

                        <p>Galeria de Eventos</p>

                        <%  for (int i = 0; i < dtevent.Rows.Count; i++)
                            {
                                drevent = dtevent.Rows[i];

                                
                                %>

                        <div class="col-md-4 text-center">
                            <div class="thumbnail">
                                <div class="image view view-first">
                                    <img style="width: 100%; height:100%; display: block;" src=" <%= drevent["foto"] %>" alt="image" />
                                    <div class="mask">
                                        <p>Inscribirse </p>
                                        
                                        <div class="tools tools-bottom">
                                            
                                            <a href="../../Views/Participante/Registrase_Event.aspx"><i class="fa fa-pencil"></i></a>
                                            
                                        </div>
                                    </div>
                                </div>
                          <div class="caption">
                            <p><%= drevent["Nombre"] %></p>
                            <p> Lugar: <%= drevent["Nombre_sitio"] %></p>
                            
                          </div>
                              
                        </div>
                      </div>

                        <%}%>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>










</asp:Content>
