function drawCombat() {
    setupCombat();
    drawTextCentered('combat; lose or win?', width / 2, height - 24, 24, 'white')

    drawChrSprite(width / 2 - (width / 4), height / 2, 10, false);
    drawSpriteCentered(creatures_0, width / 2 + (width / 4), height / 2, 10);

    drawNav();
    if (navFocus) {
        drawInventory();
    }
}

let flagCombat = false; //flag para setupear la escena
let nav = ["Atacar", "Defender", "Especial", "Inventario"]; //items del nav
let navIndex; //en que opcion estamos parados
let navHeight = 200;
let navFocus = false; //0 = nav; 1 = inventory

function setupCombat() {
    if (!flagCombat) {
        flagCombat = true;
        navIndex = 0;
    }
}

function drawNav() {
    //dibuja las opciones del nav
    let txtColor;
    for (let i = 0; i < nav.length; i++) {
        if (i === navIndex) {
            txtColor = color(0, 255, 0); //verde el seleccionado
        } else {
            txtColor = color(255); //sino blanco
        }
        drawTextCentered(nav[i], width / nav.length * (i + 0.5), height - navHeight / 2, 24, txtColor)
    }
}

let items = []; //esto va a ser cargados con items reales, no los prehechos que armé
let invIndex; //en que items estamos parados
let invFocus; //0 = panel izq; 1 = panel der
let invEmpty;
let scrollShift;

let outerMargin = 50;
let innerMargin = 20;
let itemSize = 24;
let buttonSize = 16; //invertido

//variables relevantes para el inventario en tienda
let buyPopup;
let buyPopupFocus;
let itemBought;

let sellPopup;
let sellPopupFocus;
let itemSold;
let popupSize = 2.5; //invertido

function setupInventory() {
    invIndex = 0;
    invFocus = false;
    invEmpty = false;
    scrollShift = 0;
    noStroke();
    items.splice(0, items.length);

    //esto deberia estar dentro de un if, si estamos en el inventario de venta, esto deberia cargar los items de la tienda, no los nuestros
    for (let i = 0; i < 25; i++) {
        let item = {
            name: "item" + int(random(100, 999)),
            equipped: false,
            type: random([ "Genérico", "Consumible", "Arma", "Protección"])
        };
        items.push(item);
    }

    sellPopup = false;
    sellPopupFocus = false;
    itemSold = false;

    buyPopup = false;
    buyPopupFocus = false;
    itemBought = false;
}

