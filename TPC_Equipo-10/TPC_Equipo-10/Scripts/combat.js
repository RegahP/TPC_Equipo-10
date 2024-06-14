function drawCombat() {
    setupCombat();
    drawTextCentered('combat; lose or win?', centerX, height - 24, 24, 'white')

    drawChrSprite(centerX - (width / 4), centerY, 10, false);
    drawSpriteCentered(creatures_0, centerX + (width / 4), centerY, 10);

    drawNav();
    if (navFocus) {
        drawInventory();
    }
}

let flagCombat = false; //flag para setupear la escena
let nav = ["Atacar", "Defender", "Especial", "Inventario"]; //items del nav
let navIndex; //en que opcion estamos parados
let navHeight = 200;
let navFocus = false; //0 = nav; 1 = inventory

function setupCombat() {
    if (!flagCombat) {
        flagCombat = true;
        navIndex = 0;
    }
}

function drawNav() {
    //dibuja las opciones del nav
    let txtColor;
    for (let i = 0; i < nav.length; i++) {
        if (i === navIndex) {
            txtColor = color(0, 255, 0); //verde el seleccionado
        } else {
            txtColor = color(255); //sino blanco
        }
        drawTextCentered(nav[i], width / nav.length * (i + 0.5), height - navHeight / 2, 24, txtColor)
    }
}

let items = []; //esto va a ser cargados con items reales, no los prehechos que armé
let invIndex; //en que items estamos parados
let invFocus; //0 = panel izq; 1 = panel der

let outerMargin = 35;
let innerMargin = 20;
let itemSize = 24;
let buttonSize = 16;

function setupInventory() {
    invIndex = 0;
    invFocus = false;
    noStroke();
    items.splice(0, items.length);
    for (let i = 0; i < 7; i++) {
        let item = {
            name: "item" + int(random(100, 999)),
            equipped: false,
            type: random([ "Genérico", "Consumible", "Arma", "Protección"])
        };
        items.push(item);
    }
}

function drawInventory() {
    //panel de inventario
    fill(20);
    rect(
        outerMargin,
        outerMargin,
        width - outerMargin * 2,
        height - outerMargin * 2
    );

    //lista de items
    for (i = 0; i < items.length; i++) {
        fill(255);
        textAlign(LEFT, TOP);
        textSize(itemSize);
        push();
        clip(listMask);
        text(
            items[i].name,
            outerMargin + innerMargin + itemSize * 1.25,
            outerMargin + innerMargin + itemSize * 1.25 * i
        );
        pop();
    }

    //panel de detalles superior
    fill(50);
    rect(
        width / 2,
        outerMargin + innerMargin,
        width / 2 - outerMargin - innerMargin,
        height / 2 - innerMargin * 1.5 - outerMargin
    );

    //panel de detalles inferior
    fill(50);
    rect(
        width / 2,
        height / 2 + innerMargin * 0.5,
        width / 2 - outerMargin - innerMargin,
        height / 2 - innerMargin * 1.5 - outerMargin
    );

    //item name
    fill(255);
    textAlign(LEFT, TOP);
    textSize(36);
    push();
    clip(detailsMask);
    text(
        items[invIndex].name,
        width / 2 + innerMargin,
        outerMargin + innerMargin + 18
    );
    pop();

    //item type
    fill(255);
    textAlign(LEFT, TOP);
    textSize(12);
    push();
    clip(detailsMask);
    text(
        items[invIndex].type, //esto es temp
        width / 2 + innerMargin,
        outerMargin + innerMargin + 24 + 36
    );
    pop();

    //item desc
    fill(255);
    textAlign(LEFT, TOP);
    textSize(16);
    textWrap(WORD);
    push();
    clip(detailsMask);
    text(
        /*items[invIndex].name*/"bla bla bla lbblbla lal al bla lb abl albl ab alb lalb la blal bla lbal bla lbalb lblbalb la lb alb labl alblablbalb lb alb alb alb alb labla bla bla bla lbblbla lal al bla lb abl albl ab alb lalb la blal bla lbal bla lbalb lblbalb la lb alb labl alblablbalb lb alb alb alb alb labla lb alb alb alb alb labla lb alb alb alb alb labla",
        width / 2 + innerMargin,
        outerMargin + innerMargin + 24 + 36 + 32,
        width / 2 - outerMargin - innerMargin * 3 - (width / (buttonSize / 2) + itemSize * 2)
    )
    pop();

    //equipbutton
    if (items[invIndex].equipped) {
        fill(100);
    } else {
        fill(150);
    }
    rect(
        width - outerMargin - innerMargin * 2 - width / (buttonSize / 2),
        height / 2 - innerMargin * 1.5 - height / buttonSize,
        width / (buttonSize / 2),
        height / buttonSize
    );
    let equipTxt;
    if (items[invIndex].equipped) {
        fill(128);
        equipTxt = "Equipado";
    } else {
        fill(255);
        equipTxt = "Equipar";
    }
    textSize(itemSize);
    textAlign(CENTER, CENTER);
    text(
        equipTxt,
        width -
        outerMargin -
        innerMargin * 2 -
        width / (buttonSize / 2) +
        width / buttonSize,
        innerMargin +
        height / 2 -
        innerMargin * 2.5 -
        height / buttonSize +
        height / (buttonSize * 2)
    );

    //indicador de seleccion
    fill(255);
    textSize(itemSize);
    if (!invFocus) {
        textAlign(LEFT, TOP);
        text(
            ">",
            outerMargin + innerMargin,
            outerMargin + innerMargin + invIndex * itemSize * 1.25
        );
    } else {
        textAlign(CENTER, CENTER);
        text(
            ">",
            width -
            outerMargin -
            innerMargin * 2 -
            width / (buttonSize / 2) -
            itemSize,
            innerMargin +
            height / 2 -
            innerMargin * 2.5 -
            height / buttonSize +
            height / (buttonSize * 2)
        );
    }
}

//mascaras de clipping para evitar que sobresalgan los textos en el inventario
function listMask() {
    rect(0, 0, width / 2 - innerMargin, height - outerMargin - innerMargin);
}

function detailsMask() {
    rect(width / 2, outerMargin + innerMargin,
        width / 2 - outerMargin - innerMargin - 12,
        height / 2 - innerMargin * 2.5 - outerMargin);
}
