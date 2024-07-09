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
        <h1 class="title" style="display: flex; justify-content: center">¡Nace una nueva leyenda! </h1>
    </div>
    <div class="containerInfo">
        <h3 class="title">Selecciona tu raza: </h3>
    </div>
    <asp:Repeater runat="server" ID="rptRace" OnItemDataBound="rptRace_ItemDataBound">
        <ItemTemplate>

            <div class="containerInfo" style="display: flex; justify-content: center">
                    <div class="container">
                        <div class="row">
                            <h4 class="title" style="text-align: center"><%# Eval("name")%></h4>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <canvas class="race-canvas icon" data-race="<%# Eval("id") %>" data-format="0" width="128" height="192" style="margin-left: 12px"></canvas>
                            </div>
                            <div class="col">
                                <div style="justify-content: left">
                                    <p><%# Eval("desc")%></p>

                                    <asp:Repeater runat="server" ID="rptAbilities">
                                        <ItemTemplate>
                                            <div class="container text-center" style="margin-bottom:24px">
                                                <div class="row" style="align-items:end">
                                                    <div class="col">
                                                        <h5>Pasiva: +2 a su <%# Eval("name")%></h5>
                                                    </div>
                                                    <div class="col-2">
                                                        <asp:LinkButton ID="confirmRace_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmRace_btn_Click" Text="Seleccionar" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <script src="Scripts/webform.js"></script>
</asp:Content>
