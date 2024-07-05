//declaraciones de vars generales

let races;
let classes;
let abilities;
let skills;
let dmgTypes;
let creatures;
let attacks;
let allItems;

let chr; //character
let chrItems; //items del jugador

//todas las imagenes
let chr_spritesheet;
let chr_fx_darkspotlight;
let creatures_spritesheet;
let merchant_spritesheet;
let items_spritesheet;

//la carga de imagenes se hace en preload, para que el juego arranque
//solo una vez que se cargaron todas los archivos e imagenes necesarias
function preload() {
    chr_spritesheet = loadImage("../Sprites/chr_spritesheet.png");
    chr_fx_darkspotlight = loadImage("../Sprites/chr_fx_darkspotlight.png");
    creatures_spritesheet = loadImage("../Sprites/creatures_spritesheet.png");
    merchant_spritesheet = loadImage("../Sprites/merchant_spritesheet.png");
    items_spritesheet = loadImage("../Sprites/items_spritesheet.png");
}

//setup asincronico para que espere a las ajax calls hasta que terminen antes de avanzar
async function setup() {
    var canvas = createCanvas(1280, 720);
    canvas.parent("gameCanvas");


    try {
        races = await loadRaces();
        classes = await loadClasses();
        abilities = await loadAbilities();
        skills = await loadSkills();
        dmgTypes = await loadDamageTypes();
        creatures = await loadCreatures();
        attacks = await loadAttacks();
        allItems = await loadItems();
        chr = await loadCharacter();
    } catch (error) {
        console.error("Failed to load something in p5js:", error);
    }
    if (races) {
        console.log("Races loaded in p5js succesfully:", races);
    }
    if (classes) {
        console.log("Classes loaded in p5js succesfully:", classes);
    }
    if (abilities) {
        console.log("Abilities loaded in p5js succesfully:", abilities);
    }
    if (skills) {
        console.log("Skills loaded in p5js succesfully:", skills);
    }
    if (dmgTypes) {
        console.log("DamageTypes loaded in p5js succesfully:", dmgTypes);
    }
    if (creatures) {
        console.log("Creatures loaded in p5js succesfully:", creatures);
    }
    if (attacks) {
        console.log("Attacks loaded in p5js succesfully:", attacks);
    }
    if (allItems) {
        console.log("All items loaded in p5js succesfully:", allItems);
    }
    if (chr) {
        console.log("Character loaded in p5js succesfully:", chr);
    }
    //desps de la carga inicializamos algunas variables globales
    noSmooth();
    textFont('Courier New');

    wait = false;
    skip = false;

    wait2 = false;
    skip2 = false;

    waitTimer = 0;
    waitDialogueID = 0;
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
    manageWaitDialogues();
}

