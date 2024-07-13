//declaraciones de vars relacionadas a cutscenes
let wait; //bool para pausar user input
let skip; //bool para cuando termino la pausa

let wait2;
let skip2;

let waitTimer;
let waitDialogueID; //id de dialogo que mostrar al pausar user input (dialogos en manageWaitDialogues)

let typeIndex;
let typedDialogue;
let typeTimer;
let typeSpeed;

//intro sequence; followed by first combat
function drawIntro() {

    drawTextCentered('intro', width / 2, width / 2 - 24, 24, 'white')

    drawSpriteCentered(chr_fx_darkspotlight, width / 2, height / 2, 10);
    drawChrSprite(width / 2 - 8 * 10, height / 2 - 16 * 10 - 30, 10, false);
}

//end of combat scene; choose next combat or visit town
function drawEndCombat() {
    drawTextCentered('combat or town?', width / 2, height - 24, 24, 'white')
}

//resting sequence; followed by next combat
function drawRest() {
    drawTextCentered('resting', width / 2, height - 24, 24, 'white')
}

//dead sequence; followed by intro
function drawDead() {
    drawTextCentered('you died', width / 2, height - 24, 24, 'white')
}

//vars generales de levelup
let lvlNavIndex; //indice del nav de levelup
let lvlPts; //puntos para agregar
let lvlNavSqueeze = 200; //escala horizontal del nav
let arrowSize = 10; //tamaño de las flechitas
let lvlButtonSize = 100;
let pluses = [] //lista de pluses que vamos agregando

//triggerea dialogo de levelup
function setupLevelUp() {
    waitStart(6) //dialogo de subida de nivel
    lvlNavIndex = 0;
    lvlPts = 3;
    pluses = [0, 0, 0, 0, 0, 0];
}

//levelup sequence; followed by endcombat
function drawLevelUp() {
    drawTextCentered('tenés 3 puntos para agregar a tus modificadores! donde querés ponerlos?', width / 2, height - 24, 24, 'white')

    //dibuja las opciones del lvlnav
    let indexColor;
    for (let i = 0; i < chr.abilities.length; i++) {
        if (i === lvlNavIndex) {
            indexColor = color(0, 255, 0); //verde el seleccionado
        } else {
            indexColor = color(255); //sino blanco
        }
        //modificadores con los pluses agregados
        let modifier = ((chr.abilities[i].modifier + pluses[i]) >= 0 ? "+" : "") + (chr.abilities[i].modifier + pluses[i]);
        let posX = (width - lvlNavSqueeze) / chr.abilities.length * (i + 0.5) + lvlNavSqueeze / 2; //posicion x segun i
        drawTextCentered(modifier, posX, height / 2 - 20, 24, indexColor);
        drawTextCentered(abilities[i].name, posX, height / 2 + 20, 16, indexColor); //nombre de la abilidad

        if (pluses[i] == 2 || lvlPts == 0) { //si la ability no toma mas puntos, o te quedaste sin puntos
            fill(80); //deshabilitado
        }
        else {
            fill(255); //disponible
        }
        triangle(posX - arrowSize, height / 2 - 60, posX + arrowSize, height / 2 - 60, posX, height / 2 - arrowSize - 60); //up arrow

        if (pluses[i] == 0) { //no agregamos puntos a la ability
            fill(80); //deshabilitado
        }
        else {
            fill(255); //disponible
            drawTextCentered("+" + pluses[i], posX, height / 2 - 90, 18, 255); //mostramos cuanto agregamos
        }
        triangle(posX - arrowSize, height / 2 + 60, posX + arrowSize, height / 2 + 60, posX, height / 2 + arrowSize + 60); //down arrow
    }
    drawTextCentered("(Máximo 2 puntos por habilidad)", width / 2, height / 4 - 75, 12, 255);
    drawTextCentered("Puntos restantes", width / 2, height / 4 - 50, 24, 255);
    drawTextCentered(lvlPts, width / 2, height / 4, 48, 255);

    //boton de confirmar
    let btnColor;
    if (lvlPts == 0) { //consumimos todos los puntos
        fill(150);
        btnColor = color(255);
    }
    else {
        fill(100);
        btnColor = color(128);
    }
    rect(width / 2 - lvlButtonSize, height - (height / 4) - lvlButtonSize / 4, lvlButtonSize * 2, lvlButtonSize / 2);
    drawTextCentered("Confirmar", width / 2, height - (height / 4), 24, btnColor);
}

//la usamos para detener la toma de inputs hasta desps de 1 segundo
function waitStart(dialogueID) {
    wait = true;
    waitTimer = 0;
    waitDialogueID = dialogueID;

    typeStart();
}

//restartea el typeador
function typeStart() {
    typeIndex = 0;
    typedDialogue = '';
    typeTimer = 0;
    typeSpeed = 10; //in miliseconds
}

function waitDialogue(dialogue) {
    if (wait) {
        if (waitTimer < 1000 && !skip) {
            waitTimer += deltaTime;
        }
        else {
            skip = true;
        }
    }
    if (wait2) {
        if (waitTimer < 1000 && !skip2) {
            waitTimer += deltaTime;
        }
        else {
            skip2 = true;
        }
    }
    drawDialogue(dialogue);
}

