const webform_chr_spritesheet = new Image();
webform_chr_spritesheet.src = "../Sprites/chr_spritesheet.png";

const webform_race_spritesheet = new Image();
webform_race_spritesheet.src = "../Sprites/webform_race_spritesheet.png";

const webform_class_spritesheet = new Image();
webform_class_spritesheet.src = "../Sprites/webform_class_spritesheet.png";

const webform_icons_spritesheet = new Image();
webform_icons_spritesheet.src = "../Sprites/icons_spritesheet.png";

let toggleCanvasesList = [];

let toggle = false;
let toggleTimer = 0;

//dibuja un chr sprite con clase raza sexo para webform
function webformDrawChrSprite(canvas, race, cls, sex, format) {
    const ctx = canvas.getContext('2d');
    
    let size = 6;
    let posX = 2.5 * size;
    let posY = -10.5 * size;

    if (format == 0) {
        size = 8;
        posX = 0;
        posY = -8.5 * size;
    }
    else if (format == 1) {
        size = 30;
        posX = -2 * size;
        posY = -8 * size;
    }

    ctx.imageSmoothingEnabled = false;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.shadowColor = "grey";
    ctx.shadowBlur = 5;

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

//dibuja un chr race sprite de class/sex non-specific para webform
function webformDrawRaceSprite(canvas, race, sex, format) {

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

    ctx.shadowColor = "grey";
    ctx.shadowBlur = 5;

    ctx.drawImage(
        webform_race_spritesheet,
        race * 16,
        sex * 32,
        16,
        32,
        posX,
        posY,
        16 * size,
        32 * size
    );
}

//dibuja un chr class sprite de class/sex non-specific para webform
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

    ctx.shadowColor = "grey";
    ctx.shadowBlur = 5;

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
//REWORKEAR
function webformDrawIcon(canvas, id, format) {

    const ctx = canvas.getContext('2d');

    let size = 2;
    let posX = 0;
    let posY = 0;

    ctx.imageSmoothingEnabled = false;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.drawImage(
        webform_icons_spritesheet,
        16 + (16 * sex),
        32,
        16,
        16,
        posX,
        posY,
        16 * size,
        16 * size
    );
}

window.onload = function () {
    //para los sprites de chr player
    const chrCanvases = document.querySelectorAll('.chr-canvas');
    chrCanvases.forEach(canvas => {
        const race = parseInt(canvas.getAttribute('data-race'));
        const cls = parseInt(canvas.getAttribute('data-class'));
        const sex = parseInt(canvas.getAttribute('data-sex'));
        const toggle = parseInt(canvas.getAttribute('data-toggle'));
        const format = parseInt(canvas.getAttribute('data-format'));

        if (toggle == 1) {
            toggleCanvasesList.push(canvas);
        }
        webformDrawChrSprite(canvas, race, cls, sex, format);
    });

    //para los sprites de chr race
    const raceCanvases = document.querySelectorAll('.race-canvas');
    raceCanvases.forEach(canvas => {
        const race = parseInt(canvas.getAttribute('data-race'));
        const format = parseInt(canvas.getAttribute('data-format'));
        const toggle = parseInt(canvas.getAttribute('data-toggle'));

        if (toggle == 1) {
            toggleCanvasesList.push(canvas);
        }

        webformDrawRaceSprite(canvas, race, 0, format);
    });

    //para los sprites de chr class
    const classCanvases = document.querySelectorAll('.class-canvas');
    classCanvases.forEach(canvas => {
        const cls = parseInt(canvas.getAttribute('data-class'));
        const format = parseInt(canvas.getAttribute('data-format'));
        webformDrawClassSprite(canvas, cls, format);
    });
}

function toggleCanvases() {
    //para los sprites de chr player
    toggle = !toggle;

    toggleCanvasesList.forEach(canvas => {
        if (canvas.classList.contains('chr-canvas')) {
            const race = parseInt(canvas.getAttribute('data-race'));
            const cls = parseInt(canvas.getAttribute('data-class'));
            const format = parseInt(canvas.getAttribute('data-format'));
            webformDrawChrSprite(canvas, race, cls, toggle, format);
        }
        else if (canvas.classList.contains('race-canvas')) {
            const race = parseInt(canvas.getAttribute('data-race'));
            const format = parseInt(canvas.getAttribute('data-format'));
            webformDrawRaceSprite(canvas, race, toggle, format);
        }
    });
}

function draw() {
    if (toggleCanvasesList.length > 0) {
        if (toggleTimer < 2000) {
            toggleTimer += deltaTime;
        }
        else {
            toggleTimer = 0;
            toggleCanvases();
        }
    }
}