//todas las funciones de lectura de db

//lee el character devuelto de codebehind y lo retorna como js vars
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