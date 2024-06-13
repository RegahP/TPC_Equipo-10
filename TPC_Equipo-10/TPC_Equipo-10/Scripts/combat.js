function drawCombat() {
    setupNav();
    drawTextCentered('combat; lose or win?', centerX, height - 24, 24, 'white')

    drawChrSprite(centerX - (width / 4), centerY, 10, false);
    drawSpriteCentered(creatures_0, centerX + (width / 4), centerY, 10);

    drawNav();
}

let flagCombat = false;
let nav = ["Atacar", "Defender", "Especial", "Inventario"];
let navIndex;
let navHeight = 200;

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