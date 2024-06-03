<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_10.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100" style="background-color:antiquewhite">
        <div class="container text-center">
            <div class="row">
                <h1>Chambers & Wyverns</h1>
            </div>
            <div class="row">
                <p>Conquista, Colecciona, y Asciende!</p>
            </div>
            <div class="container" style="display:flex; justify-content:center">
                <asp:Button ID="btnLogin" CssClass="btn btn-danger" Text="Ingresar" OnClick="btnLogin_Click" runat="server" />
                <asp:Button ID="btnRegister" CssClass="btn btn-danger"  Text="Registrarse" OnClick="btnRegister_Click" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
