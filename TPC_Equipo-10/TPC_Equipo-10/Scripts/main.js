let chr;

//setup asincronico para que espere a las ajax calls hasta que terminen antes de avanzar
async function setup() {
    var canvas = createCanvas(1280, 720);
    canvas.parent("gameCanvas");

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
    background(255);
    if (chr && chr.playing) {

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
                chr.gameState = 2;
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
            default:
                break;
        }
    }
    console.log("gameState ", chr.gameState)
    saveCharacter(chr);
}