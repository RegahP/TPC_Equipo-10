﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="TPC_Equipo_10.Play" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .icon {
            image-rendering: pixelated;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div>
        <div class="container" style="display: flex; justify-content: center; margin-bottom: 50px; width: 30%;">
            <form class="d-flex" style="width: 100%">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-success" type="submit">Buscar</button>
            </form>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4" style="justify-content: center">
            <asp:Repeater runat="server" ID="rptCharacters" OnItemDataBound="rptCharacters_ItemDataBound">
                <ItemTemplate>

                    <div class="card" style="width: 22%; margin-left: 25px; margin-right: 25px;">
                        <canvas class="chr-canvas icon" data-class="<%# Eval("idClass") %>" data-race="<%# Eval("idRace") %>" data-sex="<%# Convert.ToInt32(Eval("sex")) %>" width="128" height="128" style="margin-top: 12px"></canvas>
                        <div class="card-body">

                            <h5 style="text-align: center"><%# Eval("name") %></h5>

                            <asp:Repeater runat="server" ID="rptClasses">
                                <ItemTemplate>

                                    <p>Clase: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="rptRaces">
                                <ItemTemplate>

                                    <p>Raza: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="rptBackgrounds">
                                <ItemTemplate>

                                    <p>Trasfondo: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>

                            <p>Vida: <%#Eval("currHealth") %></p>

                        </div>
                        <div style="justify-content: center">
                            <asp:LinkButton runat="server" ID="btnSelectChar" CommandArgument='<%# Eval("id")%>' CssClass="btn btn-danger btnStyle" Text="Elegir Personaje" OnClick="btnSelectChar_Click"></asp:LinkButton>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
    <script src="Scripts/webform.js"></script>
</asp:Content>



