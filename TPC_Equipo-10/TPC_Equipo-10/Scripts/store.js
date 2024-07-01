
function drawStore() {
    drawTextCentered('store', width / 2, height - 24, 24, 'white')

    
    if (!storeNavFocus) {
        drawStoreNav();
    }
    else {
        drawInventory();
    }
    
}

//navegacion en la tienda
let storeNavFocus; // 0 = estamos en panel de pregunta 1 = estamos viendo buy o sell
let storeBuySellFocus; // si storenavfocus = 0, selector esta parado en boton de 0 = buy o 1= sell, si storenavfocus = 1, 0 = inventario buy 1 = inventario sell

//variables del merchant
let merchantSex;
let merchantRace;
let merchantPersonality; //1 de 5 personalidades
let catalogueItems; //lista de item IDs, no items

let merchantPreDialogueOption;
let merchantSoldDialogueOption;
let merchantDialoguePreSoldStatus;

let merchantShowDialogueOption;
let merchantBoughtDialogueOption;
let merchantDialogueShowBoughtStatus;

function setupStore() {
    storeNavFocus = false;
    storeBuySellFocus = false;
    pickMerchantDialogueOptions();
}

function pickMerchantDialogueOptions() {
    merchantPreDialogueOption = int(random(merchantPreDialogues[merchantPersonality].length));
    merchantSoldDialogueOption = int(random(merchantSoldDialogues[merchantPersonality].length));
    merchantShowDialogueOption = int(random(merchantShowDialogues[merchantPersonality].length));
    merchantBoughtDialogueOption = int(random(merchantBoughtDialogues[merchantPersonality].length));
}

function drawMerchantSprite(posX, posY, size) {
    image(
        merchant_spritesheet,
        posX - 8 * size,
        posY - (16 + 7) * size,
        16 * size,
        32 * size,
        merchantRace * 16,
        merchantSex * 32,
        16,
        32
    );
}

