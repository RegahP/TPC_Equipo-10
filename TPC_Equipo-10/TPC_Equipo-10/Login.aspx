﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Equipo_10.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btn-danger, toReg {
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
        <div class="container form-control" style="background-color: beige; padding-top: 25px; border-width: medium; border-color: black;">
            <h4 class="title" style="display: flex; justify-content: center">¡VUELVE EL HEROE!</h4>
            <div class="mb-3 row">
                <label for="inputUsername" class="col-sm-2 col-form-label">Usuario</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputUsername">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword">
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:Button ID="btnBack" CssClass="btn btn-danger" Text="Volver" OnClick="btnBack_Click" runat="server" />
                    <asp:Button ID="btnLoginConfirm" CssClass="btn btn-danger" Text="Ingresar" OnClick="btnLoginConfirm_Click" runat="server" />
                </div>
                <a class="toReg" style="display: flex; justify-content: right" href="/Register.aspx">No tenes una cuenta todavía?</a>
            </div>
        </div>
    </div>
</asp:Content>
