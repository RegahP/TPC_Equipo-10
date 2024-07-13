<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="TPC_Equipo_10.Game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div id="gameCanvas"></div>
    </div>
    <script src="Scripts/ajaxread.js"></script>
    <script src="Scripts/ajaxwrite.js"></script>
    <script src="Scripts/cutscenes.js"></script>
    <script src="Scripts/combat.js"></script>
    <script src="Scripts/store.js"></script>
    <script src="Scripts/town.js"></script>
    <script src="Scripts/main.js"></script>
    <script src="Scripts/tools.js"></script>

</asp:Content>
