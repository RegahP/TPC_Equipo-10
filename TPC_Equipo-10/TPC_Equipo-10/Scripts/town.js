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
}