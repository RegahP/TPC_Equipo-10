create database TPC_ChambersAndWyverns
use TPC_ChambersAndWyverns

---Items Genericos
---Creatures
---Attacks


create table Users(
    ID_User int not null primary key identity(0,1),
    Username nvarchar(50) unique,
    PasswordHash nvarchar(255) not null
)

create table Characters(
    ID_Character int not null primary key identity(0,1),
    ID_User int not null,

    Sex bit not null,
    ID_Race int not null,
    ID_Class int not null,
    ID_Background int not null,

    _Name nvarchar(50) not null,
    _Level int not null,        --1
    Experience int not null,    --0
    Proficiency int not null,   --2
	DamageMod int not null,
    
    --relacionados a gameplay, importantes para restorar el estado de la partida
    Luck int not null,          --0
    Round int not null,         --0
    Encounters int not null,    --0
    GameState int not null,     --0

    ArmorClass int not null,    --10 + RA.Modifier where RA.ID = 1 (DEX)
    MaxHealth int not null,     --(CL.ClassHealth where CL.ID_Class = ID_Class) + (RA.Modifier where = RA.ID_Character = ID_Character)
    CurrentHealth int not null, --maxHealth
    Gold int not null         --BG.InitialGold where BG.ID_Background = ID_Background
    --necesitamos una stored procedure para armar con un solo comando el pj entero, aplicando modificadores
    --de raza, clase, trasfondo, configurando proficiencia, armorclass, maxhp y currenthp, y el oro
)

create table Races(
    ID_Race int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null,
    ID_Ability int not null --ability a la que le agrega al modificador un +2
)

create table Classes(
    ID_Class int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null,
    ClassHealth int not null,
    SpecialName nvarchar(50) not null,
    SpecialDesc text not null,
    ID_Ability int not null --ability de las armas que prefiere la clase
)

--a que clase le interesa items que escalean con que abilidades
--(ej. magos les interesa items que escalean con inteligencia(varitas))
--warrior = strength
--mage = intelligence
--paladin = strength (constitution?)
--rogue = dexterity

create table Abilities(
    ID_Ability int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null
)

create table Skills(
    ID_Skill int not null primary key identity(0,1),
    ID_Ability int not null,
    _Name nvarchar(50) not null,
    _Desc text not null
)

create table Backgrounds(
    ID_Background int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null,
    ID_Skill1 int not null,
    ID_Skill2 int not null,
    InitialGold int not null
)

create table Items(
    ID_Item int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null,
    ItemType int not null, -- 0 = generic, 1 = equippable, 2 = consumable
    Price int not null
)

create table Equippables(
    ID_Item int not null primary key,
    EquippableType int not null, -- 0 = weapon, 1 = armor
    --no guardo el bool de si esta equipado o no, eso se guarda aparte, el item en la db no puede estar equipado o desequipado, solo ingame
)

create table Weapons(
    ID_Item int not null primary key,
    ID_DamageType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que inflige
    ID_Ability int not null, --ability cuyo modificador aplica encima del daño base
    Damage int not null
)

create table Armors(
    ID_Item int not null primary key,
    ID_ResistanceType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que resiste
    Armor int not null
)

create table Consumables(
    ID_Item int not null primary key,
    ID_Effect int not null, -- -1 es una curacion, 0 para arriba representa id de abilidad cuyo modificador modifica
    Amount int not null,
    --no guardo el bool de si fue consumido o no, eso se guarda aparte, el item en la db no puede estar consumido o no consumido, solo ingame
)

create table ItemsXCharacter(
    ID_Character int not null,
    ID_Item int not null,
    Equipped bit default 0, --estos datos son relevantes para el jugador cuando tiene items, no para la db de los items del juego, aca se guarda
    Consumed bit default 0 --si el jugador tiene un item actualmente consumido, o si tiene una arma o armadura equipada
    --vale nombrar que ambos bools van a ser ignorados si el item que alocamos en memoria, tenia itemtype = 0, para eso el default
    primary key(ID_Item, ID_Character) -- (algo que note es que si usamos esta primary key, no podes tener pociones repetidas,
    --                                      seria mismo item en inventario del mismo jugador, pero bueno se puede revisar)
)

create table AbilitiesXCharacter(
    ID_Character int not null, --para que personaje
    ID_Ability int not null, --que ability se rolleo
    RolledScore int not null, --que roll salio
    Modifier int not null --por cada personaje, al crearlos, se guarda en esta tabla 6 filas, una para cada ability que rolleo
    primary key(ID_Character, ID_Ability)
)

create table SkillsXCharacter(
    ID_Character int not null, --para que personaje
    ID_Skill int not null, --que skill se calculo a partir de su ability
    RolledScore int not null --por cada personaje, al crearlos, se guarda en esta tabla 8 filas, una para cada skill que calculo
)

create table DamageTypes(
    ID_DamageType int not null primary key identity(0,1),
    _Name nvarchar(50) not null
)

create table Creatures(
    ID_Creature int not null primary key identity(0,1),
    _Name nvarchar(50) not null,
    _Desc text not null,
    Rating int not null,
    Experience int not null,
    Proficiency int not null,
    ArmorClass int not null,
    MaxHealth int not null,
	DamageMod int not null
)

create table Attacks(
    ID_Attack int not null primary key identity(0,1),
	_Name nvarchar(50) not null,
    _Desc text not null,
    ID_DamageType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que inflige
    Damage int not null
)

create table AttacksXCreature(
	ID_Creature int not null,
	ID_Attack int not null,
	primary key(ID_Attack, ID_Creature)
)


