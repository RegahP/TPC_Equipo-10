<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RacesInfo.aspx.cs" Inherits="TPC_Equipo_10.RacesInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }

        .raceInfo {
            margin-bottom: 30px;
            border-bottom: 3px solid;
            border-color: azure;
            padding-bottom: 15px;
        }

        .containerInfo {
            background-color: beige;
            width: 75%;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
        }

        html {
            scroll-behavior: smooth;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="containerInfo">
        <div class="container" style="padding-bottom: 10px;">
            <h3 class="title" id="race" style="display: flex; justify-content: center">RAZAS</h3>
            <p>Tu raza es parte de lo que eres, tu sangre, tu herencia. Portala con orgullo pues cada una posee su historia y sus capacidades unicas.</p>
            <ul class="list-group list-group-flush" style="padding: 5px; margin-bottom: 30px;">
                <li class="list-group-item"><a href="#Draconido">Draconido</a></li>
                <li class="list-group-item"><a href="#Elfo">Elfo</a></li>
                <li class="list-group-item"><a href="#Enano">Enano</a></li>
                <li class="list-group-item"><a href="#Humano">Humano</a></li>
                <li class="list-group-item"><a href="#Mediano">Mediano</a></li>
                <li class="list-group-item"><a href="#Tiflin">Tiflin</a></li>
            </ul>
        </div>


        <asp:Repeater runat="server" ID="rptRaces">
            <ItemTemplate>
                <div class="raceInfo" style="display: flex">
                    <div style="display: flex; justify-content: left">
                        <canvas class="race-canvas icon" data-race="<%# Eval("id") %>" data-toggle="1" data-format="0" width="128" height="192" style="margin-left: 12px; margin-top: -16px; margin-right: 20px;"></canvas>
                        <div style="justify-content: right">
                            <div style="text-align: center; margin-right: 15%;">
                                <h3 id="<%#Eval("name")%>" class="title"><%#Eval("name")%></h3>
                            </div>
                            <p><%#Eval("desc")%></p>
                            <h4>Pasiva: +2 a su <%# abilityList[(int)Eval("abilityID")].name %></h4>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div style="text-align: center; padding-bottom: 3%;">
            <asp:LinkButton runat="server" ID="btnBack" CssClass="btn btn-danger btn-lg" OnClick="btnBack_Click" Text="Volver"></asp:LinkButton>
        </div>
    </div>

</asp:Content>