//keycontrol de todo el juego
function keyPressed() {
    if (chr) {
        if (!wait && !wait2) {

            switch (chr.gameState) {
                case 0: //intro
                    chr.gameState = 1;
                    setupCombat(); //genera el encounter
                    waitStart(3); //triggerea dialogo de inicio de combate
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
                            if (navIndex === 0) { //si estamos parados en la accion ataque
                                attack();
                                waitStart(0); //triggerea dialogo de ataque
                            }
                            else if (navIndex === 1) { //si estamos parados en la accion defensa
                                waitStart(1); //triggerea dialogo de defensa
                            }
                            else if (navIndex === 2) { //si estamos parados en la accion especial
                                waitStart(2); //triggerea dialogo del especial
                            }
                            else { //si estamos parados en la accion inventario
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
                                    invIndex = (invIndex - 1 + invItems.length) % invItems.length;

                                    if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) < outerMargin + innerMargin) {
                                        scrollShift--;
                                    }

                                    if (invIndex == invItems.length - 1 && outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) > height - outerMargin - innerMargin * 2) {
                                        let itemCount = invItems.length;
                                        let scrollEnd = 0;
                                        while (outerMargin + innerMargin + itemCount * itemSize * 1.25 > height - outerMargin - innerMargin * 2) {
                                            itemCount--;
                                            scrollEnd++;
                                        }
                                        scrollShift = scrollEnd - 1;
                                    }
                                } else if (keyCode === DOWN_ARROW) {
                                    invIndex = (invIndex + 1) % invItems.length;

                                    if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) > height - outerMargin - innerMargin * 2) {
                                        scrollShift++;
                                    }
                                    if (invIndex == 0) {
                                        scrollShift = 0;
                                    }
                                }
                            }

                            //alternamos el focus de la lista a detalles
                            if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                                invFocus = !invFocus;
                            }

                            //si estamos en combate, el boton equipa/consume
                            //si estamos en detalles y el item no esta equipado
                            if (keyCode === ENTER && invFocus) {
                                //y es un arma
                                if (allItems[invItems[invIndex]].type == 1 && allItems[invItems[invIndex]].equippableType == 0) {
                                    chr.equippedWeapon = invItems[invIndex];
                                }
                                //o es una armadura
                                else if (allItems[invItems[invIndex]].type == 1 && allItems[invItems[invIndex]].equippableType == 1 && allItems[invItems[invIndex]].armorType == 0) {
                                    chr.equippedArmor = invItems[invIndex];
                                }
                                //o es un escudo
                                else if (allItems[invItems[invIndex]].type == 1 && allItems[invItems[invIndex]].equippableType == 1 && allItems[invItems[invIndex]].armorType == 1) {
                                    chr.equippedShield = invItems[invIndex];
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
                        setupTown(); //por ahora genera el merchant, deberia generar el pueblo y otras cosas
                    }
                    break;
                case 3: //town
                    if (key === 'q') {
                        chr.gameState = 4;
                        setupStore(); //resetea bools de navegacion de la tienda y regenera opciones de dialogo
                    }
                    else if (key === 'e') {
                        chr.gameState = 5;
                    }
                    break;
                case 4: //store
                    if (key === 'q' && !storeNavFocus) {
                        chr.gameState = 3;
                    }
                    if (!storeNavFocus) {
                        //alternamos el focus del panel de pregunta buysell
                        if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                            storeBuySellFocus = !storeBuySellFocus;
                        }
                        if (keyCode === ENTER) {
                            storeNavFocus = true;
                            setupInventory();
                            merchantDialogueShowBoughtStatus = false; //resetea al merchant a que muestre su dialogo pre compra
                            merchantDialoguePreSoldStatus = false; //resetea al merchant a que muestre su dialogo pre ventas
                        }
                    }
                    else {
                        if (keyCode === ESCAPE) {
                            storeNavFocus = false;
                        }
                        //estamos en el menu de compra
                        if (!storeBuySellFocus) {
                            //si la lista no esta vacia
                            if (!invEmpty) {

                                if (!buyPopup) {
                                    //si el focus esta en la lista, nos podemos mover
                                    if (!invFocus) {
                                        if (keyCode === UP_ARROW) {
                                            invIndex = (invIndex - 1 + invItems.length) % invItems.length; //cambia el indice de item seleccionado en la lista, da vuelta la lista

                                            //ajusta el shift si subir en la lista se va fuera del panel
                                            if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) < outerMargin + innerMargin) {
                                                scrollShift--;
                                            }

                                            //si subimos y terminamos en ultimo indice, dimos la vuelta, setea el scroll al final
                                            if (invIndex == invItems.length - 1 && outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) > height - outerMargin - innerMargin * 2) {
                                                let itemCount = invItems.length;
                                                let scrollEnd = 0;
                                                while (outerMargin + innerMargin + itemCount * itemSize * 1.25 > height - outerMargin - innerMargin * 2) {
                                                    itemCount--;
                                                    scrollEnd++;
                                                }
                                                scrollShift = scrollEnd - 1;
                                            }
                                            //si movemos el indice, el merchant vuelve a dialogos pre venta
                                            //merchantDialogueShowBoughtStatus = false;
                                        } else if (keyCode === DOWN_ARROW) {
                                            invIndex = (invIndex + 1) % invItems.length; //cambia el indice de item seleccionado en la lista, da vuelta la lista

                                            //ajusta el shift si bajar en la lista se va fuera del panel
                                            if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) > height - outerMargin - innerMargin * 2) {
                                                scrollShift++;
                                            }
                                            //si bajamos y terminamos en indice 0, dimos la vuelta, resetea el scroll
                                            if (invIndex == 0) {
                                                scrollShift = 0;
                                            }
                                            //si movemos el indice, el merchant vuelve a dialogos pre venta
                                            //merchantDialogueShowBoughtStatus = false;
                                        }
                                    }

                                    //alternamos el focus de la lista a detalles
                                    if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                                        invFocus = !invFocus;
                                    }
                                }

                                if (invFocus) {
                                    //si el popup esta abierto
                                    if (buyPopup) {
                                        if (keyCode === ESCAPE) {
                                            buyPopup = false;
                                        }
                                        //alternamos el focus entre cancelar o confirmar
                                        if (keyCode === RIGHT_ARROW || keyCode === LEFT_ARROW) {
                                            buyPopupFocus = !buyPopupFocus;
                                        }
                                        if (keyCode === ENTER) {
                                            if (!buyPopupFocus) {
                                                buyPopup = false;
                                            }
                                            else {
                                                buyItem();
                                                buyPopup = false;
                                            }
                                        }
                                    }
                                    else if (keyCode === ENTER) {
                                        buyPopup = true;
                                        buyPopupFocus = false;
                                    }
                                }
                            }
                        }
                        //estamos en el menu de venta
                        else {
                            //si la lista no esta vacia
                            if (!invEmpty) {

                                if (!sellPopup) {
                                    //si el focus esta en la lista, nos podemos mover
                                    if (!invFocus) {
                                        if (keyCode === UP_ARROW) {
                                            invIndex = (invIndex - 1 + invItems.length) % invItems.length; //cambia el indice de item seleccionado en la lista, da vuelta la lista

                                            //ajusta el shift si subir en la lista se va fuera del panel
                                            if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) < outerMargin + innerMargin) {
                                                scrollShift--;
                                            }

                                            //si subimos y terminamos en ultimo indice, dimos la vuelta, setea el scroll al final
                                            if (invIndex == invItems.length - 1) {
                                                let itemCount = invItems.length;
                                                let scrollEnd = 0;
                                                while (outerMargin + innerMargin + itemCount * itemSize * 1.25 > height - outerMargin - innerMargin * 2) {
                                                    itemCount--;
                                                    scrollEnd++;
                                                }
                                                scrollShift = scrollEnd - 1;
                                            }
                                            //si movemos el indice, el merchant vuelve a dialogos pre venta
                                            //merchantDialoguePreSoldStatus = false;
                                        } else if (keyCode === DOWN_ARROW) {
                                            invIndex = (invIndex + 1) % invItems.length; //cambia el indice de item seleccionado en la lista, da vuelta la lista

                                            //ajusta el shift si bajar en la lista se va fuera del panel
                                            if (outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift) > height - outerMargin - innerMargin * 2) {
                                                scrollShift++;
                                            }
                                            //si bajamos y terminamos en indice 0, dimos la vuelta, resetea el scroll
                                            if (invIndex == 0) {
                                                scrollShift = 0;
                                            }
                                            //si movemos el indice, el merchant vuelve a dialogos pre venta
                                            //merchantDialoguePreSoldStatus = false;
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
                                                sellItem();
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
                        }
                    }

                    break;
                case 5: //rest
                    chr.gameState = 1;
                    setupCombat(); //genera el encounter
                    waitStart(3); //triggerea dialogo de inicio de combate
                    break;
                case 6: //dead
                    chr.gameState = 0;
                    break;
                default:
                    break;
            }
        }
        else if (skip) {
            wait = false;
            skip = false;

            wait2 = true;

            waitTimer = 0;

            typeStart();
        }
        else if (skip2) {
            wait2 = false;
            skip2 = false;

            waitTimer = 0;
        }
    }
    //console.log("gameState ", chr.gameState)
    //saveCharacter(chr);
}