function drawStoreNav() {
    //panel de buysell
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
    //text
    fill(255);
    textAlign(LEFT, TOP);
    textSize(24);
    text(
        'Bienvenido a la tienda de Rivendale. Qué querés hacer?', //TEMP, titulo generado al entrar en town
        width / 2 - (width / popupSize) / 2 + innerMargin * 2,
        height / 2 - (height / popupSize) / 2 + innerMargin * 2,
        width / popupSize - innerMargin * 4
    );
    //buy button
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
        'Comprar',
        width / 2 - (width / popupSize) / 2 + innerMargin * 2 + (width / (buttonSize / 2) / 2),
        height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2
    );

    //sell button
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
        'Vender',
        width / 2 - (width / popupSize) / 2 + innerMargin + width / popupSize - innerMargin * 3 - width / (buttonSize / 2) + (width / (buttonSize / 2) / 2),
        height / 2 - (height / popupSize) / 2 + innerMargin + height / popupSize - innerMargin * 3 - height / buttonSize + (height / buttonSize) / 2
    );

    //indicador de seleccion
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(itemSize);
    if (!storeBuySellFocus) {
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

//listas de dialogos del merchant para las 5 personalidades (amable, astuto, entusiasta, precavido, desconfiado)

//merchant dialogues para antes de una venta
let merchantPreDialogues = [
    [
        "A ver a ver! ¿Qué clase tesoros traes para mostrarme? Siempre estoy buscando nuevas maravillas.",
        "Veo que tienes un ojo para las cosas raras. Déjame echar un vistazo más de cerca a ese artefacto que llevas.",
        "Ah, una reliquia antigua. Esto sin duda debe tener una historia fascinante. ¿Te importaría contarme más sobre cómo lo encontraste?"
    ],
    [
        "Hmm, este objeto parece interesante, pero veo algunas imperfecciones. ¿Qué precio estás pensando?",
        "Podría ofrecerte un buen trato, pero debo ser honesto, estos artefactos no son fáciles de vender. Tal vez podríamos negociar un poco.",
        "Tu hallazgo es intrigante, pero más me intriga su origen. No puedo comprarlo sin saber su auténtico valor."
    ],
    [
        "¡Fua, qué hallazgo tan increíble! Esto se va a vender como pan casero. ¿Estás dispuesto a desprenderte de él?",
        "Esto es justo lo que necesitaba para completar mi colección. ¿Qué precio consideras justo por esta belleza?",
        "Cada vez que veo un objeto como este, siento la emoción de un niño en su primer mercado. Estoy dispuesto a pagar bien por ello."
    ],
    [
        "Hmm, y tú dices que estás seguro de que no está maldito, verdad? Solo no quiero meterme en problemas!",
        "Nadie más está en busca de estas cosas, no? La última vez que acepté un negocio como estos no salió bien, y no haré el mismo error.",
        "Realmente es brillante, pero debo ser prudente... Capaz tengo textos antiguos sobre este tipo de objetos."
    ],
    [
        "Meh, he visto muchos de estos a lo largo de los años. Esperaba más en realidad, pero no me quejo.",
        "Estas baratijas? Por esos precios? Wow, y pensaba que yo era codicioso.",
        "Podría aceptar esto, pero sólo porque tengo un cliente menos exigente. No es gran cosa, la verdad."
    ]
]

//merchant dialogues para despues de una venta
let merchantSoldDialogues = [
    [
        "Gracias por confiar en mí con esta maravillosa adquisición. Prometo cuidarla bien.",
        "Haré todo lo posible para encontrarle un buen hogar a este artefacto. Fue un placer hacer negocios contigo.",
        "Este objeto definitivamente encontrará su lugar en mi colección. Si encuentras algo más interesante en tus viajes, no dudes en volver."
    ],
    [
        "Sabía que podríamos llegar a un acuerdo. Este objeto será una gran adición a mi inventario.",
        "He hecho una buena compra hoy, gracias a ti. Te deseo suerte en tus futuras exploraciones.",
        "Estoy seguro de que ambos salimos ganando con este trato. Si encuentras más tesoros, sabes dónde encontrarme."
    ],
    [
        "¡Estoy emocionado de tener esto en mis manos! No puedo esperar para mostrarlo a mis clientes.",
        "Esto es exactamente lo que estaba buscando. Gracias por la venta, ¡espero verte pronto con más tesoros!",
        "Ahora mismo me siento como un niño abriendo regalos de navidad, realmente. ¡Gracias por venderlo!"
    ],
    [
        "Voy a tener que vigilar de cerca este objeto. Dicen que las cosas más inocentes resultan ser las más peligrosas.",
        "Realmente espero que no esto no traiga consigo maldiciones, sería una sorpresa desagradable.",
        "No sé porque presiento que esta noche tendré que dormir con un ojo abierto. Hasta donde sé, podría tener una historia oscura."
    ],
    [
        "Bueno, me lo quedo, pero el que sale perdiendo eres tú, sé de un lugar donde comprarían esto por el doble de lo que pides.",
        "Como se nota que no eres experimentado en los negocios, un poco de humildad no te haría mal.",
        "Te lo tomo, pero más te vale que no sea una réplica. No tengo tiempo para objetos sin valor."
    ]
]

//merchant dialogues para un inventario vacio
let merchantEmptySellDialogues = [
    "Ah, veo que no tienes nada hoy. No te preocupes, siempre hay una próxima vez. ¡Vuelve cuando tengas algo para mostrarme!",
    "No se encuentran tesoros todos los días. No olvides que siempre estoy buscando buenas oportunidades. Vuelve cuando tengas algo interesante.",
    "¡Vaya, parece que hoy no traes nada! Qué pena, pero estoy seguro de que pronto encontrarás algo fascinante. ¡Te esperaré con ansias!",
    "¿No traes algo para vender? Espero que no sea porque has tenido problemas. Asegúrate de investigar sobre lo que llevas, cuídate!",
    "¿Bolsillos vacíos? Vaya pérdida de tiempo. En fin, no me hagas perder el tiempo la próxima vez si no tienes algo realmente valioso."
]


let merchantShowDialogues = [
    [
        "¡Bienvenido, viajero! Pegale una mirada a mis mercancías. Seguro que una de estas cosas te va a gustar.",
        "Hola, amigo. Tengo una variedad de productos de alta calidad. Si necesitás algo, no dudes en preguntar.",
        "¡Qué bueno verte! Pasá y mirá lo que tengo hoy. Siempre estoy dispuesto a ayudarte a encontrar lo que buscás."
    ],
    [
        "Ah, un cliente con buen ojo para las gangas. Acá vas a encontrar sólo lo mejor, pero acordate, todo tiene su precio.",
        "Mirá bien, tengo objetos únicos que no encontrarás en ningún otro lugar. Estoy seguro de que podemos llegar a un buen acuerdo.",
        "Te doy la bienvenida a mi tienda. Examiná mis productos cuidadosamente, cada uno tiene su historia y su valor."
    ],
    [
        "¡Bienvenido a mi tiendita! Tengo cosas copadas para mostrarte. ¡Seguro encontrás algo que te gusta!",
        "Qué bueno verte por acá. Qué tal? Tengo nuevos artículos que conseguí hace poco. ¡asomate, te vas a sorprender!",
        "¡Hola! Andás curioseando? Qué onda? Checkeate esta selección, segurísimo que algo de acá te llama la atención."
    ],
    [
        "Hola! Mirá lo que tengo, tené cuidado con tocar. Todo es auténtico y valioso, nada de pavadas.",
        "Bienvenido! Examiná con cuidado, algunos de estos objetos tienen historias complejas. Si tenés preguntas, acá estoy.",
        "Podés mirar, pero no de tan cerca. Estos artículos son irremplazables, y prefiero evitar cualquier incidente."
    ],
    [
        "Ah, un nuevo cliente. Espero que tengas buen gusto, porque no vendo boludeces. Mirá y decidite rápido.",
        "Mira lo que tengo, pero te aviso, sólo vendo lo mejor. Si no podés apreciar la calidad, seguí en tu camino.",
        "Esta es mi tienda. Acá vas a encontrar artículos de primera, y no trato con compradores indecisos."
    ]
]

let merchantBoughtDialogues = [
    [
        "¡Excelente elección! Espero que disfrutes de tu compra y que te sea de gran utilidad.",
        "Gracias por tu compra. Si necesitas algo más en el futuro, no dudes en volver.",
        "Fue un placer hacer negocios cont vos. ¡Espero que el objeto te traiga buena suerte!"
    ],
    [
        "Buena elección, sin duda has hecho una inversión inteligente. Vuelve cuando quieras más calidad.",
        "Un trato justo para ambos. Espero verte pronto por aquí para futuras adquisiciones.",
        "Me alegra que hayas encontrado algo de tu agrado. Siempre tengo algo especial para clientes como tú."
    ],
    [
        "¡Bien ahí! Ese me re encanta, creeme que te va a gustar, es excelente.",
        "¡Se aprecia el apoyo! Valoro mucho que le des un hogar a este objeto.",
        "¡Esa! Tocalo, miralo, hacele lo que quieras, es tuyo, disfrutalo."
    ],
    [
        "Realmente espero que te sea sirva. Cuídalo bien, en serio.",
        "Gracias por tu compra. Cualquier cosa si le pasa algo, vos me avisás.",
        "Espero que todo salga bien ahora que esto es tuyo. Confío en que lo cuidarás."
    ],
    [
        "Finalmente, quería vender eso hace rato, pero me rehúso a rebajar mis precios, la gente simplemente no entiende.",
        "Que disfrutes de tu compra.",
        "Si llega a pasar algo, no me vengas a decir nada a mí porque no es mi responsabilidad."
    ]
]

let merchantEmptyBuyDialogues = [
    "¡Increíble! Nunca había tenido un cliente tan generoso. Gracias por todo, espero que todo te sea útil. ¡Vuelve pronto!",
    "Has hecho una compra excelente. Agradezco profundamente el apoyo, estoy seguro de que cada objeto valdrá la pena. Cuando quieras, acá estoy.",
    "Wow, me compraste todo ya? No podría estar más agradecido. Ojalá disfrutes todo lo que te llevás de acá!",
    "Realmente te llevas todo? No lo puedo creer. Pero aún no conoces la totalidad de lo que son capaces estos objetos! Ten mucho cuidado!",
    "¿Todo? Esa no la vi venir. Bueno, supongo que estoy agradecido. En fin, vuelve cuando quieras más, pero trae más oro la próxima."
]