function drawInventory() {
    //panel de inventario
    fill(20);
    rect(
        outerMargin,
        outerMargin,
        width - outerMargin * 2,
        height - outerMargin * 2
    );

    //lista de items
    for (i = 0; i < items.length; i++) {
        fill(255);
        textAlign(LEFT, TOP);
        textSize(itemSize);
        push();
        clip(listMask);
        text(
            items[i].name,
            outerMargin + innerMargin + itemSize * 1.25,
            outerMargin + innerMargin + itemSize * 1.25 * i - (itemSize * 1.25 * scrollShift)
        );
        pop();
    }

    //panel de detalles superior
    fill(50);
    rect(
        width / 2,
        outerMargin + innerMargin,
        width / 2 - outerMargin - innerMargin,
        height / 2 - innerMargin * 1.5 - outerMargin
    );

    //panel de detalles inferior
    fill(50);
    rect(
        width / 2,
        height / 2 + innerMargin * 0.5,
        width / 2 - outerMargin - innerMargin,
        height / 2 - innerMargin * 1.5 - outerMargin
    );

    let merchantDialogue;

    //item info
    if (!invEmpty) {

        //item name
        fill(255);
        textAlign(LEFT, TOP);
        textSize(36);
        push();
        clip(topPanelMask);
        text(
            items[invIndex].name,
            width / 2 + innerMargin,
            outerMargin + innerMargin + 18
        );
        pop();

        //item type
        fill(255);
        textAlign(LEFT, TOP);
        textSize(12);
        push();
        clip(topPanelMask);
        text(
            items[invIndex].type, //esto es temp
            width / 2 + innerMargin,
            outerMargin + innerMargin + 24 + 36
        );
        pop();

        //item desc
        fill(255);
        textAlign(LEFT, TOP);
        textSize(16);
        textWrap(WORD);
        push();
        clip(topPanelMask);
        text(
            /*items[invIndex].name*/"bla bla bla lbblbla lal al bla lb abl albl ab alb lalb la blal bla lbal bla lbalb lblbalb la lb alb labl alblablbalb lb alb alb alb alb labla bla bla bla lbblbla lal al bla lb abl albl ab alb lalb la blal bla lbal bla lbalb lblbalb la lb alb labl",
            width / 2 + innerMargin,
            outerMargin + innerMargin + 24 + 36 + 32,
            width / 2 - outerMargin - innerMargin * 3 - (width / (buttonSize / 2) + itemSize * 2)
        )
        pop();

        //equipbutton
        if (items[invIndex].equipped) {
            fill(100);
        } else {
            fill(150);
        }
        rect(
            width - outerMargin - innerMargin * 2 - width / (buttonSize / 2),
            height / 2 - innerMargin * 1.5 - height / buttonSize,
            width / (buttonSize / 2),
            height / buttonSize
        );

        let equipTxt;
        let equipColor;

        if (chr.gameState == 1) {

            //display de arma, armadura y escudo
            fill(80);
            rect(
                width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 4 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                (width / 2 - outerMargin - innerMargin) / 5,
                (width / 2 - outerMargin - innerMargin) / 5
            );
            rect(
                width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 9 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                (width / 2 - outerMargin - innerMargin) / 5,
                (width / 2 - outerMargin - innerMargin) / 5
            );
            rect(
                width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 16 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                (width / 2 - outerMargin - innerMargin) / 5,
                (width / 2 - outerMargin - innerMargin) / 5
            );

            //si estamos en combate, el boton equipa/consume
            if (items[invIndex].equipped) {
                equipColor = color(128);
                equipTxt = "Equipado";
            } else {
                equipColor = color(255);
                equipTxt = "Equipar";
            }
        }
        //si estamos en la tienda, el boton vende
        else if (chr.gameState == 4) {
            equipColor = color(255);

            if (!storeBuySellFocus) {
                equipTxt = "Comprar";

                //configuramos el texto del merchant segun si aun no compraste o si ya compraste
                if (!merchantDialogueShowBoughtStatus) {
                    merchantDialogue = merchantShowDialogues[merchantPersonality][merchantShowDialogueOption];
                } else {
                    merchantDialogue = merchantBoughtDialogues[merchantPersonality][merchantBoughtDialogueOption];
                }
            }
            else {
                equipTxt = "Vender";

                //configuramos el texto del merchant segun si aun no vendiste o si ya vendiste
                if (!merchantDialoguePreSoldStatus) {
                    merchantDialogue = merchantPreDialogues[merchantPersonality][merchantPreDialogueOption];
                } else {
                    merchantDialogue = merchantSoldDialogues[merchantPersonality][merchantSoldDialogueOption];
                }
            }
        }
        fill(equipColor)
        textSize(itemSize);
        textAlign(CENTER, CENTER);
        text(
            equipTxt,
            width -
            outerMargin -
            innerMargin * 2 -
            width / (buttonSize / 2) +
            width / buttonSize,
            innerMargin +
            height / 2 -
            innerMargin * 2.5 -
            height / buttonSize +
            height / (buttonSize * 2)
        );

        //indicador de seleccion inventario
        fill(255);
        textSize(itemSize);
        if (!invFocus) {
            textAlign(LEFT, TOP);
            text(
                ">",
                outerMargin + innerMargin,
                outerMargin + innerMargin + invIndex * itemSize * 1.25 - (itemSize * 1.25 * scrollShift)
            );
        } else {
            textAlign(CENTER, CENTER);
            text(
                ">",
                width -
                outerMargin -
                innerMargin * 2 -
                width / (buttonSize / 2) -
                itemSize,
                innerMargin +
                height / 2 -
                innerMargin * 2.5 -
                height / buttonSize +
                height / (buttonSize * 2)
            );
        }
    }
    else {
        //texto de inventario vacio
        fill(255);
        textAlign(CENTER, CENTER)

        //actualizamos el dialogo del merchant para reflejar el inventario vacio
        let emptyTxt;
        if (!storeBuySellFocus) {
            emptyTxt = "Compraste todo en la tienda!";
            merchantDialogue = merchantEmptyBuyDialogues[merchantPersonality];
        } else {
            emptyTxt = "Tu inventario está vacío!";
            merchantDialogue = merchantEmptySellDialogues[merchantPersonality];
        }

        text(
            emptyTxt,
            width / 2 + (width / 2 - outerMargin - innerMargin) / 2,
            outerMargin + innerMargin + (height / 2 - innerMargin * 1.5 - outerMargin) / 2
        );
    }

    //solo en la tienda
    if (chr.gameState == 4) {
        //dibujamos al merchant en el panel inferior
        push()
        clip(bottomPanelMask);
        drawSpriteCentered(
            chr_fx_darkspotlight,
            width / 2 + (width / 2 - outerMargin - innerMargin) / 1.25 + 4,
            height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - 40,
            10
        );
        drawMerchantSprite(
            width / 2 + (width / 2 - outerMargin - innerMargin) / 1.25 + 4,
            height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2,
            10
        );

        //y su dialogo
        fill(255);
        textAlign(LEFT, TOP);
        textSize(16);
        textWrap(WORD);
        text(
            merchantDialogue,
            width / 2 + innerMargin,
            height / 2 + innerMargin * 1.5,
            width / 2 - outerMargin - innerMargin * 2 - (width / 2 - outerMargin - innerMargin) / 3
        )
        pop();
    }

    //popup de confirmacion de venta
    if (sellPopup || buyPopup) {
        fill(0, 0, 0, 128);
        rect(0, 0, width, height);
        fill(20);
        rect(
            width / 2 - (width / popupSize) / 2,
            height / 2 - (height / popupSize) / 2,
            width / popupSize,
            height / popupSize
        );
        fill(50);
        rect(
            width / 2 - (width / popupSize) / 2 + innerMargin,
            height / 2 - (height / popupSize) / 2 + innerMargin,
            width / popupSize - innerMargin * 2,
            height / popupSize - innerMargin * 2
        );
        //popup text
        fill(255);
        textAlign(LEFT, TOP);
        textSize(24);
        let popupTxt;
        if (!storeBuySellFocus) {
            popupTxt = 'Estás seguro de que querés comprar ' + items[invIndex].name + ' por 15 monedas de oro?'; //TEMP, oro deberia venir del item
        } else {
            popupTxt = 'Estás seguro de que querés vender tu ' + items[invIndex].name + ' por 15 monedas de oro?'; //TEMP, oro deberia venir del item
        }
        text(
            popupTxt,
            width / 2 - (width / popupSize) / 2 + innerMargin * 2,
            height / 2 - (height / popupSize) / 2 + innerMargin * 2,
            width / popupSize - innerMargin * 4
        );
        //popup cancel button
        fill(150);
        rect(
            width / 2 - (width / popupSize) / 2 + innerMargin * 2,
            height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize,
            width / (buttonSize / 2),
            height / buttonSize
        );
        fill(255);
        textSize(itemSize);
        textAlign(CENTER, CENTER);
        text(
            'Cancelar',
            width / 2 - (width / popupSize) / 2 + innerMargin * 2 + (width / (buttonSize / 2) / 2),
            height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2
        );

        //popup confirm button
        fill(150);
        rect(
            width / 2 - (width / popupSize) / 2 + innerMargin + width / popupSize - innerMargin * 3 - width / (buttonSize / 2),
            height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize,
            width / (buttonSize / 2),
            height / buttonSize
        );
        fill(255);
        textSize(itemSize);
        textAlign(CENTER, CENTER);
        text(
            'Confirmar',
            width / 2 - (width / popupSize) / 2 + innerMargin + width / popupSize - innerMargin * 3 - width / (buttonSize / 2) + (width / (buttonSize / 2) / 2),
            height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2
        );

        //indicador de seleccion de popup
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(itemSize);
        if (sellPopup || buyPopup) {
            if (!sellPopupFocus && !buyPopupFocus) {
                text(
                    "V",
                    width / 2 - (width / popupSize) / 2 + innerMargin * 2 + (width / (buttonSize / 2) / 2),
                    height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2 - itemSize * 2
                );
            } else {
                text(
                    "V",
                    width / 2 - (width / popupSize) / 2 + innerMargin + width / popupSize - innerMargin * 3 - width / (buttonSize / 2) + (width / (buttonSize / 2) / 2),
                    height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2 - itemSize * 2
                );
            }
        }
    }
    if (itemSold) {
        itemSold = false;
        
        if (invIndex == items.length - 1) {
            items.splice(invIndex, 1);
            invIndex -= 1;
        } else {
            items.splice(invIndex, 1);
        }
        chr.gold += 15; //valor temp, deberia venir del item
        //save character
        if (items.length == 0) {
            invEmpty = true;
        }
        //cambia el dialogo de pre venta a post venta
        merchantDialoguePreSoldStatus = true;
        //elige otra opcion de dialogo segun su personalidad
        pickMerchantDialogueOptions();
    }
    if (itemBought) {
        itemBought = false;

        if (invIndex == items.length - 1) {
            items.splice(invIndex, 1);
            invIndex -= 1;
        } else {
            items.splice(invIndex, 1);
        }
        chr.gold -= 15; //valor temp, deberia venir del item
        //save character
        if (items.length == 0) {
            invEmpty = true;
        }
        //cambia el dialogo de pre venta a post venta
        merchantDialogueShowBoughtStatus = true;
        //elige otra opcion de dialogo segun su personalidad
        pickMerchantDialogueOptions();
    }
}

//mascaras de clipping para evitar que sobresalgan los textos en el inventario
function listMask() {
    rect(
        outerMargin,
        outerMargin + innerMargin,
        width / 2 - outerMargin * 2,
        height - outerMargin * 2 - innerMargin * 2
    );
}

function topPanelMask() {
    rect(width / 2, outerMargin + innerMargin,
        width / 2 - outerMargin - innerMargin - 12,
        height / 2 - innerMargin * 2.5 - outerMargin
    );
}

function bottomPanelMask() {
    rect(
        width / 2 + innerMargin,
        height / 2 + innerMargin * 1.5,
        width / 2 - outerMargin - innerMargin * 2,
        height / 2 - outerMargin - innerMargin * 2.5
    );
}