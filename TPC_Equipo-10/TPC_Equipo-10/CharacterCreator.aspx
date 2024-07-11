<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CharacterCreator.aspx.cs" Inherits="TPC_Equipo_10.CharacterCreator" %>

<%@ Import Namespace="DomainModel" %>
<%@ Import Namespace="DBAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .containerInfo {
            background-color: beige;
            width: 60%;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
        }

        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
            text-shadow:0px 0px 50px rgba(0, 0, 0, 0.3);
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

    <div class="container">
        <div class="row my-5">
            <h1 class="title" style="display:flex; justify-content:center">¡Nace una nueva leyenda! </h1>
        </div>
        <div class="row">
            <h3 class="title" style="display:flex; justify-content:center">Selecciona tu raza: </h3>
        </div>
    </div>
    <div class="justify-content-md-center align-items-center">
        <div class="container-auto text-center">
            <div id="carouselRaces" class="carousel slide" data-bs-theme="dark" style="width: 100%">
                <div class="carousel-inner">
                    <asp:Repeater runat="server" ID="rptRace">
                        <ItemTemplate>
                            <div class="carousel-item <%# (int)Eval("id") == 0 ? "active" : "" %>" style="height:360px">
                                <div class="containerInfo p-2 rounded shadow-lg mt-5" style="display: flex; justify-content: center; width: 80%; min-height: 235px">
                                    <div class="container">
                                        <div class="row">
                                            <h4 class="title" style="text-align:center; text-shadow:none"><%# Eval("name")%></h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-auto">
                                                <canvas class="race-canvas icon" data-race="<%# Eval("id") %>" data-toggle="1" data-format="0" width="128" height="192" style="margin-left: 12px; margin-top: -16px"></canvas>
                                            </div>
                                            <div class="col">
                                                <div class="row" style="height: 205px">
                                                    <div class="row">
                                                        <p><%# Eval("desc")%></p>
                                                    </div>
                                                    <div class="row mt-auto mb-2">
                                                        <div class="col">
                                                            <h5>Pasiva: +2 a su <%# abilityList[(int)Eval("abilityID")].name %></h5>
                                                        </div>
                                                        <div class="col-1 me-3">
                                                            <asp:LinkButton ID="confirmRace_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmRace_btn_Click" Text="Seleccionar" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselRaces" data-bs-slide="prev" style="width:10%">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselRaces" data-bs-slide="next" style="width:10%">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <script src="Scripts/webform.js"></script>
</asp:Content>
