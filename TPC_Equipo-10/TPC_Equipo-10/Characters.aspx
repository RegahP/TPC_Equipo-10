﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Characters.aspx.cs" Inherits="TPC_Equipo_10.Characters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <div class="container" style="display: flex; justify-content: space-between">
            <asp:Button Id="charCreation" runat="server" Cssclass="btn btn-danger" text="Crear Personaje" onClick="charCreation_Click"/>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-success" type="submit">Buscar</button>
            </form>
        </div>
        <div class="d-flex justify-content-md-center align-items-center vh-100">
            <h1>Characters</h1>
        </div>
    </div>
</asp:Content>
