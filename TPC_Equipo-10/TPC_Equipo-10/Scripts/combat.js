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

let invItems = []; //en combate y tienda de venta, se carga con tus items, en tienda de compra, los items del merchant
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

    //en combate y tienda de venta, se carga con tus items, en tienda de compra, los items del merchant

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
    for (i = 0; i < invItems.length; i++) {
        fill(255);
        textAlign(LEFT, TOP);
        textSize(itemSize);
        push();
        clip(listMask);
        text(
            invItems[i].name,
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
        textAlign(LEFT, CENTER);
        textSize(getTextSizeToFit(invItems[invIndex].name, 350, 50));
        push();
        clip(topPanelMask);
        text(
            invItems[invIndex].name,
            width / 2 + innerMargin,
            outerMargin + innerMargin * 2 + 18
        );
        pop();

        //item type
        fill(255);
        textAlign(LEFT, TOP);
        textSize(12);
        push();
        clip(topPanelMask);
        text(
            getItemTypeData(invIndex),
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
            invItems[invIndex].desc,
            width / 2 + innerMargin,
            outerMargin + innerMargin + 24 + 36 + 32,
            width / 2 - outerMargin - innerMargin - (width / (buttonSize / 2) + itemSize * 2)
        )
        pop();

        //item sprite slot
        fill(80);
        rect(
            width - outerMargin - innerMargin * 2 - (width / 2 - outerMargin - innerMargin) / 6,
            outerMargin + innerMargin * 2,
            (width / 2 - outerMargin - innerMargin) / 6,
            (width / 2 - outerMargin - innerMargin) / 6
        );
        //item sprite
        drawItemSprite(
            width - outerMargin - innerMargin * 2 - (width / 2 - outerMargin - innerMargin) / 6,
            outerMargin + innerMargin * 2,
            ((width / 2 - outerMargin - innerMargin) / 6) / 16,
            invItems[invIndex].id
        );

        //equipbutton
        if (invItems[invIndex].equipped) {
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
            //faltan los sprites

            //si estamos en combate, el boton equipa/consume
            if (invItems[invIndex].equipped) {
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
            width / 2 + (width / 2 - outerMargin - innerMargin) / 1.25 + 6,
            height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - 31,
            9
        );
        drawMerchantSprite(
            width / 2 + (width / 2 - outerMargin - innerMargin) / 1.25 -3,
            height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 + 5,
            9
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
        if (!storeBuySellFocus) {invItems[invIndex].price
            popupTxt = 'Estás seguro de que querés comprar ' + invItems[invIndex].name + ' por ' + invItems[invIndex].price + ' monedas de oro?';
        } else {
            popupTxt = 'Estás seguro de que querés vender tu ' + invItems[invIndex].name + ' por ' + invItems[invIndex].price + ' monedas de oro?';
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

        //lo elimina de la lista
        if (invIndex == invItems.length - 1) {
            invItems.splice(invIndex, 1);
            invIndex -= 1;
        } else {
            invItems.splice(invIndex, 1);
        }
        //te suma el oro del item
        chr.gold += invItems[invIndex].price;
        //save character
        if (invItems.length == 0) {
            invEmpty = true;
        }
        //cambia el dialogo de pre venta a post venta
        merchantDialoguePreSoldStatus = true;
        //elige otra opcion de dialogo segun su personalidad
        pickMerchantDialogueOptions();
    }
    if (itemBought) {
        itemBought = false;

        //lo elimina de la lista
        if (invIndex == invItems.length - 1) {
            invItems.splice(invIndex, 1);
            invIndex -= 1;
        } else {
            invItems.splice(invIndex, 1);
        }
        //te resta el oro del item
        chr.gold -= invItems[invIndex].price; //valor temp, deberia venir del item
        //save character
        if (invItems.length == 0) {
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

//arma el texto con todos los datos del item dinamicamente
function getItemTypeData(id) {
    let itemTypeText = '';
    itemTypeText += getItemTypeName(invItems[id].type, invItems[id].equippableType, invItems[id].armorType);
    if (invItems[id].type == 1) { //es equipable
        if (invItems[id].equippableType == 0) { //es un arma
            itemTypeText += ' | ' + invItems[id].damage + ' de Daño ' + invItems[id].dmgType.name + ' | Aumenta con ' + abilities[invItems[id].abilityModID].name;
        }
        else if (invItems[id].equippableType == 1) { // es un armor (armadura/escudo)
            itemTypeText += ' | ' + invItems[id].armor + ' de Armadura | Resistente al Daño ' + invItems[id].resType.name;
        }
    }
    else if (invItems[id].type == 2) { //es consumible
        let effectTxt = invItems[id].effectID == -1 ? 'Vida' : abilities[invItems[id].effectID].name
        itemTypeText += ' | +' + invItems[id].amount + ' de ' + effectTxt;
        if (invItems[id].effectID > -1) {
            itemTypeText += ' | Dura 2 Rondas';
        }
    }
    return itemTypeText;
}

//devuelve el nombre del tipo de item segun datos
function getItemTypeName(itemType, equippableType = -1, armorType = -1) {
    let itemTypeName;
    if (itemType == 0) {
        itemTypeName = "Genérico";
    }
    else if (itemType == 1) {
        if (equippableType == 0) {
            itemTypeName = "Arma";
        }
        else if (equippableType == 1) {
            if (armorType == 0) {
                itemTypeName = "Armadura";
            }
            else if (armorType == 1) {
                itemTypeName = "Escudo";
            }
        }
    }
    else {
        itemTypeName = "Consumible";
    }
    return itemTypeName;
}