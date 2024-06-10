//declaraciones de vars generales
let chr;

let centerX;
let centerY;

//todas las imagenes
let chr_spritesheet;
let chr_fx_darkspotlight;

//la carga de imagenes se hace en preload, para que el juego arranque
//solo una vez que se cargaron todas los archivos e imagenes necesarias
function preload() {
    chr_spritesheet = loadImage("../Sprites/chr_spritesheet.png");
    chr_fx_darkspotlight = loadImage("../Sprites/chr_fx_darkspotlight.png");
}

//setup asincronico para que espere a las ajax calls hasta que terminen antes de avanzar
async function setup() {
    var canvas = createCanvas(1280, 720);
    canvas.parent("gameCanvas");

    noSmooth();
    centerX = width / 2;
    centerY = height / 2;

    try {
        chr = await loadCharacter();
    } catch (error) {
        console.error("Failed to load character in p5js:", error);
    }
    if (chr) {
        console.log("Character loaded in p5js succesfully:", chr);
    }
}

function draw() {
    background(0);
    if (chr) {
        switch (chr.gameState) {
            case 0: //intro
                drawIntro();
                break;
            case 1: //combat
                drawCombat();
                break;
            case 2: //endcombat
                drawEndCombat();
                break;
            case 3: //town
                drawTown();
                break;
            case 4: //store
                drawStore();
                break;
            case 5: //rest
                drawRest();
                break;
            case 6: //dead
                drawDead();
                break;
            default:
                break;
        }
    }
}

function keyPressed() {
    if (chr) {
        switch (chr.gameState) {
            case 0: //intro
                chr.gameState = 1;
                break;
            case 1: //combat
                if (key === 'q') {
                    chr.gameState = 6;
                }
                else if (key === 'e') {
                    chr.gameState = 2;
                }
                break;
            case 2: //endcombat
                if (key === 'q') {
                    chr.gameState = 1;
                }
                else if (key === 'e') {
                    chr.gameState = 3;
                }
                break;
            case 3: //town
                if (key === 'q') {
                    chr.gameState = 4;
                }
                else if (key === 'e') {
                    chr.gameState = 5;
                }
                break;
            case 4: //store
                chr.gameState = 3;
                break;
            case 5: //rest
                chr.gameState = 1;
                break;
            case 6: //dead
                chr.gameState = 0;
                break;
            default:
                break;
        }
    }
    console.log("gameState ", chr.gameState)
    saveCharacter(chr);
}