//dibuja un dialogo centrado con un rectangulo detras para tapar menues
function drawDialogue(dialogue) {

    if (typeIndex < dialogue.length) {
        if (typeTimer < typeSpeed) {
            typeTimer += deltaTime;
        }
        else {
            typedDialogue += dialogue.charAt(typeIndex);
            typeTimer = 0;
            typeIndex++;
        }
    }

    fill(0);
    rect(0, height - navHeight, width, height);
    drawTextCentered(typedDialogue, width / 2, height - navHeight / 2, 24, 'white');
}

function manageWaitDialogues() {
    if (wait || skip) {
        switch (waitDialogueID) {
            case 0: //vas a atacar
                waitDialogue('Decidís atacar con tu ' + weapon.name + '!');
                break;
            case 1: //vas a defenderte
                waitDialogue('Decidís defenderte!');
                break;
            case 2: //vas a usar tu especial
                switch (chr.idClass) { //este dialogo depende que de special tengas, por eso hacemos un switch
                    case 0:
                        waitDialogue('Decidís usar tu ataque especial! Comprimes tu cuerpo, dedicas toda tu atención a los movimientos del enemigo, cubres cualquier apertura.');
                        break;
                    case 1:
                        waitDialogue('Decidís usar tu ataque especial! Orbes de fuego en llamas caen en picado sobre la tierra en un estallido abrasador que arrasa con lo que sea que se encuentre en su camino.');
                        break;
                    case 2:
                        waitDialogue('Decidís usar tu ataque especial! Aunque estés sumido en un peligro indescriptible, aunque tus opciones se vean cada vez más acotadas, la fe en tu dios jamás temblará. Miras al cielo, alzas los brazos entregándote a él, y en respuesta una luz sagrada baña tu cuerpo, sanándolo.');
                        break;
                    case 3:
                        waitDialogue('Decidís usar tu ataque especial! Antes de que tu oponente siquiera note tus intenciones, en un impulso de adrenalina sales disparado hacia él, confundiéndolo con fintas, desviando sus golpes con gracia hasta que encuentras una apertura vital donde arremeter con todas tus fuerzas.');
                        break;
                    default:
                        console.warn('wait special default');
                        break;
                }
                break;
            case 3: //estas entrando en combate
                waitDialogue(pronounCalculator('Una ', 'Un ') + creatures[encounter.creatureID].name + ' quiere pelear!');
                break;
            case 4: //va a atacar creature
                waitDialogue(pronounCalculator('La ', 'El ') + creatures[encounter.creatureID].name + ' te ataca con ' + attack.name + '!');
                break;
            case 5: //va a terminar el encounter
                waitDialogue('Derrotaste ' + pronounCalculator('a la ', 'al ') + creatures[encounter.creatureID].name + '!');
                break;
            case 6: //vas a subir de nivel
                waitDialogue('Felicitaciones! Subiste a nivel ' + chr.level + '!');
                break;
            case 7: //te estas muriendo
                waitDialogue('Perdiste el combate!');
                break;
            default:
                console.warn('primer dialogo faltante');
                break;
        }
    }
    else if (wait2 || skip2) {
        switch (waitDialogueID) {
            case 0: //atacaste
                waitDialogue('El ataque ' + (attackStatus ? 'es exitoso! Le infligís ' + damage + ' de daño!' : 'falló!'));
                break;
            case 1: //te defendiste
                waitDialogue('Durante 3 rondas, tu armadura aumenta en 2.');
                break;
            case 2: //usaste tu especial
                switch (chr.idClass) { //este dialogo depende que de special tengas, por eso hacemos un switch
                    case 0:
                        waitDialogue('Durante 4 rondas, tu armadura aumenta en 2.');
                        break;
                    case 1:
                        waitDialogue('La tirada es automáticamente exitosa y el daño es triplicado.');
                        break;
                    case 2:
                        waitDialogue('Te curás 1/2 de tu vida máxima.');
                        break;
                    case 3:
                        waitDialogue('La tirada es automáticamente exitosa, hacés el daño de tu arma y provocás una hemorragia en el enemigo que inflige 2 de daño por ronda hasta el final del combate.');
                        break;
                    default:
                        console.warn('wait 2 special default');
                        break;
                }
                break;
            case 3: //comenzaste el combate
                waitDialogue('Qué pensás hacer?');
                break;
            case 4: //atacó creature
                waitDialogue('El ataque ' + (attackStatus ? 'es exitoso! Te inflige ' + damage + ' de daño!' : 'falló!'));
                break;
            case 5: //terminó el encounter
                waitDialogue('Recibes ' + creatures[encounter.creatureID].gold + ' de oro y +7 de experiencia!');
                break;
            case 6: //subiste de nivel
                waitDialogue('Conseguiste 3 puntos más para tus abilidades! Dónde querés ponerlos?');
                break;
            case 7: //subiste de nivel
                waitDialogue('Tu personaje ha muerto.');
                break;
            default:
                console.warn("segundo dialogo faltante");
                break;
        }
    }
}