//todas las functiones de escritura a db

//lee el character devuelto de codebehind y lo retorna como js vars
//manda el character modificado a codebehind a guardar en la db
function saveCharacter(character) {
    $.ajax({
        type: "POST",
        url: "Game.aspx/SaveCharacter",
        data: JSON.stringify({ character: character }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Character sent from AJAX Call to CodeBehind succesfully.");
        },
        error: function (err) {
            console.log("Error sending character from AJAX Call to CodeBehind:", err);
        }
    });
}

function saveEncounter(encounter, type) {
    $.ajax({
        type: "POST",
        url: "Game.aspx/SaveEncounter",
        data: JSON.stringify({ encounter: encounter, type: type }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Encounter sent from AJAX Call to CodeBehind succesfully.");
        },
        error: function (err) {
            console.log("Error sending Encounter from AJAX Call to CodeBehind:", err);
        }
    });
}