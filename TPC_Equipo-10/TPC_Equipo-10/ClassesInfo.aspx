<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ClassesInfo.aspx.cs" Inherits="TPC_Equipo_10.ClassesInfo" %>

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

        .icon {
            image-rendering: pixelated;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="containerInfo">
        <div class="container" style="padding-bottom: 10px;">
            <h3 class="title" id="class" style="display: flex; justify-content: center">CLASES</h3>
            <h6 style="display: flex; justify-content: center">La clase es aquello que define el estilo de combate de tu heroe. Cada una brilla en algo en especial, pero todas son igual de valiosas.</h6>
            <ul class="list-group list-group-flush" style="padding: 5px; margin-bottom: 30px;">
                <li class="list-group-item"><a href="#Guerrero">Guerrero </a></li>
                <li class="list-group-item"><a href="#Mago">Mago </a></li>
                <li class="list-group-item"><a href="#Paladín">Paladin </a></li>
                <li class="list-group-item"><a href="#Pícaro">Picaro</a></li>
            </ul>

            <asp:Repeater runat="server" ID="rptClasses">
                <ItemTemplate>
                    <div class="classInfo" style="display: flex">
                        <div style="display: flex; justify-content: left">
                            <canvas class="chr-canvas icon" data-race="<%# 0 %>" data-class="<%# Eval("id") %>" data-sex="0" data-toggle="1" data-format="0" width="128" height="192" style="margin-left: 12px; margin-top: -16px; margin-right: 20px;"></canvas>
                            <div style="justify-content: right">
                                <div style="text-align:center">
                                    <h3 id="<%#Eval("name")%>" class="title"><%#Eval("name")%></h3>
                                </div>
                                <p><%#Eval("desc")%></p>
                                <h4>Puntos de vida por nivel: <%#Eval("classHealth")%> + Modificador de Constitucion</h4>
                                <h4>Habilidad Especial: <%#Eval("specialName")%></h4>
                                <p><%#Eval("specialDesc")%></p>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>



    <script src="Scripts/webform.js"></script>
</asp:Content>
