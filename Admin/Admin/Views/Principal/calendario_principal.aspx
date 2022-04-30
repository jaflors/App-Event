<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendario_principal.aspx.cs" Inherits="Admin.Views.Principal.calendario_principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link href="../../web_dev/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />


</head>
<body>
    <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Calendario de eventos</h2>
        </div>

     <form id="form1" runat="server">
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
         <br />
         <div class="container">
         <a class="btn btn-primary" href="../Principal/Index.aspx"> volver </a>
             </div>
    </form>
</body>
</html>
