<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Aministrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Cevent.aspx.cs" Inherits="Admin.Views.Aministrador.Cevent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

        <asp:gridview id="eventos" runat="server"   AutoGenerateColumns="true" GridLines="None"  
                AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"  
                PageSize="100"></asp:gridview>
    </form>
</asp:Content>
