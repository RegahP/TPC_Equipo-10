function drawTown() {
    drawTextCentered('town; store or rest?', width / 2, height - 24, 24, 'white')
}

//por ahora genera el merchant, deberia generar el pueblo y otras cosas
function setupTown() {
    storeNavFocus = false;
    storeBuySellFocus = false;

    merchantSex = int(random(2));
    merchantRace = int(random(6));
    merchantPersonality = int(random(5));
    catalogueItems = [];

    let classItems = []; //items de la clase del jugador

    //agregamos los items relevantes a la clase del jugador a una lista de items de clase
    for (let i = 0; i < allItems.length; i++) {
        //si el item es un arma
        if (allItems[i].type == 1 && allItems[i].equippableType == 0) {
            //el item escalea con la ability relevante a nuestra clase
            if (allItems[i].abilityModID == chr.chrClass.abilityID) {
                classItems.push(i);
            }
        }
        //si el item es consumible
        if (allItems[i].type == 2) {
            if (allItems[i].effectID == chr.chrClass.abilityID) {
                classItems.push(i);
            }
        }
    }

    //randomizamos el tamaño del catalogo
    let catalogueSize = int(random(8, 12))

    //llenamos la lista de la tienda con items
    for (let i = 0; i < catalogueSize; i++) {

        let randomItem = int(random(allItems.length));
        let randomClassItem = int(random(classItems.length));

        //50% items random
        if (random() < 0.5) {
            catalogueItems.push(allItems[randomItem].id);
            console.log("se agrego un item random");
        }
        //50% items de la clase del jugador
        else {
            catalogueItems.push(classItems[randomClassItem]);
            console.log("se agrego un item de clase");
        }
    }

    for (let i = 0; i < catalogueItems.length; i++) {
        console.log(catalogueItems[i]);
    }
}