//todas las functiones de escritura a db

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
            console.log("Error sending Character from AJAX Call to CodeBehind:", err);
        }
    });
}

//manda las abilities del character modificadas a codebehind a guardar en la db
function saveCharacterAbilities(character) {
    $.ajax({
        type: "POST",
        url: "Game.aspx/SaveCharacterAbilities",
        data: JSON.stringify({ character: character }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Character Abilities sent from AJAX Call to CodeBehind succesfully.");
        },
        error: function (err) {
            console.log("Error sending Character Abilities from AJAX Call to CodeBehind:", err);
        }
    });
}

//manda el encounter modificado a codebehind para crear, modificar o eliminar en db
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

//manda el town modificado a codebehind para crear, modificar o eliminar en db
function saveTown(town, type) {
    $.ajax({
        type: "POST",
        url: "Game.aspx/SaveTown",
        data: JSON.stringify({ town: town, type: type }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Town sent from AJAX Call to CodeBehind succesfully.");
        },
        error: function (err) {
            console.log("Error sending Town from AJAX Call to CodeBehind:", err);
        }
    });
}