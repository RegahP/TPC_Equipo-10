//todas las funciones de lectura de db

//lee el character devuelto por codebehind y lo retorna como js vars
function loadCharacter() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetCharacter",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var character = response.d;
                if (character) {
                    console.log("Character recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(character);
                } else {
                    reject("Character data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving character from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las abilidades del juego devueltas por codebehind y lo retorna como js vars
function loadAbilities() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetAbilities",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var abilities = response.d;
                if (abilities) {
                    console.log("Abilities recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(abilities);
                } else {
                    reject("Abilities data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving abilities from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee la lista de items devuelta por codebehind y lo retorna como js vars
function loadItems() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetItems",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var items = response.d;
                if (items) {
                    console.log("All items recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(items);
                } else {
                    reject("All items data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving character from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}