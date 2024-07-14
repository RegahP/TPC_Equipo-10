<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BackgroundsInfo.aspx.cs" Inherits="TPC_Equipo_10.BackgroundsInfo" %>

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
        <div class="container" style="padding-bottom: 10px;">
            <h3 class="title" id="background" style="display: flex; justify-content: center">TRASFONDOS</h3>
            <p>¿Quien eres? ¿De donde vienes? El trasfondo es tu pasado, tu historia personal. Gracias a ella podemos entender tus acciones en el presente, asi como puede definir tu camino en el futuro.</p>
            <ul class="list-group list-group-flush" style="padding: 5px; margin-bottom: 30px;">
                <li class="list-group-item"><a href="#Artesano">Artesano</a></li>
                <li class="list-group-item"><a href="#Criminal">Criminal</a></li>
                <li class="list-group-item"><a href="#Ermitaño">Ermitaño</a></li>
                <li class="list-group-item"><a href="#Forastero">Forastero</a></li>
                <li class="list-group-item"><a href="#Heroe del pueblo">Heroe del pueblo</a></li>
                <li class="list-group-item"><a href="#Marinero">Marinero</a></li>
                <li class="list-group-item"><a href="#Soldado">Soldado</a></li>
            </ul>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <asp:Repeater runat="server" ID="rptBg">
            <ItemTemplate>
                <div id="<%#Eval("name")%>" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px; margin-bottom: 25px;">
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 0 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-doomed-artisan.jpg?fit=1348%2C855&ssl=1" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 1 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2022/07/crime.png" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 2 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2022/09/Lone-Missionary-Hermit-Background-5e-1024x536.jpg" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 3 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-intrepid-outlander-5E-DD-background.png?fit=386%2C275&ssl=1" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 4 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-fabled-hero.jpg?fit=1114%2C748&ssl=1" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 5 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-sailor-of-means-5E-DD-background.jpg?fit=920%2C606&ssl=1" alt="">
                    </div>
                    <div runat="server" style="padding-top: 10px;" visible='<%# ((int)Eval("id")) == 6 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2023/04/dnd-solider-background-help-action-dot-com-1024x574.png" alt="">
                    </div>
                    <div class="card-body">
                        <h5 style="text-align: center"><%#Eval("name")%></h5>
                        <p class="card-text"><%#Eval("desc") %></p>
                        <p class="card-text">Recibes +2 a <%# skillList[(int)Eval("skill1BonusID")].name %> y <%# skillList[(int)Eval("skill2BonusID")].name %>.</p>
                        <p class="card-text">Oro inicial: <%#Eval("initialGold") %> monedas de oro.</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="text-align: center; padding-bottom: 3%;">
        <asp:LinkButton runat="server" ID="btnBack" CssClass="btn btn-danger btn-lg" OnClick="btnBack_Click" Text="Volver"></asp:LinkButton>
    </div>


</asp:Content>
