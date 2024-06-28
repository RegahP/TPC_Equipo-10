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
        chr.race.id * 16,
        chr.chrClass.id * 32 + (chr.sex * 128),
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