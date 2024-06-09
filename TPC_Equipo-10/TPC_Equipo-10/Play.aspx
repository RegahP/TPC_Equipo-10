<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="TPC_Equipo_10.Play" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <button class="btn btn-danger" type="submit">Seleccionar Personaje</button>
        <a href="/Game.aspx">Jugar</a>
    </div>
</asp:Content>
