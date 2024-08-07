﻿//todas las funciones de lectura de db

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

//lee los trasfondos del juego devueltas por codebehind y lo retorna como js vars
function loadBackgrounds() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetBackgrounds",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var backgrounds = response.d;
                if (backgrounds) {
                    console.log("Backgrounds recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(backgrounds);
                } else {
                    reject("Backgrounds data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Backgrounds from CodeBehind to AJAX Call:", err);
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
                console.log("Error recieving All items from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee el character encounter devuelto por codebehind y lo retorna como js vars
function loadEncounter(characterID) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetEncounter",
            data: JSON.stringify({ characterID: characterID }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var encounter = response.d;
                if (encounter) {
                    console.log("Character Encounter recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(encounter);
                } else {
                    reject("Character Encounter data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Character Encounter from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee la template de encounter devuelta por codebehind y lo retorna como js vars
function loadEncounterTemplate() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetEncounterTemplate",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var encounterTemplate = response.d;
                if (encounterTemplate) {
                    console.log("Encounter Template recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(encounterTemplate);
                } else {
                    reject("Encounter Template data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Encounter Template from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee la template de effect devuelta por codebehind y lo retorna como js vars
function loadEffectTemplate() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetEffectTemplate",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var effectTemplate = response.d;
                if (effectTemplate) {
                    console.log("Effect Template recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(effectTemplate);
                } else {
                    reject("Effect Template data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Effect Template from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee el character town devuelto por codebehind y lo retorna como js vars
function loadTown(characterID) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetTown",
            data: JSON.stringify({ characterID: characterID }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var town = response.d;
                if (town) {
                    console.log("Character Town recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(town);
                } else {
                    reject("Character Town data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Character Town from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}

//lee la template de town devuelta por codebehind y lo retorna como js vars
function loadTownTemplate() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "Game.aspx/GetTownTemplate",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var townTemplate = response.d;
                if (townTemplate) {
                    console.log("Town Template recieved from CodeBehind to AJAX Call succesfully.")
                    resolve(townTemplate);
                } else {
                    reject("Town Template data is undefined or null.");
                }
            },
            error: function (err) {
                console.log("Error recieving Town Template from CodeBehind to AJAX Call:", err);
                reject(err);
            }
        });
    });
}