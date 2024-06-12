//intro sequence; followed by first combat
function drawIntro() {

    drawTextCentered('intro', centerX, height - 24, 24, 'white')

    //temp
    chr.sex = 0;
    chr.race.id = 1;
    chr.chrClass.id = 3;
    //temp

    drawSpriteCentered(chr_fx_darkspotlight, centerX, centerY, 10);
    drawChrSprite(centerX, centerY, 10);
}

//end of combat scene; choose next combat or visit town
function drawEndCombat() {
    drawTextCentered('combat or town?', centerX, height - 24, 24, 'white')
}

//resting sequence; followed by next combat
function drawRest() {
    drawTextCentered('resting', centerX, height - 24, 24, 'white')
}

//dead sequence; followed by intro
function drawDead() {
    drawTextCentered('you died', centerX, height - 24, 24, 'white')
}

//draws the character sprite (raceID, classID, sex) at position posX, posY with a size of scale
function drawChrSprite(posX, posY, scale) {
    image(
        chr_spritesheet,
        posX - 8 * scale,
        posY - (16 + 3) * scale,
        16 * scale,
        32 * scale,
        chr.race.id * 16,
        chr.chrClass.id * 32 + (chr.sex * 128),
        16,
        32
    );
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