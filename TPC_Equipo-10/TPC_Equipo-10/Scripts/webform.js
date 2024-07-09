const webform_chr_spritesheet = new Image();
webform_chr_spritesheet.src = "../Sprites/chr_spritesheet.png";

const webform_race_spritesheet = new Image();
webform_race_spritesheet.src = "../Sprites/webform_race_spritesheet.png";

const webform_class_spritesheet = new Image();
webform_class_spritesheet.src = "../Sprites/webform_class_spritesheet.png";

//dibuja un chr sprite con clase raza sexo para webform
function webformDrawChrSprite(canvas, race, cls, sex) {
    const ctx = canvas.getContext('2d');
    const size = 5;
    const posX = 4 * size;
    const posY = -6.25 * size;

    ctx.imageSmoothingEnabled = false;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.drawImage(
        webform_chr_spritesheet,
        race * 16,
        cls * 32 + (sex * 128), 
        16,
        32,
        posX,
        posY,
        16 * size,
        32 * size
    );
}

//dibuja un chr sprite de class/sex non-specific para webform
function webformDrawRaceSprite(canvas, race, format) {

    const ctx = canvas.getContext('2d');

    let size = 5;
    let posX = 4 * size;
    let posY = -6.25 * size;

    if (format == 0) {
        size = 8;
        posX = 0;
        posY = -9 * size;
    }

    ctx.imageSmoothingEnabled = false;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.drawImage(
        webform_race_spritesheet,
        race * 16,
        0,
        16,
        32,
        posX,
        posY,
        16 * size,
        32 * size
    );
}

//dibuja un chr sprite de class/sex non-specific para webform
function webformDrawClassSprite(canvas, cls, format) {

    const ctx = canvas.getContext('2d');

    let size = 5;
    let posX = 4 * size;
    let posY = -6.25 * size;

    if (format == 0) {
        size = 8;
        posX = 0;
        posY = -9 * size;
    }

    ctx.imageSmoothingEnabled = false;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.drawImage(
        webform_class_spritesheet,
        cls * 16,
        0,
        16,
        32,
        posX,
        posY,
        16 * size,
        32 * size
    );
}

window.onload = function () {
    //para los sprites de chr player
    const chrCanvases = document.querySelectorAll('.chr-canvas');
    chrCanvases.forEach(canvas => {
        const race = parseInt(canvas.getAttribute('data-race'));
        const cls = parseInt(canvas.getAttribute('data-class'));
        const sex = parseInt(canvas.getAttribute('data-sex'));
        webformDrawChrSprite(canvas, race, cls, sex);
    });

    //para los sprites de chr race
    const raceCanvases = document.querySelectorAll('.race-canvas');
    raceCanvases.forEach(canvas => {
        const race = parseInt(canvas.getAttribute('data-race'));
        const format = parseInt(canvas.getAttribute('data-format'));
        webformDrawRaceSprite(canvas, race, format);
    });

    //para los sprites de chr class
    const classCanvases = document.querySelectorAll('.class-canvas');
    classCanvases.forEach(canvas => {
        const cls = parseInt(canvas.getAttribute('data-class'));
        const format = parseInt(canvas.getAttribute('data-format'));
        webformDrawClassSprite(canvas, cls, format);
    });
}