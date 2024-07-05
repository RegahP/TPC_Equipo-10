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

//la usamos para detener la toma de inputs hasta desps de 2 segundos
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
    //console.log('wait', 'skip', 'wait2', 'skip2', 'waitTimer');
    //console.log(wait, skip, wait2, skip2, waitTimer);
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
                waitDialogue('Decidís atacar con tu Hacha de mano!'); //temp value, es arma equipada
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
                waitDialogue((creatureFemPronouns.includes(creatureID) ? 'Una ' : 'Un ') + creatures[creatureID].name + ' quiere pelear!');
                break;
            default:
                console.warn('wait default');
                break;
        }
    }
    else if (wait2 || skip2) {
        switch (waitDialogueID) {
            case 0: //atacaste
                waitDialogue('El ataque ' + (attackStatus ? 'es exitoso!' : 'falló!'));
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
            default:
                console.warn("wait2 default");
                break;
        }
    }
}

function roll(d, mod) {
    return int(random(d) + 1) + mod;
}

function mod(score) {
    return int((score - 10) / 2);
}

//draws the character sprite (raceID, classID, sex) at position posX, posY with a size
function drawChrSprite(posX, posY, size, flip) {
    imageMode(CORNER);
    push();
    if (flip) {
        translate(posX, posY);
        scale(-1, 1);
        posX = 0;
        posY = 0;
    }
    image(
        chr_spritesheet,
        posX,
        posY,
        16 * size,
        32 * size,
        chr.idRace * 16,
        chr.idClass * 32 + (chr.sex * 128),
        16,
        32
    );
    pop();
}
//draws an item of id, at posx posy, with a size
function drawItemSprite(posX, posY, size, id) {
    imageMode(CORNER);
    image(
        items_spritesheet,
        posX,
        posY,
        16 * size,
        16 * size,
        id * 16,
        0,
        16,
        16
    );
}
//draws a creature of id, at posx posy, with a size
function drawCreatureSprite(posX, posY, size, id) {
    imageMode(CORNER);
    if (id == 17) {
        image(
            creatures_spritesheet,
            posX,
            posY,
            32 * size,
            64 * size,
            544,
            0,
            32,
            64
        )
    }
    else {
        image(
            creatures_spritesheet,
            posX,
            posY,
            (creatureCrop[id + 1] - creatureCrop[id]) * size,
            64 * size,
            creatureCrop[id],
            0,
            creatureCrop[id + 1] - creatureCrop[id],
            64
        )
    }
}

//dibuja un sprite con el origen en su centro
function drawSpriteCentered(img, posX, posY, scale) {
    imageMode(CENTER);
    image(
        img,
        posX,
        posY,
        img.width * scale,
        img.height * scale
    );
    imageMode(CORNER);
}

//dibuja imagenes en perspectiva horizontal
//toma una imagen, posicion x y, cantidad de perspectiva, escala vertical, escala, y orientacion
function drawSpritePerspective(img, x, y, skew, stretch, size, dir) {

    let offset;
    let res;
    let w;

    if (!dir) {

        offset = img.width * skew;
        res = img.height;
        w = (1 - offset / img.width) * size;

        for (let i = 0; i < res; i++) {
            image(
                img,
                x + (img.width * size) / 2 - i * w - (offset * size) / 2,
                y + i * ((img.height * size) / res) * stretch,
                offset * size + img.width * (i / res) * w,
                Math.max(1 * stretch * size, 1),
                0,
                skew == 0 ? i - 1 : i,
                img.width,
                1
            );
        }
    }
    else {

        offset = img.width * skew;
        res = img.height;
        w = (1 - offset / img.width) * size;

        for (let i = 0; i < res; i++) {
            image(
                img,
                x + (i * w),
                y + i * ((img.height * size) / res) * stretch,
                (img.width * size) - (i * w) * 2,
                Math.max(1 * stretch * size, 1),
                0,
                i,
                img.width,
                1
            );
        }
    }
}

//dibuja un texto con el origen en su centro
function drawTextCentered(txt, posX, posY, size, color) {
    fill(color);
    textAlign(CENTER, CENTER);
    textSize(size);

    rectMode(CENTER);

    text(txt, posX, posY, width);
    rectMode(CORNER); //no ideal
}

//devuelve un tamaño de texto maximo segun contenido limites
function getTextSizeToFit(str, targetWidth, targetHeight) {
    let size = 1;
    textSize(size);
    let bbox = textBounds(str);

    // agranda el tamaño hasta que entra en los limites
    while (bbox.w < targetWidth && bbox.h < targetHeight) {
        size++;
        textSize(size);
        bbox = textBounds(str);
    }

    // reduce el tamaño en 1 por si acaso
    size--;
    return size;
}

//devuelve los boundaries de un texto segun contenido
function textBounds(str) {
    let w = textWidth(str);
    let h = textAscent() + textDescent();
    return { w: w, h: h };
}