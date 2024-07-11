<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ClassSelection.aspx.cs" Inherits="TPC_Equipo_10.ClassSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .containerInfo {
            background-color: beige;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }

        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
            text-shadow: 0px 0px 50px rgba(0, 0, 0, 0.3);
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
            <h1 class="title" style="display: flex; justify-content: center">¡Nace una nueva leyenda! </h1>
        </div>
        <div class="row">
            <h3 class="title" style="display: flex; justify-content: center">Selecciona tu clase: </h3>
        </div>
    </div>
    <div class="justify-content-md-center align-items-center">
        <div class="container-auto text-center">
            <div id="carouselClasses" class="carousel slide" data-bs-theme="dark" style="width: 100%">
                <div class="carousel-inner">
                    <asp:Repeater runat="server" ID="rptClass">
                        <ItemTemplate>
                            <div class="carousel-item <%# (int)Eval("id") == 0 ? "active" : "" %>" style="height: 400px">
                                <div class="containerInfo p-2 rounded shadow-lg mt-5" style="display: flex; width: 80%; min-height: 250px">
                                    <div class="container position-relative">
                                        <div class="row">
                                            <h4 class="title" style="text-align: center; text-shadow: none"><%# Eval("name")%></h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-auto">
                                                <canvas class="chr-canvas icon" data-race="<%# character.idRace %>" data-class="<%# Eval("id") %>" data-sex="0" data-toggle="1" data-format="0" width="128" height="192" style="margin-left: 12px; margin-top: -16px"></canvas>
                                            </div>
                                            <div class="col" style="text-align: left">
                                                <div class="row">
                                                    <div class="row">
                                                        <p><%# Eval("desc")%></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <h6>Puntos de vida por nivel: <%# Eval("classHealth") %> + tu modificador de Constitución</h6>
                                                </div>
                                                <div class="row">
                                                    <div class="col-10">
                                                        <h4>Habilidad Especial: <%# Eval("specialName")%></h4>
                                                        <p><%# Eval("specialDesc")%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <asp:LinkButton ID="confirmClass_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger position-absolute bottom-0 end-0 m-3" OnClick="confirmClass_btn_Click" Text="Seleccionar" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselClasses" data-bs-slide="prev" style="width:10%">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselClasses" data-bs-slide="next" style="width:10%">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
    <script src="Scripts/webform.js"></script>
</asp:Content>
