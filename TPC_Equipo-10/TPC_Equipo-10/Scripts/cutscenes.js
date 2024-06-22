//intro sequence; followed by first combat
function drawIntro() {

    drawTextCentered('intro', width / 2, width / 2 - 24, 24, 'white')

    drawSpriteCentered(chr_fx_darkspotlight, width / 2, height / 2, 10);
    drawChrSprite(width / 2, height / 2 + 40, 10, false);
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

//draws the character sprite (raceID, classID, sex) at position posX, posY with a size of scale
function drawChrSprite(posX, posY, size, flip) {
    push();
    if (flip) {
        translate(posX, posY);
        scale(-1, 1);
        posX = 0;
        posY = 0;
    }
    image(
        chr_spritesheet,
        posX - 8 * size,
        posY - (16 + 7) * size,
        16 * size,
        32 * size,
        chr.race.id * 16,
        chr.chrClass.id * 32 + (chr.sex * 128),
        16,
        32
    );
    pop();
}

function drawItemSprite(posX, posY, size, id) {
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

//dibuja un texto con el origen en su centro
function drawTextCentered(txt, posX, posY, size, color) {
    fill(color);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(txt, posX, posY);
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