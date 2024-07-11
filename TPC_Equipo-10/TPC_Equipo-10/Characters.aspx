<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Characters.aspx.cs" Inherits="TPC_Equipo_10.Characters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .size {
            width: 40%;
        }

        .icon {
            image-rendering: pixelated;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
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

    <%if (filteredCharacters.Count() == 0)
        {
    %>
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control shadow-lg" style="padding-top: 25px; border-width: medium; border-color: black; width: 40%">
            <div class="mb-3 row">
                <h1 class="title" style="display: flex; justify-content: center">Aun no tienes personajes!</h1>
            </div>
            <div class="mb-3 row text-center">
                <h3 class="title" style="margin-bottom: 25px;">¡Dale click al boton para comenzar tu aventura!</h3>
            </div>
            <div class="mb-3 row-3 text-center">
                <asp:Button ID="btnFirstCharacter" runat="server" CssClass="btn btn-danger" Text="Crear Personaje" OnClick="charCreation_Click" />
            </div>
        </div>
    </div>
    <%}
        else
        {%>
    <div class="container">
        <div class="row">
            <div class="row my-4">
                <div class="d-flex ms-1">
                    <asp:Button ID="charCreation" runat="server" CssClass="btn btn-danger shadow" Text="Crear Personaje" OnClick="charCreation_Click" />
                    <input class="form-control mx-4 shadow" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-success shadow" type="submit">Buscar</button>
                </div>
            </div>
            <div class="row">
                <asp:Repeater runat="server" ID="rptCharacters" OnItemDataBound="rptCharacters_ItemDataBound">
                    <ItemTemplate>
                        <div class="row p-3 mb-4 ms-1 bg-body-tertiary rounded shadow-lg">
                            <div class="col-md-auto">
                                <canvas class="chr-canvas icon" data-class="<%# Eval("idClass") %>" data-race="<%# Eval("idRace") %>" data-sex="<%# Convert.ToInt32(Eval("sex")) %>" width="128" height="128" style="margin-top: 6px"></canvas>
                            </div>
                            <div class="col">
                                <div class="row align-items-center" style="height: 50%">
                                    <div class="col">
                                        <h5>
                                            <%# Eval("name") + ", " + listRaces[(int)Eval("idRace")].name + " " + listClasses[(int)Eval("idClass")].name %>
                                        </h5>
                                    </div>
                                    <div class="col" style="text-align: end">
                                        <h5>
                                            <%# "Nivel " + Eval("level") %>
                                        </h5>
                                    </div>
                                </div>
                                <div class="row" style="height: 0px">
                                    <hr />
                                </div>
                                <div class="row align-items-center" style="height: 50%">
                                    <div class="col">
                                        <div class="progress" role="progressbar" style="height: 24px">
                                            <div class="progress-bar bg-success" runat="server" id="healthBar"></div>
                                        </div>
                                    </div>
                                    <div class="col" style="text-align: end">
                                        <h5>
                                            <%# Eval("encounters") + " Encuentros" %>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 0px">
                                <div class="vr" style="height: 100%"></div>
                            </div>
                            <div class="col-md-auto ms-auto">
                                <div class="col" style="height: 74%">
                                    <div class="row">
                                        <asp:LinkButton runat="server" ID="btnDetail" CommandArgument='<%#Eval("id")%>' CssClass="btn btn-info size" Text="Detalles" OnClick="btnDetail_Click"></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="col" style="height: 26%">
                                    <div class="row">
                                        <asp:LinkButton runat="server" ID="btnDelete" CommandArgument='<%#Eval("id")%>' CssClass="btn btn-danger size" Text="Eliminar" OnClick="btnDelete_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <%}%>
    <script src="Scripts/webform.js"></script>
</asp:Content>
