function drawTown() {
    drawTextCentered('town; store or rest?', width / 2, height - 24, 24, 'white')
}

//por ahora genera el merchant y catalogo deberia generar el pueblo y otras cosas
function setupTown() {

    if (townInProgress.id != -1) { //si el pueblo en progreso devuelto por db tiene id -1
        town = townInProgress; //no habia ningun pueblo en progreso, asi que generamos uno
    }
    else {
        //inicializa pueblo
        chr.luck = 0; //fin de racha de suerte
        storeNavFocus = false;
        storeBuySellFocus = false;

        town.merchantSex = int(random(2));
        town.merchantRace = int(random(6));
        town.merchantPersonality = int(random(5));
        town.catalogue = [];

        let classItems = []; //items de la clase del jugador

        //agregamos los items relevantes a la clase del jugador a una lista de items de clase
        for (let i = 0; i < allItems.length; i++) {
            //si el item es un arma
            if (allItems[i].type == 1 && allItems[i].equippableType == 0) {
                //el item escalea con la ability relevante a nuestra clase
                if (allItems[i].abilityModID == classes[chr.idClass].abilityID) {
                    classItems.push(i);
                }
            }
            //si el item es consumible
            if (allItems[i].type == 2) {
                if (allItems[i].effectID == classes[chr.idClass].abilityID) {
                    classItems.push(i);
                }
            }
        }

        //randomizamos el tamaño del catalogo
        let catalogueSize = int(random(8, 16))

        //llenamos la lista de la tienda con items
        for (let i = 0; i < catalogueSize; i++) {

            //generamos ids random para elegir items de las listas de items random e items de clase random
            //si ya esta en el catalogo, volvemos a generar
            let randomItem;
            do {
                randomItem = int(random(allItems.length));
            }
            while (town.catalogue.includes(allItems[randomItem].id) || allItems[randomItem].id == 20 || allItems[randomItem].id == 42 || allItems[randomItem].type == 0);
            //nos aseguramos que no pueda vender ni unarmed strike ni vestimentas comunes
            let randomClassItem;
            do {
                randomClassItem = int(random(classItems.length));
            }
            while (town.catalogue.includes(classItems[randomClassItem]) || classItems[randomClassItem] == 20 || classItems[randomClassItem] == 42);

            //50% items random
            if (random() < 0.5) {
                town.catalogue.push(randomItem);
            }
            //50% items de la clase del jugador
            else {
                town.catalogue.push(classItems[randomClassItem]);
            }
        }
        manageTown(0); //crea en db
        //TEMP agregar un dialogo de bienvenida
    }

}

function manageTown(type) {
    if (type == 0) {
        town.characterID = chr.id;
        town.merchantSex = town.merchantSex;
        town.merchantRace = town.merchantRace;
        town.merchantPersonality = town.merchantPersonality;
        saveTown(town, type);
    }
    else if (type == 1) {
        saveTown(town, type);
    }
    else {
        townInProgress = -1;
        saveTown(town, type);
    }
}