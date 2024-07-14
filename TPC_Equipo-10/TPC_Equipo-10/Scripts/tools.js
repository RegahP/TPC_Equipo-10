//si, ese nombre no es ironico, es real
function pronounCalculator(fem, masc) {
    return creatureFemPronouns.includes(encounter.creatureID) ? fem : masc;
}
//hace un roll con un dado d y modificador mod
function roll(d, mod) {
    return int(random(d) + 1) + mod;
}
//calcula modificador a partir de un score
function mod(score) {
    return int((score - 10) / 2);
}

//revive chr al comienzo del combate o lo desactiva si es hardcore
function resetChr() {
    if (chr.hardCore == 0) {
        chr.luck = 0;
        chr.currHealth = chr.maxHealth;
        chr.gold = int(chr.gold / 2);

        encounter.creatureCurrHealth = creatures[encounter.creatureID].maxHealth;
        encounter.effects.splice(0, encounter.effects.length);
        encounter.round = 0;
        encounter.turn = 0;
        waitStart(8); //dialogo de softcore death info
    }
    else {
        waitStart(9); //dialogo de hardcore death info
    }

    /*chr.level = 1;
    chr.xp = 0;
    chr.prof = 2;
    chr.luck = 0;
    chr.encounters = 0;
    chr.gameState = 6;
    chr.equippedWeaponID = -1;
    chr.equippedArmorID = -1;
    chr.equippedShieldID = -1;
    chr.armor = mod(chr.abilities[1].rolledScore);
    chr.maxHealth = classes[chr.idClass].classHealth + mod(chr.abilities[2]);
    chr.currHealth = chr.maxHealth;
    chr.gold = backgrounds[chr.idBackground].initialGold;
    chr.inventory.splice(0, chr.inventory.length);
    for (let i = 0; i < 6; i++) {
        chr.abilities[i].modifier = mod(chr.abilities[i].rolledScore);
    }*/
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