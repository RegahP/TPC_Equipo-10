<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ClassSelection.aspx.cs" Inherits="TPC_Equipo_10.ClassSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .containerInfo {
            background-color: beige;
            width: 60%;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
        }

        .classInfo {
            margin-bottom: 30px;
            border-bottom: 3px solid;
            border-color: azure;
            padding-bottom: 15px;
            background-color: beige;
            width: 80%;
        }

        .classImg {
            width: 75%;
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


    <div class="containerInfo text-center">
        <h3 class="title">Selecciona tu Clase:</h3>
    </div>

    <asp:Repeater runat="server" ID="rptClass">
        <ItemTemplate>
            <div class="containerInfo" style="display: flex; justify-content: center">
                <div class="container">
                    <div class="row">
                        <h4 class="title" style="text-align: center"><%# Eval("name")%></h4>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <canvas class="class-canvas icon" data-class="<%# Eval("id") %>" data-format="0" width="128" height="192" style="margin-left: 12px"></canvas>
                        </div>
                        <div class="col">
                            <div style="justify-content: left">
                                <p><%# Eval("desc")%></p>

                                <h6>Puntos de vida por nivel: <%# Eval("classHealth") %> + tu modificador de Constitución</h6>
                                <h4>Habilidad Especial: <%# Eval("specialName")%></h4>

                                <div class="row" style="align-items:end; margin-bottom:16px">
                                    <div class="col">
                                        <p><%# Eval("specialDesc")%></p>
                                    </div>
                                    <div class="col-2">
                                        <asp:LinkButton ID="confirmClass_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmClass_btn_Click" Text="Seleccionar" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
    <script src="Scripts/webform.js"></script>
</asp:Content>
