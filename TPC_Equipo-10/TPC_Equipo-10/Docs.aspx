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

        html {
            scroll-behavior: smooth;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100" style="margin-bottom: 110px">
        <div class="container-xl" style="padding-bottom: 10px">
            <h1 class="title" style="display: flex; justify-content: center">ARCANAMIRIUM</h1>
            <img style="width: inherit;" src="https://images.ctfassets.net/swt2dsco9mfe/5rEqeLK8cYTcvpGHLfW34/5982b8c357d84061c77fd24aff1287e6/1920x600-candlekeep-.jpg?q=70" alt="" />
            <p>
                Bienaventurados los ojos que hayan llegado al Arcanamirium, hogar de los saberes.
               Aqui podras saciar tu sed de conocimiento, solventar tus dudas y reforzar tus estudios.
            </p>
            <p>Dime... ¿Que es aquello que sobre lo que deseas aprender?</p>
            <ul class="list-group list-group-flush" style="padding: 5px">
                <li class="list-group-item"><a href="#class">Clases </a></li>
                <li class="list-group-item"><a href="#race">Razas </a></li>
                <li class="list-group-item"><a href="#background">Trasfondos </a></li>
                <li class="list-group-item"><a href="#weapon">Armas</a></li>
                <li class="list-group-item"><a href="#armor">Armaduras </a></li>
                <li class="list-group-item"><a href="#shield">Escudos </a></li>
                <li class="list-group-item"><a href="#consumables">Consumibles </a></li>
            </ul>
        </div>
    </div>

    <div class="d-flex justify-content-md-center align-items-center">
        <div class="container-xl" style="padding-bottom: 10px;">
            <h3 class="title" id="class" style="display: flex; justify-content: center">CLASES</h3>
            <p>La clase es aquello que define el estilo de combate de tu heroe. Cada una brilla en algo en especial, pero todas son igual de valiosas.</p>
            <ul class="list-group list-group-flush" style="padding: 5px">
                <li class="list-group-item"><a href="#warrior">Guerrero </a></li>
                <li class="list-group-item"><a href="#mage">Mago </a></li>
                <li class="list-group-item"><a href="#paladin">Paladin </a></li>
                <li class="list-group-item"><a href="#roge">Picaro</a></li>
            </ul>

            <div style="display:flex">
                <h4 id="warrior" style= "justify-content:center" >GUERRERO</h4>
                <div style="display: flex; justify-content: left">
                    <img src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="" />

                </div>
                <div style= "justify-content:right">
                    <p>Una humana equipada con una ruidosa armadura de placas sujeta su escudo frente a ella mientras corre tras un grupo de goblins. Tras ella, un elfo vestido con una armadura de cuero tachonado acribilla a los goblins con flechas lanzadas desde su exquisito arco. Un semiorco cercano grita órdenes, ayudando a los dos combatientes a que coordinen su asalto para conseguir el mejor resultado.</p>
                    <p>Un enano con una cota de malla interpone su escudo entre el garrote del ogro y su compañera, evitando el mortífero golpe. Su compañera, una semielfa con una armadura de escamas, zarandea sus dos cimitarras en un torbellino cegador a la par que rodea al ogro, buscando un punto débil en sus defensas.</p>
                    <p>Un gladiador pelea por deporte en la arena, es un maestro del tridente y la red, experto en derribar a sus enemigos y arrastrarlos por la arena para deleite de las masas (y para su propia ventaja táctica). La espada de su oponente brilla con una luz azul tan solo unos instantes antes de que le lance un fulgurante rayo para golpearlo.</p>
                    <p>Todos estos héroes son guerreros. Caballeros en misiones sagradas, conquistadores, señores de la guerra, campeones reales, soldados de élite, duros mercenarios, y reyes bandidos. Como guerreros, todos ellos comparten un dominio magistral de las armas y armaduras, y un exhaustivo conocimiento de las habilidades del combate.</p>
                </div>


            </div>

        </div>
    </div>

</asp:Content>
