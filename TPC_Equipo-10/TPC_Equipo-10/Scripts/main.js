//declaraciones de vars generales
let chr; //character
//let items; //todos los items
//let creatures; //todas las creatures

let centerX;
let centerY;

//todas las imagenes
let chr_spritesheet;
let chr_fx_darkspotlight;
let creatures_0;

//la carga de imagenes se hace en preload, para que el juego arranque
//solo una vez que se cargaron todas los archivos e imagenes necesarias
function preload() {
    chr_spritesheet = loadImage("../Sprites/chr_spritesheet.png");
    chr_fx_darkspotlight = loadImage("../Sprites/chr_fx_darkspotlight.png");
    creatures_0 = loadImage("../Sprites/creatures_0.png");
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
        //temp
        chr.sex = 0;
        chr.race.id = 0;
        chr.chrClass.id = 0;
        //temp
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

//keycontrol de todo el juego
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
                //keycontrol del nav
                if (!navFocus) { //estamos viendo el nav
                    if (keyCode === LEFT_ARROW) {
                        navIndex = (navIndex - 1 + nav.length) % nav.length;
                    } else if (keyCode === RIGHT_ARROW) {
                        navIndex = (navIndex + 1) % nav.length;
                    } else if (keyCode === ENTER) {
                        if (navIndex === 3) { //si estamos parados en la accion inventario
                            navFocus = true; //focus en el inventario
                            setupInventory();
                        }
                    }
                }
                else { //estamos viendo el inventario
                    if (keyCode === ESCAPE) {
                        navFocus = false;
                    }

                    //si la lista no esta vacia
                    if (!invEmpty) {

                        //si el focus esta en la lista, nos podemos mover
                        if (!invFocus) {
                            if (keyCode === UP_ARROW) {
                                invIndex = (invIndex - 1 + items.length) % items.length;
                            } else if (keyCode === DOWN_ARROW) {
                                invIndex = (invIndex + 1) % items.length;
                            }
                        }

                        //alternamos el focus de la lista a detalles
                        if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                            invFocus = !invFocus;
                        }

                        //si estamos en combate, el boton equipa/consume
                        //si estamos en detalles y el item no esta equipado
                        if (invFocus && items[invIndex].equipped === false) {
                            if (keyCode === ENTER) {
                                items.forEach(item => { item.equipped = false; });
                                items[invIndex].equipped = true;
                            }
                        }
                    }
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
                    setupInventory(); //TEMP, antes de esto va el panel de compra o venta
                }
                else if (key === 'e') {
                    chr.gameState = 5;
                }
                break;
            case 4: //store
                if (key === 'q') {
                    chr.gameState = 3;
                }

                //si la lista no esta vacia
                if (!invEmpty) {

                    if (!sellPopup) {
                        //si el focus esta en la lista, nos podemos mover
                        if (!invFocus) {
                            if (keyCode === UP_ARROW) {
                                invIndex = (invIndex - 1 + items.length) % items.length;
                            } else if (keyCode === DOWN_ARROW) {
                                invIndex = (invIndex + 1) % items.length;
                            }
                        }

                        //alternamos el focus de la lista a detalles
                        if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                            invFocus = !invFocus;
                        }
                    }

                    if (invFocus) {
                        //si el popup esta abierto
                        if (sellPopup) {
                            if (keyCode === ESCAPE) {
                                sellPopup = false;
                            }
                            //alternamos el focus entre cancelar o confirmar
                            if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                                sellPopupFocus = !sellPopupFocus;
                            }
                            if (keyCode === ENTER) {
                                if (!sellPopupFocus) {
                                    sellPopup = false;
                                }
                                else {
                                    itemSold = true;
                                    sellPopup = false;
                                }
                            }
                        }
                        else if (keyCode === ENTER) {
                            sellPopup = true;
                            sellPopupFocus = false;
                        }
                    }
                }

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
    //saveCharacter(chr);
}