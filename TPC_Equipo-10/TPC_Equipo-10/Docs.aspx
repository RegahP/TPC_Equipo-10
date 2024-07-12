<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Docs.aspx.cs" Inherits="TPC_Equipo_10.Docs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }

        .container-xl {
            background-color: beige;
            padding-top: 10px;
            position: absolute;
        }

        .classImg {
            width: 40%;
        }

        .classInfo {
            margin-bottom: 30px;
            border-bottom: 3px solid;
            border-color: azure;
            padding-bottom: 15px;
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
        <div class="container" style="padding-bottom: 10px">
            <h1 class="title" style="display: flex; justify-content: center">ARCANAMIRIUM</h1>
            <img style="width: inherit;" src="https://images.ctfassets.net/swt2dsco9mfe/5rEqeLK8cYTcvpGHLfW34/5982b8c357d84061c77fd24aff1287e6/1920x600-candlekeep-.jpg?q=70" alt="" />
            <p>
                Bienaventurados los ojos que hayan llegado al Arcanamirium, hogar de los saberes.
               Aqui podras saciar tu sed de conocimiento, solventar tus dudas y reforzar tus estudios.
            </p>
            <p>Dime... ¿Que es aquello que sobre lo que deseas aprender?</p>
            <ul class="list-group list-group-flush" style="padding: 5px">
                <li class="list-group-item"><a href="ClassesInfo.aspx">Clases</a></li>
                <li class="list-group-item"><a href="RacesInfo.aspx">Razas </a></li>
                <li class="list-group-item"><a href="BackgroundsInfo.aspx">Trasfondos</a></li>
                <li class="list-group-item"><a href="#weapon">Armas</a></li>
                <li class="list-group-item"><a href="#armor">Armaduras</a></li>
                <li class="list-group-item"><a href="#shield">Escudos</a></li>
                <li class="list-group-item"><a href="#consumables">Consumibles</a></li>
                <li class="list-group-item"><a href="#items">Objetos comerciables</a></li>
                <li class="list-group-item"><a href="#creatures">Criaturas</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
