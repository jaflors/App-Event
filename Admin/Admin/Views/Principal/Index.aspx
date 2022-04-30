<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Principal/Principal.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Admin.Views.Principal.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <br />
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>


            <!-- Wrapper for slides -->
            <div class="carousel-inner" runat="server" id="Baner">
                <%--<div class="item active">
            <img src="../../carousel/images/banner/uni2.jpg" />
        </div>

        <div class="item">
            <img src="../../carousel/images/banner/uni1.jpg" />
        </div>

        <div class="item">
            <img src="../../carousel/images/banner/uni4.jpg" />
        </div>

        <div class="item">
            <img src="../../carousel/images/banner/uni5.jpg" />
        </div>--%>
            </div>


            <h4><a target="_parent" title="ola como vas " href="Login.aspx"></a></h4>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Siguiente</span>
            </a>
        </div>
       
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Calendario de eventos</h2>
                    <br />
                    <a Class='btn btn-fill btn-success btn-wd' href="../Principal/calendario_principal.aspx"> Ver Calendario  </a>
				</div>

              
                  
				
              


			

        <%--<form id="form1" runat="server">
        <div align="center" style="padding-top:4%;" >
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="513px" Width="1095px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#33666" Font-Size="10pt" Height="25px"></DayHeaderStyle>

                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>

                <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"></SelectedDayStyle>

                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>

                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px"></TitleStyle>

                <TodayDayStyle BackColor="#99CCCC" ForeColor="White"></TodayDayStyle>

                <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>
            </asp:Calendar>
        </div>
    </form>--%>



    </div>








</asp:Content>
