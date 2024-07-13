function drawCombat() {

    drawTextCentered('combat; lose or win?', width / 2, height - 24, 24, 'white')
    drawCreatureSprite(width - (64 * 8), height - (64 * 8) - navHeight, 8, encounter.creatureID);
    drawChrSprite(width / 2 - (width / 4), height - (32 * 8) - navHeight, 8, false);

    drawCombatUI();

    drawNav();
    if (navFocus) {
        drawInventory();
    }
}

//vars del navegador de combate
let nav = ["Atacar", "Defender", "Especial", "Inventario"]; //items del nav
let navIndex; //en que opcion estamos parados
let navHeight = 120;
let navFocus = false; //0 = nav; 1 = inventory

//vars de las creatures
let creatureCrop = [0, 16, 32, 48, 80, 112, 160, 224, 240, 288, 336, 352, 368, 400, 464, 480, 512, 544]; //crop data para mostrar la parte del spritesheet correcta
let creatureFemPronouns = [0, 2, 7, 16]; //lista de ids de creatures que prefieren pronombres femeninos

//vars del combate
let attackStatus; //si un ataque es exitoso o no
let damage;
let weapon;
let attack;
let levelUp;

function setupCombat() {
    //resetea el focus, indice, genera creature
    navFocus = false;
    navIndex = 0;

    if (encounterInProgress.id != -1) { //si el encuentro en progreso devuelto por db tiene id -1
        encounter = encounterInProgress; //no habia ningun encuentro en progreso, asi que generamos uno

        if (encounter.turn == 1) { //si el encuentro que viene de db estaba en turno 1, ataca creature
            if (encounter.creatureCurrHealth > 0) { //creature no murio todavia
                creatureAttack(); //creature ataca
                waitStart(4); //dialogo del ataque de creature
            }
            else {
                manageEncounter(2); //elimina en db
                waitStart(5); //dialogo de fin del encounter
            }
        }
    }
    else {
        //inicializa encounter
        do {
            encounter.creatureID = int(random(18));
        }
        while (creatures[encounter.creatureID].rating > chr.encounters + 3 || creatures[encounter.creatureID].rating < chr.encounters - 3);

        chr.luck++; //sube tu suerte
        manageEncounter(0); //crea en db
        waitStart(3); //triggerea dialogo de inicio de combate
    }

    //inicializa vars de combate
    attackStatus = false;
    damage = 0;
    levelUp = false;
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

//vars del inventario
let invItems = []; //en combate y tienda de venta, se carga con tus items, en tienda de compra, los items del merchant
let invIndex; //en que items estamos parados
let invFocus; //0 = panel izq; 1 = panel der
let invEmpty; //si esta vacio el inventario
let scrollShift; //valor para desfazar la lista de items al scrollear

let outerMargin = 50; //margen exterior
let innerMargin = 20; //margen interior
let itemSize = 24; //tamaño de los items en la lista
let buttonSize = 16; //invertido

//vars del inventario en tienda
let buyPopup; //si esta prendido el popup de compra
let buyPopupFocus; //si el cursor esta a la izq o der del popup

let sellPopup; //si esta prendido el popup de venta
let sellPopupFocus; //si el cursor esta a la izq o der del popup

let popupSize = 2.5; //tamaño del popup; invertido

function setupInventory() {
    invIndex = 0;
    invFocus = false;
    invEmpty = false;
    scrollShift = 0;

    //en combate y tienda de venta, se carga con tus items, en tienda de compra, los items del merchant
    if (chr.gameState == 1 || (chr.gameState == 4 && storeBuySellFocus)) {
        invItems = [];
        for (let i = 0; i < chr.inventory.length; i++) {
            invItems.push(chr.inventory[i]);
        }
    }
    else if (chr.gameState == 4 && !storeBuySellFocus) {

        invItems = catalogueItems;//si estamos en la tienda, cargamos el catalogo de items
    }

    //si lo que cargamos dejo el inventario vacio, lo declaramos como vacio
    if (invItems.length == 0) {
        invEmpty = true;
    }

    sellPopup = false;
    sellPopupFocus = false;
    itemSold = false;

    buyPopup = false;
    buyPopupFocus = false;
    itemBought = false;
}

function drawInventory() {
    //fondo
    fill(0, 0, 0, 128);
    rect(0, 0, width, height);
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
            allItems[invItems[i]].name,
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
        textSize(getTextSizeToFit(allItems[invItems[invIndex]].name, 350, 50));
        push();
        clip(topPanelMask);
        text(
            allItems[invItems[invIndex]].name,
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
            allItems[invItems[invIndex]].desc,
            width / 2 + innerMargin,
            outerMargin + innerMargin + 24 + 36 + 32,
            width / 2 - outerMargin - innerMargin - (width / (buttonSize / 2) + itemSize * 2)
        )
        pop();

        //item sprite slot
        fill(120);
        rect(
            width - outerMargin - innerMargin * 2 - (width / 2 - outerMargin - innerMargin) / 5,
            outerMargin + innerMargin * 2,
            (width / 2 - outerMargin - innerMargin) / 5,
            (width / 2 - outerMargin - innerMargin) / 5
        );
        //item sprite
        drawItemSprite(
            width - outerMargin - innerMargin * 2 - (width / 2 - outerMargin - innerMargin) / 5,
            outerMargin + innerMargin * 2,
            ((width / 2 - outerMargin - innerMargin) / 5) / 16,
            invItems[invIndex]
        );

        if (chr.gameState == 4) {
            //item price
            fill(255);
            textAlign(RIGHT, CENTER);
            textSize(16);
            text(
                allItems[invItems[invIndex]].price + ' de Oro',
                width - outerMargin - innerMargin * 2,
                outerMargin + innerMargin * 3 + (width / 2 - outerMargin - innerMargin) / 5
            );
        }

        if (allItems[invItems[invIndex]].type != 0) {

            if (invItems[invIndex] == chr.equippedWeaponID || invItems[invIndex] == chr.equippedArmorID || invItems[invIndex] == chr.equippedShieldID) {
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
        }

        let buttonTxt;
        let buttonColor;

        if (chr.gameState == 1) {
            //si estamos en combate, el boton equipa/consume TEMP
            if (allItems[invItems[invIndex]].type == 1) { //es equippable

                if (invItems[invIndex] == chr.equippedWeaponID || invItems[invIndex] == chr.equippedArmorID || invItems[invIndex] == chr.equippedShieldID) {
                    buttonColor = color(128);
                    buttonTxt = "Equipado";
                } else {
                    buttonColor = color(255);
                    buttonTxt = "Equipar";
                }
            }
            else if (allItems[invItems[invIndex]].type == 2) { //es consumible

                if (false) { //MEGA TEMP
                    buttonColor = color(128);
                    buttonTxt = "Consumido";
                } else {
                    buttonColor = color(255);
                    buttonTxt = "Consumir";
                }
            }
        }
        //si estamos en la tienda, el boton vende
        else if (chr.gameState == 4) {
            buttonColor = color(255);

            if (!storeBuySellFocus) {
                buttonTxt = "Comprar";

                //configuramos el texto del merchant segun si aun no compraste o si ya compraste
                if (!merchantDialogueShowBoughtStatus) {
                    merchantDialogue = merchantShowDialogues[merchantPersonality][merchantShowDialogueOption];
                } else {
                    merchantDialogue = merchantBoughtDialogues[merchantPersonality][merchantBoughtDialogueOption];
                }
            }
            else {
                buttonTxt = "Vender";

                //configuramos el texto del merchant segun si aun no vendiste o si ya vendiste
                if (!merchantDialoguePreSoldStatus) {
                    merchantDialogue = merchantPreDialogues[merchantPersonality][merchantPreDialogueOption];
                } else {
                    merchantDialogue = merchantSoldDialogues[merchantPersonality][merchantSoldDialogueOption];
                }
            }
        }
        if (allItems[invItems[invIndex]].type != 0) { //no sea un item generico
            fill(buttonColor)
            textSize(itemSize);
            textAlign(CENTER, CENTER);
            text(
                buttonTxt,
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
        }
        

        if (chr.gameState == 1) {

            //display de arma, escudo y armadura
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
            if (chr.equippedWeaponID != -1) {
                drawItemSprite(
                    width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 4 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    ((width / 2 - outerMargin - innerMargin) / 5) / 16,
                    chr.equippedWeaponID
                );
            }
            if (chr.equippedShieldID != -1) {
                drawItemSprite(
                    width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 9 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    ((width / 2 - outerMargin - innerMargin) / 5) / 16,
                    chr.equippedShieldID
                );
            }
            if (chr.equippedArmorID != -1) {
                drawItemSprite(
                    width / 2 + ((width / 2 - outerMargin - innerMargin) / 20) * 16 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    height / 2 + innerMargin * 0.5 + (height / 2 - innerMargin * 1.5 - outerMargin) / 2 - ((width / 2 - outerMargin - innerMargin) / 5) / 2,
                    ((width / 2 - outerMargin - innerMargin) / 5) / 16,
                    chr.equippedArmorID
                );
            }
        }

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

        let emptyTxt;

        //estamos en combate
        if (chr.gameState == 1) {
            emptyTxt = "Tu inventario está vacío!";
        }
        //estamos en la tienda
        if (chr.gameState == 4) {
            //actualizamos el dialogo del merchant para reflejar el inventario vacio
            if (!storeBuySellFocus) {
                emptyTxt = "Compraste todo en la tienda!";
                merchantDialogue = merchantEmptyBuyDialogues[merchantPersonality];
            } else {
                emptyTxt = "Tu inventario está vacío!";
                merchantDialogue = merchantEmptySellDialogues[merchantPersonality];
            }
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
            popupTxt = 'Estás seguro de que querés comprar ' + allItems[invItems[invIndex]].name + ' por ' + allItems[invItems[invIndex]].price + ' monedas de oro?';
        } else {
            popupTxt = 'Estás seguro de que querés vender tu ' + allItems[invItems[invIndex]].name + ' por ' + allItems[invItems[invIndex]].price + ' monedas de oro?';
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
}

//compra el item seleccionado
function buyItem() {
    //te resta el oro del item
    chr.gold -= allItems[invItems[invIndex]].price;
    //lo agrega a tu inventario
    chr.inventory.push(allItems[invItems[invIndex]].id);
    //lo elimina de la lista
    if (invIndex == invItems.length - 1) {
        invItems.splice(invIndex, 1);
        invIndex -= 1;
    } else {
        invItems.splice(invIndex, 1);
    }
    //save character
    if (invItems.length == 0) {
        invEmpty = true;
    }
    //cambia el dialogo de pre venta a post venta
    merchantDialogueShowBoughtStatus = true;
    //elige otra opcion de dialogo segun su personalidad
    pickMerchantDialogueOptions();
}
//vende el item seleccionado
function sellItem() {
    //te suma el oro del item
    chr.gold += allItems[invItems[invIndex]].price;
    //lo elimina de tu inventario
    chr.inventory.splice(invIndex, 1);
    //lo elimina de la lista
    if (invIndex == invItems.length - 1) {
        invItems.splice(invIndex, 1);
        invIndex -= 1;
    } else {
        invItems.splice(invIndex, 1);
    }
    //save character
    if (invItems.length == 0) {
        invEmpty = true;
    }
    //cambia el dialogo de pre venta a post venta
    merchantDialoguePreSoldStatus = true;
    //elige otra opcion de dialogo segun su personalidad
    pickMerchantDialogueOptions();
}
//calcula iniciativa (en desuso)
function initiative() { //el rolledscore de la creature ya es modifier, no ideal
    if (chr.abilities[1].modifier < creature.abilities[1]) {
        return true;
    }
    return false;
}
//proceso de ataque
function characterAttack() {

    if (!allItems[chr.equippedWeaponID]) { //si no tenemos nada equipado
        weapon = allItems[20]; //usa golpe desarmado
    }
    else {
        weapon = allItems[chr.equippedWeaponID];
    }
    let creature = creatures[encounter.creatureID];
    let attackRoll = roll(20, chr.abilities[weapon.abilityModID].modifier + chr.prof);
    damage = 0;

    if (attackRoll > creature.armor) {
        attackStatus = true;
        damage = weapon.damage + chr.abilities[weapon.abilityModID].modifier + chr.prof;
        if (encounter.creatureCurrHealth - damage > 0) {
            encounter.creatureCurrHealth -= damage;
        }
        else {
            encounter.creatureCurrHealth = 0;
            //mandar a eliminar encounter en db
        }
    }
    else {
        attackStatus = false;
    }
    encounter.turn = true; //turno de creature
    manageEncounter(1); //actualiza en db
    print('ataca chr');
    print('attackStatus', attackStatus);
    print('damage', damage);
    print('creature currHealth', encounter.creatureCurrHealth);
}

function creatureAttack() {
    let creature = creatures[encounter.creatureID];
    attack = attacks[creature.attacks[int(random(creature.attacks.length))]];
    let attackRoll = roll(20, creature.abilities[attack.abilityID] + creature.prof);
    damage = 0;

    if (attackRoll > chr.armor) {
        attackStatus = true;
        damage = attack.damage + creature.abilities[attack.abilityID];
        if (chr.currHealth - damage > 0) {
            chr.currHealth -= damage;
        }
        else {
            chr.currHealth = 0;
            //mandar a matar chr
        }
    }
    else {
        attackStatus = false;
    }
    encounter.turn = false; //turno de chr
    encounter.currRound++;
    manageEncounter(1); //actualiza en db
    print('ataca creature');
    print('attackStatus', attackStatus);
    print('damage', damage);
    print('chr.currHealth', chr.currHealth);
}

function manageEncounter(type) {
    if (type == 0) {
        encounter.characterID = chr.id;
        encounter.creatureID = encounter.creatureID;
        encounter.creatureCurrHealth = creatures[encounter.creatureID].maxHealth;
        encounter.currRound = 0;
        encounter.turn = false;
        saveEncounter(encounter, type); 
    }
    else if (type == 1) {
        saveEncounter(encounter, type);
    }
    else {
        encounterInProgress.id = -1;
        chr.encounters++;
        chr.gold += creatures[encounter.creatureID].gold;
        if (chr.xp + 7 >= chr.level * 10) {

            levelUp = true;
        }
        else {
            chr.xp += 7;
        }
        saveEncounter(encounter, type);
    }
}
//calcula las nuevas estadisticas segun nuevos modificadores
function levelUpCalculator() {

    for (let i = 0; i < chr.abilities.length; i++) { //aplica pluses
        chr.abilities[i].modifier += pluses[i];
    }

    chr.xp += 7 - chr.level * 10;
    chr.level++;
    chr.armor = 10 + chr.abilities[1].modifier;
    chr.maxHealth += classes[chr.idClass].classHealth + chr.abilities[2].modifier;
    chr.currHealth = chr.maxHealth;
}

function drawCombatUI() {
    //character ui
    //healthbar
    noStroke();
    fill(60);
    rect(
        outerMargin / 2 - 5,
        outerMargin / 2 - 5,
        width / 2 - innerMargin + 10 - outerMargin / 2,
        (height / 20) + 10
    )
    fill('#24523b'); //verde oscuro
    rect(
        outerMargin / 2,
        outerMargin / 2,
        width / 2 - innerMargin - outerMargin / 2,
        height / 20
    )
    fill('#59c135'); //verde
    rect(
        outerMargin / 2,
        outerMargin / 2,
        (width / 2 - innerMargin - outerMargin / 2) * (chr.currHealth / chr.maxHealth),
        height / 20
    )

    //texto con puntos de vida
    fill(255);
    textSize(24);
    textAlign(RIGHT, CENTER);
    text(
        chr.currHealth + ' / ' + chr.maxHealth,
        (outerMargin / 4) + (width / 2 - innerMargin - outerMargin / 2) * Math.max((chr.currHealth / chr.maxHealth), 0.175),
        (outerMargin / 2) + (height / 20) / 2
    );

    //name
    fill(255);
    textSize(36);
    textAlign(LEFT, TOP);
    text(
        chr.name,
        outerMargin / 2,
        outerMargin + height / 20
    );

    //creature ui
    //healthbar
    fill(60);
    rect(
        width / 2 + outerMargin / 2 - 5,
        outerMargin / 2 - 5,
        width / 2 - innerMargin - outerMargin / 2 + 10,
        (height / 20) + 10
    )
    fill('#73172d'); //rojo oscuro
    rect(
        width / 2 + outerMargin / 2,
        outerMargin / 2,
        width / 2 - innerMargin - outerMargin / 2,
        height / 20
    )
    fill('#b4202a'); //rojo
    rect(
        width / 2 + outerMargin / 2 + (width / 2 - innerMargin - outerMargin / 2) * (1 - (encounter.creatureCurrHealth / creatures[encounter.creatureID].maxHealth)),
        outerMargin / 2,
        (width / 2 - innerMargin - outerMargin / 2) * (encounter.creatureCurrHealth / creatures[encounter.creatureID].maxHealth),
        height / 20
    )

    //texto con puntos de vida
    fill(255);
    textSize(24);
    textAlign(LEFT, CENTER);
    text(
        encounter.creatureCurrHealth + ' / ' + creatures[encounter.creatureID].maxHealth,
        width / 2 + outerMargin + (width / 2 - innerMargin - outerMargin / 2) * Math.min((1 - (encounter.creatureCurrHealth / creatures[encounter.creatureID].maxHealth)), 0.78),
        (outerMargin / 2) + (height / 20) / 2
    );

    //name
    fill(255);
    textSize(36);
    textAlign(RIGHT, TOP);
    text(
        creatures[encounter.creatureID].name,
        width - outerMargin / 2,
        outerMargin + height / 20
    );
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

    let item = allItems[invItems[id]];
    let itemTypeText = '';

    itemTypeText += getItemTypeName(item.type, item.equippableType, item.armorType);
    if (item.type == 1) { //es equipable
        if (item.equippableType == 0) { //es un arma
            itemTypeText += ' | ' + item.damage + ' de Daño ' + dmgTypes[item.dmgTypeID].name + ' | Aumenta con ' + abilities[item.abilityModID].name;
        }
        else if (item.equippableType == 1) { // es un armor (armadura/escudo)
            itemTypeText += ' | ' + item.armor + ' de Armadura | Resistente al Daño ' + dmgTypes[item.resTypeID].name;
        }
    }
    else if (item.type == 2) { //es consumible
        let effectTxt = item.effectID == -1 ? 'Vida' : abilities[item.effectID].name
        itemTypeText += ' | +' + item.amount + ' de ' + effectTxt;
        if (item.effectID > -1) {
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