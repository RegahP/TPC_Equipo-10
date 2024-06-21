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

function drawTextCentered(txt, posX, posY, size, color) {
    fill(color);
    textFont('Courier New');
    textAlign(CENTER, CENTER);
    textSize(size);
    text(txt, posX, posY);
}