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
                <li class="list-group-item"><a href="#artisan">Artesano</a></li>
                <li class="list-group-item"><a href="#criminal">Criminal</a></li>
                <li class="list-group-item"><a href="#hermit">Ermitaño</a></li>
                <li class="list-group-item"><a href="#outlander">Forastero</a></li>
                <li class="list-group-item"><a href="#hero">Heroe del pueblo</a></li>
                <li class="list-group-item"><a href="#sailor">Marinero</a></li>
                <li class="list-group-item"><a href="#soldier">Soldado</a></li>
            </ul>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <div id="artisan" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-doomed-artisan.jpg?fit=1348%2C855&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">ARTESANO</h5>
                <p class="card-text">Eres miembro de un gremio de artesanos, especializado en un campo particular y cercanamente asociado con otros artesanos. Eres una parte bien establecida del mundo mercantil, liberado por tu talento y riqueza de las limitaciones de la sociedad feudal. Aprendiste tus habilidades como aprendiz de un maestro, bajo el patrocinio de tu gremio, hasta que te convertiste en un maestro por tus propios medios.</p>
                <p class="card-text">Recibes +2 a Persuacion e Investigacion.</p>
                <p class="card-text">Oro inicial: 20 monedas de oro.</p>
            </div>
        </div>

        <div id="criminal" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://help-action.com/wp-content/uploads/2022/07/crime.png" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">CRIMINAL</h5>
                <p class="card-text">Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todavía tienes contactos dentro del mundo criminal. Estas mucho más cerca que la mayoría de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilización y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad.</p>
                <p class="card-text">Recibes +2 a Sigilo e Intimidacion.</p>
                <p class="card-text">Oro inicial: 10 monedas de oro.</p>
            </div>
        </div>

        <div id="hermit" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://help-action.com/wp-content/uploads/2022/09/Lone-Missionary-Hermit-Background-5e-1024x536.jpg" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">HERMITAÑO</h5>
                <p class="card-text">Vivías en la reclusión, ya sea en una comunidad resguardada como un monasterio o completamente solo por una parte importante de tu vida. Durante el tiempo que pasaste lejos del clamor de la sociedad, encontraste quietud, soledad, y quizá alguna de las respuestas que buscabas.</p>
                <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                <p class="card-text">Oro inicial: 10 monedas de oro.</p>
            </div>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <div id="outlander" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-intrepid-outlander-5E-DD-background.png?fit=386%2C275&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">FORASTERO</h5>
                <p class="card-text">Creciste en las tierras salvajes, lejos de la civilización y del confort de la ciudad y la tecnología. Has sido testigo de la migración de rebaños grandes como bosques enteros, has sobrevivido a un clima más extremo que el que cualquier habitante de la ciudad haya podido padecer. Llevas las tierras salvajes en la sangre, fueras un nómada, un explorador, un eremita, un cazador-recolector o incluso un saqueador. Incluso en lugares donde no conozcas las características específicas del terreno, comprendes las formas de lo salvaje.</p>
                <p class="card-text">Recibes +2 a Atletismo y Supervivencia.</p>
                <p class="card-text">Oro inicial: 5 monedas de oro.</p>
            </div>
        </div>

        <div id="hero" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-fabled-hero.jpg?fit=1114%2C748&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">HEROE DEL PUEBLO</h5>
                <p class="card-text">Vienes de una clase social humilde, pero estás destinado para mucho más. Ya la gente de tu pueblo natal te considera como su campeón, y tú destino te llama a estar en contra de los tiranos y los monstruos que amenazan a la gente común en todas partes.</p>
                <p class="card-text">Recibes +2 a Persuacion y Atletismo.</p>
                <p class="card-text">Oro inicial: 15 monedas de oro.</p>
            </div>
        </div>

        <div id="sailor" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-sailor-of-means-5E-DD-background.jpg?fit=920%2C606&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">MARINERO</h5>
                <p class="card-text">Navegaste en una nave marítima por años. En ese tiempo, enfrentaste exitosamente poderosas tormentas, monstruos de las profundidades y a aquellos que quisieron hundir tu trabajo en las infinitas profundidades. Tu primer amor es la lejana línea del horizonte, pero el tiempo llegó para probarte en algo nuevo.</p>
                <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                <p class="card-text">Oro inicial: 15 monedas de oro.</p>
            </div>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <div id="soldier" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top: 10px;" src="https://help-action.com/wp-content/uploads/2023/04/dnd-solider-background-help-action-dot-com-1024x574.png" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align: center">SOLDADO</h5>
                <p class="card-text">La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendiste las técnicas básicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ejército nacional permanente o de una compañía de mercenarios, o tal vez miembro de una milicia local que saltó a la fama durante una guerra reciente.</p>
                <p class="card-text">Recibes +2 a Acrobacias e Intimidacion.</p>
                <p class="card-text">Oro inicial: 10 monedas de oro.</p>
            </div>
        </div>
    </div>


</asp:Content>