create table CreaturesXEncounter(
    ID_Creature int not null,
    CurrentHealth int not null,
    GoldDrop int not null
)

create table ItemsXCreature(
    ID_Creature int not null,
    ID_Item int not null,
    Chance int not null
    primary key(ID_Item, ID_Creature)
)

create table AbilitiesXCreatures(
    ID_Creature int not null, --para que personaje
    ID_Ability int not null, --que ability se rolleo
    Modifier int not null 
	primary key(ID_Creature, ID_Ability)
)


--stored procedures para la creacion de toda la db (races, classes, backgrounds, abilities, skills, items)
--stored procedures para el uso recurrente de inserciones (a usuarios, a characters, a items x character)

CREATE PROCEDURE InsertItem
    @Name NVARCHAR(50),
    @Description TEXT,
    @ItemType INT,
    @Price INT,
    -- Para Consumibles
    @Effect INT = NULL,
    @Amount INT = NULL,
    -- Para Equippables
    @EquippableType INT = NULL,
    -- Para Weapons
    @DamageType INT = NULL,
    @WeaponAbility INT = NULL,
    @Damage INT = NULL,
    -- Para Armors
    @ResistanceType NVARCHAR(50) = NULL,
    @Armor INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewItemID INT;

    -- Insertar en la tabla Items y obtener el ID del nuevo ítem
    INSERT INTO Items (_Name, _Desc, ItemType, Price)
    VALUES (@Name, @Description, @ItemType, @Price);

    -- Obtener el ID del nuevo ítem insertado
    SET @NewItemID = SCOPE_IDENTITY();

    -- Insertar en las tablas correspondientes según el tipo de ítem
    IF @ItemType = 1 -- Equippable
    BEGIN
        INSERT INTO Equippables (ID_Item, EquippableType)
        VALUES (@NewItemID, @EquippableType);

        IF @EquippableType = 0 -- Weapon
        BEGIN
            INSERT INTO Weapons (ID_Item, ID_DamageType, ID_Ability, Damage)
            VALUES (@NewItemID, @DamageType, @WeaponAbility, @Damage);
        END
        ELSE IF @EquippableType = 1 -- Armor
        BEGIN
            EXEC InsertArmor @Name, @Armor, @ResistanceType, @Price, @Description;
        END
    END
    ELSE IF @ItemType = 2 -- Consumable
    BEGIN
        INSERT INTO Consumables (ID_Item, ID_Effect, Amount)
        VALUES (@NewItemID, @Effect, @Amount);
    END;
END;

--------------------

CREATE PROCEDURE InsertCreature
    @Name NVARCHAR(50),
    @Description TEXT,
    @Rating INT,
    @Experience INT,
    @Proficiency INT,
    @ArmorClass INT,
    @MaxHealth INT,
    @DamageMod INT,
    @Abilities NVARCHAR(50), -- Lista de valores separados por comas: e.g., '1,2,3,0,-1,2'
    @Attacks NVARCHAR(50)   -- Lista de valores separados por comas: e.g., '0,3'
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CreatureId INT;

    -- Insertar en la tabla Creatures
    INSERT INTO Creatures (_Name, _Desc, Rating, Experience, Proficiency, ArmorClass, MaxHealth, DamageMod)
    VALUES (@Name, @Description, @Rating, @Experience, @Proficiency, @ArmorClass, @MaxHealth, @DamageMod);

    -- Obtener el ID de la nueva criatura insertada
    SET @CreatureId = SCOPE_IDENTITY();

    -- Insertar habilidades (abilities) asociadas a la criatura
    DECLARE @AbilityId INT;
    DECLARE @AbilityValue INT;
    DECLARE @AbilityPosition INT = 0;
    DECLARE @AbilityList NVARCHAR(MAX) = @Abilities;
    
    WHILE CHARINDEX(',', @AbilityList) > 0
    BEGIN
        SET @AbilityValue = SUBSTRING(@AbilityList, 1, CHARINDEX(',', @AbilityList) - 1);
        INSERT INTO AbilitiesXCreatures (ID_Creature, ID_Ability, Modifier)
        VALUES (@CreatureId, @AbilityPosition, @AbilityValue);
        SET @AbilityList = SUBSTRING(@AbilityList, CHARINDEX(',', @AbilityList) + 1, LEN(@AbilityList));
        SET @AbilityPosition = @AbilityPosition + 1;
    END
    -- Insertar la última habilidad en la lista
    INSERT INTO AbilitiesXCreatures (ID_Creature, ID_Ability, Modifier)
    VALUES (@CreatureId, @AbilityPosition, @AbilityList);

    -- Insertar ataques (attacks) asociados a la criatura
    DECLARE @AttackId INT;
    DECLARE @AttackPosition INT = 0;
    DECLARE @AttackList NVARCHAR(MAX) = @Attacks;
    
    WHILE CHARINDEX(',', @AttackList) > 0
    BEGIN
        SET @AttackId = SUBSTRING(@AttackList, 1, CHARINDEX(',', @AttackList) - 1);
        INSERT INTO AttacksXCreature (ID_Creature, ID_Attack)
        VALUES (@CreatureId, @AttackId);
        SET @AttackList = SUBSTRING(@AttackList, CHARINDEX(',', @AttackList) + 1, LEN(@AttackList));
        SET @AttackPosition = @AttackPosition + 1;
    END
    -- Insertar el último ataque en la lista
    INSERT INTO AttacksXCreature (ID_Creature, ID_Attack)
    VALUES (@CreatureId, @AttackList);

END;
