<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="TPC_Equipo_10.Play" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        .btnStyle {
            width: 90%;
            margin-left: 15px;
            margin-bottom: 10px;
        }

        .btnMargin {
            margin: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 25px; border-width: medium; border-color: black;">
        <div class="d-flex justify-content-md-center align-items-center vh-100">
            <asp:LinkButton runat="server" ID="btnNewGame" CssClass="btn btn-danger btnMargin btn-lg" Text="Nueva partida" OnClick="btnNewGame_Click"></asp:LinkButton>
            <asp:LinkButton runat="server" ID="LoadGame" CssClass="btn btn-danger btnMargin btn-lg" Text="Cargar partida" OnClick="LoadGame_Click"></asp:LinkButton>
        </div>
    </div>

</asp:Content>



