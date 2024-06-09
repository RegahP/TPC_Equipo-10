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
        <div class="container" style="padding-bottom: 10px">
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

    <div class="containerInfo">
        <div class="container" style="padding-bottom: 10px;">
            <h3 class="title" id="class" style="display: flex; justify-content: center">CLASES</h3>
            <p>La clase es aquello que define el estilo de combate de tu heroe. Cada una brilla en algo en especial, pero todas son igual de valiosas.</p>
            <ul class="list-group list-group-flush" style="padding: 5px; margin-bottom: 30px;">
                <li class="list-group-item"><a href="#warrior">Guerrero </a></li>
                <li class="list-group-item"><a href="#mage">Mago </a></li>
                <li class="list-group-item"><a href="#paladin">Paladin </a></li>
                <li class="list-group-item"><a href="#rogue">Picaro</a></li>
            </ul>

            <div class="classInfo" style="display: flex">
                <h4 id="warrior" class="title" style="justify-content: center">GUERRERO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="" />
                    <div style="justify-content: right">
                        <p>Una humana equipada con una ruidosa armadura de placas sujeta su escudo frente a ella mientras corre tras un grupo de goblins. Tras ella, un elfo vestido con una armadura de cuero tachonado acribilla a los goblins con flechas lanzadas desde su exquisito arco. Un semiorco cercano grita órdenes, ayudando a los dos combatientes a que coordinen su asalto para conseguir el mejor resultado.</p>
                        <p>Un enano con una cota de malla interpone su escudo entre el garrote del ogro y su compañera, evitando el mortífero golpe. Su compañera, una semielfa con una armadura de escamas, zarandea sus dos cimitarras en un torbellino cegador a la par que rodea al ogro, buscando un punto débil en sus defensas.</p>
                        <p>Un gladiador pelea por deporte en la arena, es un maestro del tridente y la red, experto en derribar a sus enemigos y arrastrarlos por la arena para deleite de las masas (y para su propia ventaja táctica). La espada de su oponente brilla con una luz azul tan solo unos instantes antes de que le lance un fulgurante rayo para golpearlo.</p>
                        <p>Todos estos héroes son guerreros. Caballeros en misiones sagradas, conquistadores, señores de la guerra, campeones reales, soldados de élite, duros mercenarios, y reyes bandidos. Como guerreros, todos ellos comparten un dominio magistral de las armas y armaduras, y un exhaustivo conocimiento de las habilidades del combate.</p>

                        <h4>Puntos de vida por nivel: 10 + Modificador de Constitucion</h4>
                        <h4>Habilidad Especial: Cobertura Impenetrable</h4>
                        <p>Comprimes tu cuerpo, dedicas toda tu atención a los movimientos del enemigo, cubres cualquier apertura.</p>
                        <p>Durante 4 rondas, tu armadura aumenta en 2.</p>
                    </div>
                </div>
            </div>
            <div class="classInfo" style="display: flex">
                <h4 id="mage" class="title" style="justify-content: center">MAGO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6f055b11-30d4-4a48-85a1-774dc8d792cd/dg308lq-774ebb76-101d-49e2-afa9-6f9e523f7fc4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZmMDU1YjExLTMwZDQtNGE0OC04NWExLTc3NGRjOGQ3OTJjZFwvZGczMDhscS03NzRlYmI3Ni0xMDFkLTQ5ZTItYWZhOS02ZjllNTIzZjdmYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hFpv3hPHv-S99ivnKkB469BJHKMQFaIDIwNDVlh7Wyo" alt="" />
                    <div style="justify-content: right">
                        <p>Vestida con un traje de plata que denota su posición, una elfa cierra los ojos para evitar las distracciones del campo de batalla y comienza su silencioso canto. Sus dedos dibujan formas frente a ella, completa el conjuro y lanza una diminuta gota de fuego hacia las filas enemigas, donde estalla en una deflagración que engulle a los soldados.</p>
                        <p>Comprobando una y otra vez su trabajo, un humano escribe con tiza un intrincado círculo mágico en el suelo des-nudo, después espolvorea polvo de hierro a lo largo de cada línea y cada grácil curva. Cuando el círculo está completo, canturrea una larga invocación. Un agujero se abre en el espacio dentro del círculo, trayendo un olor a azufre desde el plano extraterrenal del más allá.</p>
                        <p>Agachado en el suelo en un cruce de caminos de una mazmorra un gnomo lanza unos pequeños huesos inscritos con símbolos místicos, susurrando unas pocas palabras de poder sobre ellos. Cerrando sus ojos para ver las visiones con más claridad, asiente lentamente, después abre los ojos y señala hacia el pasillo de su izquierda.</p>
                        <p>Los magos son los practicantes supremos de la magia, definidos y unidos como una clase por los hechizos que conjuran. A partir de la sutil onda de la magia que impregna el cosmos, los magos lanzan explosivos hechizos de fuego, arcos voltaicos, sutiles engaños y brutales formas de control mental. Su magia invoca monstruos de otros planos de existencia, vislumbra el futuro, o convierte a enemigos caídos en zombis. Sus hechizos más poderosos transforman una sustancia en otra, invocan meteoros de los cielos o abren portales a otros mundos.</p>

                        <h4>Puntos de vida por nivel: 6 + Modificador de Constitucion</h4>
                        <h4>Habilidad Especial: Lluvia de meteoritos</h4>
                        <p>Orbes de fuego en llamas caen en picado sobre la tierra en un estallido abrasador que arrasa con lo que sea que se encuentre en su camino.</p>
                        <p>La tirada de ataque es automáticamente exitosa y el daño es triplicado.</p>
                    </div>
                </div>
            </div>
            <div class="classInfo" style="display: flex">
                <h4 id="paladin" class="title" style="justify-content: center">PALADIN</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://www.worldanvil.com/uploads/images/5306b35bfec003350e5eaa79e3b5fa2e.png" alt="" />
                    <div style="justify-content: right">
                        <p>Revestido con una armadura de placas que resplandece a la luz del sol, a pesar del polvo y la suciedad de un largo viaje, un humano envaina su espada y aparta su escudo, apoyando sus manos en un hombre mortalmente herido. Un resplandor divino surge de sus manos, las heridas del hombre cicatrizan hasta cerrarse y sus ojos se abren de par en par de puro asombro.</p>
                        <p>Un enano se agazapa tras unos arbustos, mientras su negra capa lo vuelve prácticamente invisible en la noche, y vigila a una banda guerrera orca que celebra una reciente victoria. Silenciosamente, se infiltra entre ellos y susurra un juramento, y dos orcos pierden la vida incluso antes de que se den cuenta de que el enano está ahí.</p>
                        <p>Con cabellos plateados que brillan en un haz de luz que parece iluminarlo solo a él, un elfo ríe a carcajadas. Sus lanzas brillan con el mismo resplandor que sus ojos al tiempo que golpea una y otra vez a un retorcido gigante, hasta que finalmente la luz derrota a la repugnante oscuridad.</p>
                        <p>Sean cuales sean sus orígenes y sus misiones, los paladines están unidos por sus juramentos para luchar en contra de las fuerzas del mal. Ya sea a los pies del altar de un dios con un sacerdote como testigo, en un claro sagrado ante los espí-ritus de la naturaleza y los seres feéricos, o en un momento de desesperación y dolor con la muerte como única acompañante, el juramento de un paladín es un lazo muy poderoso. Es una fuente de poder que convierte a un devoto guerrero en un campeón bendecido.</p>

                        <h4>Puntos de vida por nivel: 12 + Modificador de Constitucion</h4>
                        <h4>Habilidad Especial: Palabra Sagrada</h4>
                        <p>Aunque estés sumido en un peligro indescriptible, aunque tus opciones se vean cada vez más acotadas, la fe en tu dios jamás temblara. Miras al cielo, alzas los brazos entregándote a él, y en respuesta una luz sagrada baña tu cuerpo, sanandolo.</p>
                        <p>Te curas la mitad de tu vida máxima.</p>
                    </div>
                </div>
            </div>
            <div class="classInfo" style="display: flex">
                <h4 id="rogue" class="title" style="justify-content: center">PICARO</h4>
                <div style="display: flex; justify-content: left">
                    <img class="classImg" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2016/04/Fe-PirateRogue.png?fit=635%2C753&ssl=1" alt="" />
                    <div style="justify-content: right">
                        <p>Mientras hace señas a sus compañeros para que esperen, una mediana se arrastra a través del salón de la mazmorra. Presiona su oreja contra la puerta, saca un juego de herramientas y coge la ganzúa tan rápido como un pestañeo. Luego desaparece en las sombras mientras su compañero guerrero avanza para pegar una patada a la puerta y abrirla.</p>
                        <p>Un humano acecha en las sombras de un callejón mientras su cómplice se prepara para la emboscada. Cuando su objetivo, un esclavista muy conocido, pasa por el callejón, el cómplice grita, el esclavista corre a investigar, y la hoja del asesino corta su garganta antes de que pueda hacer ningún sonido.</p>
                        <p>Aguantando una risilla, una gnoma mueve sus dedos, y como por arte de magia eleva el manojo de llaves del cinturón del guardián. En un momento, las llaves están en su mano, la puerta de la celda está abierta y ella y sus compañeros son libres para poder escapar.</p>
                        <p>Los pícaros confían en sus habilidades, el sigilo y las vulnerabilidades de sus oponentes para lograr sacar ventaja en cualquier situación. Tienen un don para encontrar la solución a prácticamente cualquier problema, demostrando un ingenio y versatilidad, que es la piedra angular de cualquier buen grupo de aventureros.</p>

                        <h4>Puntos de vida por nivel: 8 + Modificador de Constitucion</h4>
                        <h4>Habilidad Especial: Talón de Aquiles</h4>
                        <p>Antes de que tu oponente siquiera note tus intenciones, en un impulso de adrenalina sales disparado hacia el, confundiéndolo con fintas, desviando sus golpes con gracia hasta que encuentras una apertura vital donde arremeter con todas tus fuerzas.</p>
                        <p>La tirada de ataque es automáticamente exitosa, haces el daño de tu arma y adicionalmente provocas una hemorragia en el enemigo hasta el final del combate que hace 2 de daño cada ronda.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
            <img style="padding-top:10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-doomed-artisan.jpg?fit=1348%2C855&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">ARTESANO</h5>
                <p class="card-text">Eres miembro de un gremio de artesanos, especializado en un campo particular y cercanamente asociado con otros artesanos. Eres una parte bien establecida del mundo mercantil, liberado por tu talento y riqueza de las limitaciones de la sociedad feudal. Aprendiste tus habilidades como aprendiz de un maestro, bajo el patrocinio de tu gremio, hasta que te convertiste en un maestro por tus propios medios.</p>
                <p class="card-text">Recibes +2 a Persuacion e Investigacion.</p>
                <p class="card-text">Oro inicial: 20 modedas de oro.</p>
            </div>
        </div>

        <div id="criminal" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://help-action.com/wp-content/uploads/2022/07/crime.png" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">CRIMINAL</h5>
                <p class="card-text">Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todavía tienes contactos dentro del mundo criminal. Estas mucho más cerca que la mayoría de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilización y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad.</p>
                <p class="card-text">Recibes +2 a Sigilo e Intimidacion.</p>
                <p class="card-text">Oro inicial: 10 modedas de oro.</p>
            </div>
        </div>

        <div id="hermit" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://help-action.com/wp-content/uploads/2022/09/Lone-Missionary-Hermit-Background-5e-1024x536.jpg" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">HERMITAÑO</h5>
                <p class="card-text">Vivías en la reclusión, ya sea en una comunidad resguardada como un monasterio o completamente solo por una parte importante de tu vida. Durante el tiempo que pasaste lejos del clamor de la sociedad, encontraste quietud, soledad, y quizá alguna de las respuestas que buscabas.</p>
                <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                <p class="card-text">Oro inicial: 10 modedas de oro.</p>
            </div>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <div id="outlander" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-intrepid-outlander-5E-DD-background.png?fit=386%2C275&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">FORASTERO</h5>
                <p class="card-text">Creciste en las tierras salvajes, lejos de la civilización y del confort de la ciudad y la tecnología. Has sido testigo de la migración de rebaños grandes como bosques enteros, has sobrevivido a un clima más extremo que el que cualquier habitante de la ciudad haya podido padecer. Llevas las tierras salvajes en la sangre, fueras un nómada, un explorador, un eremita, un cazador-recolector o incluso un saqueador. Incluso en lugares donde no conozcas las características específicas del terreno, comprendes las formas de lo salvaje.</p>
                <p class="card-text">Recibes +2 a Atletismo y Supervivencia.</p>
                <p class="card-text">Oro inicial: 5 modedas de oro.</p>
            </div>
        </div>

        <div id="hero" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-fabled-hero.jpg?fit=1114%2C748&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">HEROE DEL PUEBLO</h5>
                <p class="card-text">Vienes de una clase social humilde, pero estás destinado para mucho más. Ya la gente de tu pueblo natal te considera como su campeón, y tú destino te llama a estar en contra de los tiranos y los monstruos que amenazan a la gente común en todas partes.</p>
                <p class="card-text">Recibes +2 a Persuacion y Atletismo.</p>
                <p class="card-text">Oro inicial: 15 modedas de oro.</p>
            </div>
        </div>

        <div id="sailor" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-sailor-of-means-5E-DD-background.jpg?fit=920%2C606&ssl=1" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">MARINERO</h5>
                <p class="card-text">Navegaste en una nave marítima por años. En ese tiempo, enfrentaste exitosamente poderosas tormentas, monstruos de las profundidades y a aquellos que quisieron hundir tu trabajo en las infinitas profundidades. Tu primer amor es la lejana línea del horizonte, pero el tiempo llegó para probarte en algo nuevo.</p>
                <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                <p class="card-text">Oro inicial: 15 modedas de oro.</p>
            </div>
        </div>
    </div>

    <div class="row justify-content-center" style="margin: 10px">
        <div id="soldier" class="card col-4" style="width: 20%; margin-left: 25px; margin-right: 25px;">
            <img style="padding-top:10px;" src="https://help-action.com/wp-content/uploads/2023/04/dnd-solider-background-help-action-dot-com-1024x574.png" class="card-img-top" alt=" ">
            <div class="card-body">
                <h5 style="text-align:center">SOLDADO</h5>
                <p class="card-text">La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendiste las técnicas básicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ejército nacional permanente o de una compañía de mercenarios, o tal vez miembro de una milicia local que saltó a la fama durante una guerra reciente.</p>
                <p class="card-text">Recibes +2 a Acrobacias e Intimidacion.</p>
                <p class="card-text">Oro inicial: 10 modedas de oro.</p>
            </div>
        </div>
    </div>
</asp:Content>
