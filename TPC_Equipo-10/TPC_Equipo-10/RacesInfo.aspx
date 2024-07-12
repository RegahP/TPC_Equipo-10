<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RacesInfo.aspx.cs" Inherits="TPC_Equipo_10.RacesInfo" %>

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
            <h3 class="title" id="race" style="display: flex; justify-content: center">RAZAS</h3>
            <p>Tu raza es parte de lo que eres, tu sangre, tu herencia. Portala con orgullo pues cada una posee su historia y sus capacidades unicas.</p>
            <ul class="list-group list-group-flush" style="padding: 5px; margin-bottom: 30px;">
                <li class="list-group-item"><a href="#dragonborn">Draconido</a></li>
                <li class="list-group-item"><a href="#elf">Elfo</a></li>
                <li class="list-group-item"><a href="#dwarf">Enano</a></li>
                <li class="list-group-item"><a href="#human">Humano</a></li>
                <li class="list-group-item"><a href="#halfling">Mediano</a></li>
                <li class="list-group-item"><a href="#tiefling">Tiflin</a></li>
            </ul>
        </div>
        <div class="row justify-content-start" style="margin: 10px;">
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="dragonborn" class="title" style="justify-content: center">DRACONIDO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/340/420/618/636272677995471928.png" alt="" />
                    <div style="justify-content: right">
                        <p>Nacido de los dragones, como su nombre proclama, el dracónido camina orgulloso a través de un mundo que le recibe lleno de miedo e incomprensión. Modelado por los dioses dracónidos o por los dragones mismos, el dracónido originalmente nacía de huevos de dragón como una raza única, combinando los mejores atributos de los dragones y los humanoides. Algunos dracónidos son fieles sirvientes de los verdaderos dragones, otros forman parte de ejércitos en grandes guerras e incluso otros se encuentran a la deriva, sin una visión clara de la vida.</p>

                        <h5>Pasiva: +2 a la Fuerza</h5>
                    </div>
                </div>
            </div>
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="elf" class="title" style="justify-content: center">ELFO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://i.imgur.com/7Ax3AZe.png" alt="" />
                    <div style="justify-content: right">
                        <p>Los elfos son un pueblo mágico de gracia sobrenatural, viviendo en el mundo sin ser del todo parte de él. Viven en lugares de etérea belleza, en medio de antiguos bosques o en plateados minaretes que resplandecen con luz feérica, donde una suave música flota en el aire y delicadas fragancias son transportadas por la brisa. Los elfos aman la naturaleza y la magia, el arte y la maestría, la música y la poesía, y las cosas buenas del mundo.</p>

                        <h5>Pasiva: +2 a la Sabiduria</h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-start" style="margin: 10px">
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="dwarf" class="title" style="justify-content: center">ENANO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/254/420/618/636271781394265550.png" alt="" />
                    <div style="justify-content: right">
                        <p>Reinos ricos en antiguo esplendor, salas esculpidas en las raíces de las montañas, picos y martillos haciéndose eco en profundas minas y ardientes forjas, un compromiso con el clan y las tradiciones y un odio ardiente hacia orcos y goblins estos temas comunes unen a todos los enanos.</p>

                        <h5>Pasiva: +2 a la Constitucion</h5>
                    </div>
                </div>
            </div>
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="human" class="title" style="justify-content: center">HUMANO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://i.imgur.com/D9h7V1m.png" alt="" />
                    <div style="justify-content: right">
                        <p>En el cómputo de la mayoría de los mundos, los humanos son la más joven de las razas comunes, con una llegada tardía al mundo y una vida corta en comparación con los enanos, elfos, y dragones. Quizás es por su corta vida que se esfuerzan en conseguir tanto como pueden en los años que se les han dado. O quizás sienten que tienen algo que demostrar a las razas más antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo que les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.</p>

                        <h5>Pasiva: +2 a la Inteligencia</h5>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-start" style="margin: 10px">
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="halfling" class="title" style="justify-content: center">MEDIANO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://images.squarespace-cdn.com/content/v1/5e3843beb37a0716cf512998/cc8512f0-3130-4533-8786-2872de9edbcc/halfling-urban.png" alt="" />
                    <div style="justify-content: right">
                        <p>Las comodidades del hogar son las metas para la mayoría de las vidas de los medianos: un lugar donde asentarse en paz y tranquilidad, lejos de monstruos merodeadores y enfrentamientos de ejércitos; un buen fuego y una comida generosa; buena bebida y buena conversación. Aunque algunos medianos viven sus días en alejadas comunidades agrícolas, otros forman grupos nómadas que viajan constantemente, atraídos por los nuevos caminos y anchos horizontes, para descubrir las maravillas de las nuevas tierras y gentes. Pero incluso estos viajeros aman la paz, comida, el bienestar y el hogar, aunque el hogar sea un vagón empujado a tirones a través de un camino embarrado o una barcaza flotando río abajo.</p>

                        <h5>Pasiva: +2 a la Destreza</h5>
                    </div>
                </div>
            </div>
            <div class="raceInfo col-6" style="display: flex">
                <h4 id="tiefling" class="title" style="justify-content: center">TIFLIN</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/7/641/420/618/636287076637981942.png" alt="" />
                    <div style="justify-content: right">
                        <p>Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos: este es el destino de los tiflin. Y para retorcer el puñal, los tiflin saben que esto es a causa de un pacto sellado hace generaciones que infundió la esencia de Asmodeo, señor supremo de los Nueve Infiernos, en su linaje. Su apariencia y su naturaleza no tienen más culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus hijos, siempre se considerarán responsables.</p>

                        <h5>Pasiva: +2 al Carisma</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
