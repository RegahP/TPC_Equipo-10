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
                console.log("Error recieving Character from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las razas del juego devueltas por codebehind y lo retorna como js vars
function loadRaces() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetRaces",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var races = response.d;
                if (races) {
                    console.log("Races recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(races);
                } else {
                    reject("Races data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Races from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las clases del juego devueltas por codebehind y lo retorna como js vars
function loadClasses() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetClasses",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var classes = response.d;
                if (classes) {
                    console.log("Classes recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(classes);
                } else {
                    reject("Classes data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Classes from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las abilities del juego devueltas por codebehind y lo retorna como js vars
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
                console.log("Error recieving Abilities from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las skills del juego devueltas por codebehind y lo retorna como js vars
function loadSkills() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetSkills",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var skills = response.d;
                if (skills) {
                    console.log("Skills recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(skills);
                } else {
                    reject("Skills data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Skills from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee los damagetypes del juego devueltas por codebehind y lo retorna como js vars
function loadDamageTypes() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetDamageTypes",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var dmgTypes = response.d;
                if (dmgTypes) {
                    console.log("DamageTypes recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(dmgTypes);
                } else {
                    reject("DamageTypes data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving DamageTypes from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee las creatures del juego devueltas por codebehind y lo retorna como js vars
function loadCreatures() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetCreatures",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var creatures = response.d;
                if (creatures) {
                    console.log("Creatures recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(creatures);
                } else {
                    reject("Creatures data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Creatures from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee los attacks del juego devueltas por codebehind y lo retorna como js vars
function loadAttacks() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetAttacks",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var attacks = response.d;
                if (attacks) {
                    console.log("Attacks recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(attacks);
                } else {
                    reject("Attacks data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Attacks from CodeBehind to AJAX Call:", err);
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