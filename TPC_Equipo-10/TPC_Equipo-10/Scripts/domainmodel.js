class Character {
    constructor(sex, race, chrClass, bg, lvl, xp, prof, luck, round, encounters, chrGameState, playing, armor, mxHp, crHp, gold, items, abilities, skills) {
        this.sex = sex;
        this.race = race;
        this.chrClass = chrClass;
        this.bg = bg;
        this.lvl = lvl;
        this.xp = xp;
        this.prof = prof;
        this.luck = luck;
        this.round = round;
        this.encounters = encounters;
        this.gameState = chrGameState;
        this.playing = playing;
        this.armor = armor;
        this.mxHp = mxHp;
        this.crHp = crHp;
        this.gold = gold;
        this.items = items;
        this.abilities = abilities;
        this.skills = skills;
    }
}

class Race {
    constructor(name, desc, abilityID) {
        this.name = name;
        this.desc = desc;
        this.abilityID = abilityID;
    }
}

class Class {
    constructor(name, desc, classHealth, specialName, specialDesc) {
        this.name = name;
        this.desc = desc;
        this.classHealth = classHealth;
        this.specialName = specialName;
        this.specialDesc = specialDesc;
    }
}

class Background {
    constructor(name, desc, skill1BonusID, skill2BonusID, initialGold) {
        this.name = name;
        this.desc = desc;
        this.skill1BonusID = skill1BonusID;
        this.skill2BonusID = skill2BonusID;
        this.initialGold = initialGold;
    }
}

class Ability {
    constructor(id, name, desc, score, bonus) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.score = score;
        this.bonus = bonus;
    }
}

class Skill {
    constructor(id, name, desc, abilityID, score) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.abilityID = abilityID;
        this.score = score;
    }
}

class Item {
    constructor(name, desc, type, price) {
        this.name = name;
        this.desc = desc;
        this.type = type;
        this.price = price;
    }
}

class Equippable extends Item {
    constructor(equipped) {
        this.equipped = equipped;
    }
}

class Weapon extends Equippable {
    constructor(dmgType, abilityID, damage) {
        this.dmgType = dmgType;
        this.abilityID = abilityID;
        this.damage = damage;
    }
}

class Weapon extends Equippable {
    constructor(resType, armor) {
        this.resType = resType;
        this.armor = armor;
    }
}

class Consumable extends Item {
    constructor(effectID, amount, consumed) {
        this.effectID = effectID;
        this.amount = amount;
        this.consumed = consumed;
    }
}