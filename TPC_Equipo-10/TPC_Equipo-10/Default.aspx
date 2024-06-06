<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Equipo_10.Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn-danger {
            margin-right: 5px;
        }

        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100" style="background-image: url(https://st4.depositphotos.com/2866075/26868/i/450/depositphotos_268682238-stock-photo-stained-old-brown-paper-texture.jpg); background-position: center; background-size: cover;">
        <div class="container text-center">
            <div class="row">
                <h1 class="title">Chambers & Wyverns</h1>
            </div>
            <div class="row">
                <p>¡Conquista, Colecciona, y Asciende!</p>
            </div>
            <div class="container" style="display: flex; justify-content: center; height: 50px; width: fit-content">
                <img src="https://logos-world.net/wp-content/uploads/2021/12/DnD-Emblem.png" alt="D&D logo" style="height: 100%; width: 100%" />
                <div class="container" style="display: flex; justify-content: center">
                    <asp:Button ID="btnLogin" CssClass="btn btn-danger" Text="Ingresar" OnClick="btnLogin_Click" runat="server" />
                    <asp:Button ID="btnRegister" CssClass="btn btn-danger" Text="Registrarse" OnClick="btnRegister_Click" runat="server" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
