create database TPC_ChambersAndWyverns
go
 use TPC_ChambersAndWyverns
go
 create table Users(
     ID_User int not null primary key identity(0,1),
     Username nvarchar(50) unique,
     PasswordHash nvarchar(255) not null
 )
 go
 --select ID_User, Username, PasswordHash from users where Username = @user AND PasswordHash = @pass
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
    
     --relacionados a gameplay, importantes para restorar el estado de la partida
     Luck int not null,          --0
     Round int not null,         --0
     Encounters int not null,    --0
     GameState int not null,     --0

     ArmorClass int not null,    --10 + RA.Modifier where RA.ID = 1 (DEX)
     MaxHealth int not null,     --(CL.ClassHealth where CL.ID_Class = ID_Class) + (RA.Modifier where = RA.ID_Character = ID_Character)
     CurrentHealth int not null, --maxHealth
     Gold int not null         --BG.InitialGold where BG.ID_Background = ID_Background
 )
go
 create table Races(
     ID_Race int not null primary key identity(0,1),
     _Name nvarchar(50) not null,
     _Desc text not null,
     ID_Ability int not null --ability a la que le agrega al modificador un +2
 )
go
 create table Classes(
     ID_Class int not null primary key identity(0,1),
     _Name nvarchar(50) not null,
     _Desc text not null,
     ClassHealth int not null,
     SpecialName nvarchar(50) not null,
     SpecialDesc text not null,
     ID_Ability int not null --ability de las armas que prefiere la clase
 )
go
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
go
 create table Skills(
     ID_Skill int not null primary key identity(0,1),
     ID_Ability int not null,
     _Name nvarchar(50) not null,
     _Desc text not null
 )
go
 create table Backgrounds(
     ID_Background int not null primary key identity(0,1),
     _Name nvarchar(50) not null,
     _Desc text not null,
     ID_Skill1 int not null,
     ID_Skill2 int not null,
     InitialGold int not null
 )
go
 create table Items(
     ID_Item int not null primary key identity(0,1),
     _Name nvarchar(50) not null,
     _Desc text not null,
     ItemType int not null, -- 0 = generic, 1 = equippable, 2 = consumable
     Price int not null
 )
go
 create table Equippables(
     ID_Item int not null primary key,
     EquippableType int not null, -- 0 = weapon, 1 = armor
     --no guardo el bool de si esta equipado o no, eso se guarda aparte, el item en la db no puede estar equipado o desequipado, solo ingame
 )
go
 create table Weapons(
     ID_Item int not null primary key,
     ID_DamageType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que inflige
     ID_Ability int not null, --ability cuyo modificador aplica encima del daño base
     Damage int not null
 )
go
 create table Armors(
     ID_Item int not null primary key,
     ArmorType bit not null, --0 = armadura; 1= escudo
     ID_ResistanceType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que resiste
     Armor int not null
 )
go
 create table Consumables(
     ID_Item int not null primary key,
     ID_Effect int not null, -- -1 es una curacion, 0 para arriba representa id de abilidad cuyo modificador modifica
     Amount int not null,
     --no guardo el bool de si fue consumido o no, eso se guarda aparte, el item en la db no puede estar consumido o no consumido, solo ingame
 )
go
 create table ItemsXCharacter(
     ID_Character int not null,
     ID_Item int not null,
     Equipped bit default 0, --estos datos son relevantes para el jugador cuando tiene items, no para la db de los items del juego, aca se guarda
     Consumed bit default 0, --si el jugador tiene un item actualmente consumido, o si tiene una arma o armadura equipada
 	 CurrRound int not null
     --vale nombrar que ambos bools van a ser ignorados si el item que alocamos en memoria, tenia itemtype = 0, para eso el default
     primary key(ID_Item, ID_Character) -- (algo que note es que si usamos esta primary key, no podes tener pociones repetidas,
     --                                      seria mismo item en inventario del mismo jugador, pero bueno se puede revisar)
 )
go
 create table AbilitiesXCharacter(
     ID_Character int not null, --para que personaje
     ID_Ability int not null, --que ability se rolleo
     RolledScore int not null, --que roll salio
     Modifier int not null --por cada personaje, al crearlos, se guarda en esta tabla 6 filas, una para cada ability que rolleo
     primary key(ID_Character, ID_Ability)
 )
go
--tabla de skillsxcharacter removida; sus datos seran calculados en runtime, no alojados en db

 create table DamageTypes(
     ID_DamageType int not null primary key identity(0,1),
     _Name nvarchar(50) not null
 )
go
 create table Creatures(
     ID_Creature int not null primary key identity(0,1),
     _Name nvarchar(50) not null,
     _Desc text not null,
     Rating int not null,
     Experience int not null,
     Proficiency int not null,
     ArmorClass int not null,
     MaxHealth int not null
 )
go
 create table Attacks(
     ID_Attack int not null primary key identity(0,1),
 	_Name nvarchar(50) not null,
     _Desc text not null,
     ID_DamageType int not null, --proviene de la tabla de tipos de daño, en este caso representa el tipo de daño que inflige
     Damage int not null
 )
go
 create table AttacksXCreature(
 	ID_Creature int not null,
 	ID_Attack int not null,
 	primary key(ID_Attack, ID_Creature)
 )

go
 create table CreaturesXEncounter(
     ID_Creature int not null,
     CurrentHealth int not null,
     GoldDrop int not null
 )
go
 create table ItemsXCreature(
     ID_Creature int not null,
     ID_Item int not null,
     Chance int not null
     primary key(ID_Item, ID_Creature)
 )
go
 create table AbilitiesXCreature(
     ID_Creature int not null, --para que personaje
     ID_Ability int not null, --que ability se rolleo
     Modifier int not null 
 	primary key(ID_Creature, ID_Ability)
 )


--stored procedures para la creacion de toda la db (races, classes, backgrounds, abilities, skills, items)
--stored procedures para el uso recurrente de inserciones (a usuarios, a characters, a items x character)

--+-- Buscador de Armas --+--
go
CREATE PROCEDURE SP_GetWeapons
AS
BEGIN
    SELECT I.ID_Item AS ID, I._Name AS Name, I._Desc AS Description, W.Damage, W.ID_Ability, A._Name AS Ability, W.ID_DamageType, DT._Name AS DamageType, I.Price
    FROM Items I
    INNER JOIN Weapons W ON I.ID_Item = W.ID_Item
    INNER JOIN Abilities A ON W.ID_Ability = A.ID_Ability
    INNER JOIN DamageTypes DT ON W.ID_DamageType = DT.ID_DamageType;
END;

--+-- Buscador de Armaduras y Escudos --+--
go
CREATE PROCEDURE SP_GetArmorsShields
AS
BEGIN
    SELECT I.ID_Item AS ID,
    I._Name AS Name,
    I._Desc AS Description,
    A.ArmorType,
    A.ID_ResistanceType,
    DT._Name AS Resistance_Type,
    A.Armor,
    I.Price
    FROM Items I
	INNER JOIN Armors A ON I.ID_Item = A.ID_Item
	INNER JOIN DamageTypes DT ON A.ID_ResistanceType = DT.ID_DamageType

END;

--+-- Buscador de Consumibles --+--
go
CREATE PROCEDURE SP_GetConsumables
AS
BEGIN
   SELECT I.ID_Item AS ID, I._Name AS Name,  I._Desc AS Description, C.ID_Effect,  C.Amount, I.Price
    FROM Items I
	INNER JOIN Consumables C ON I.ID_Item = C.ID_Item
END;

--+-- Insert Items --+--
go
CREATE PROCEDURE SP_InsertItem
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
    @ArmorType BIT = NULL,
    @ResistanceType INT = NULL,
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
            INSERT INTO Armors (ID_Item, ArmorType, ID_ResistanceType, Armor)
            VALUES (@NewItemID, @ArmorType, @ResistanceType, @Armor);
        END
    END
    ELSE IF @ItemType = 2 -- Consumable
    BEGIN
        INSERT INTO Consumables (ID_Item, ID_Effect, Amount)
        VALUES (@NewItemID, @Effect, @Amount);
    END;
END;


--+-- Insert Creatures --+--
go
CREATE PROCEDURE SP_InsertCreature
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

    INSERT INTO Creatures (_Name, _Desc, Rating, Experience, Proficiency, ArmorClass, MaxHealth, DamageMod)
    VALUES (@Name, @Description, @Rating, @Experience, @Proficiency, @ArmorClass, @MaxHealth, @DamageMod);

    SET @CreatureId = SCOPE_IDENTITY();

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
    INSERT INTO AbilitiesXCreatures (ID_Creature, ID_Ability, Modifier)
    VALUES (@CreatureId, @AbilityPosition, @AbilityList);

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
    INSERT INTO AttacksXCreature (ID_Creature, ID_Attack)
    VALUES (@CreatureId, @AttackList);

END;

--+-- Insertar Character --+--
go
-- AUTOMATIZA CONSEGUIR EL VALOR DEL MODIFIER DE LAS ABILITIES, Y TAMBIÉN LAS MISMAS SKILLS,
--EL VALOR QUE POSEEN LAS SKILLS ES DE BASE, SIN BONIFICADORES DE NADA.
CREATE PROCEDURE SP_InsertNewCharacter
    @ID_User int,
    @Sex bit,
    @ID_Race int,
    @ID_Class int,
    @ID_Background int,
    @_Name nvarchar(50),
    @ArmorClass int = 1, --se calcula
    @MaxHealth int = 1, --se calcula
    @CurrentHealth int = 1, --se calcula
    @Gold int = 1, --se calcula
    @_Level int = 1,
    @Experience int = 0,
    @Proficiency int = 2,
    @Luck int = 0,
    @Round int = 0,
    @Encounters int = 0,
    @GameState int = 0,
    @Abilities NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CharacterId INT;
    DECLARE @AbilityPosition INT = 0;
    DECLARE @AbilityRolledScore INT;
    DECLARE @AbilityModifier INT;
    DECLARE @AbilityList NVARCHAR(MAX) = @Abilities;

    DECLARE @Dex INT;
    DECLARE @Const INT;
    --nos devuelve el valor de dexteridad
    SET @Dex = CAST(SUBSTRING(
    @Abilities,
    CHARINDEX(',', @Abilities) + 1,
    CHARINDEX(',', @Abilities + ',', CHARINDEX(',', @Abilities) + 1) - CHARINDEX(',', @Abilities) - 1) AS INT)
    
    --nos devuelve el valor de constitucion
    SET @Const = CAST(SUBSTRING(
    @Abilities,
    CHARINDEX(',', @Abilities, CHARINDEX(',', @Abilities) + 1) + 1,
    CHARINDEX(',', @Abilities + ',', CHARINDEX(',', @Abilities, CHARINDEX(',', @Abilities) + 1) + 1) - CHARINDEX(',', @Abilities, CHARINDEX(',', @Abilities) + 1) - 1) AS INT)

    SET @ArmorClass = 10 + FLOOR((@Dex - 10) / 2.0)
    SET @MaxHealth = (
    SELECT CL.ClassHealth 
    FROM Classes CL 
    WHERE CL.ID_Class = @ID_Class
    ) + FLOOR((@Const - 10) / 2.0);
	
    SET @CurrentHealth = @MaxHealth
    SET @Gold = (
    SELECT BG.InitialGold 
    FROM Backgrounds BG 
    WHERE BG.ID_Background = @ID_Background
    );

    -- Insertar nuevo personaje en la tabla Characters
    INSERT INTO Characters (
        ID_User, Sex, ID_Race, ID_Class, ID_Background, _Name, _Level, Experience, Proficiency, Luck, Round, Encounters, GameState, ArmorClass, MaxHealth, CurrentHealth, Gold)
    VALUES (
        @ID_User, @Sex, @ID_Race, @ID_Class, @ID_Background, @_Name, @_Level, @Experience, @Proficiency, @Luck, @Round, @Encounters, @GameState, @ArmorClass, @MaxHealth, @CurrentHealth, @Gold);

    SET @CharacterId = SCOPE_IDENTITY();

    WHILE CHARINDEX(',', @AbilityList) > 0
    BEGIN
        SET @AbilityRolledScore = SUBSTRING(@AbilityList, 1, CHARINDEX(',', @AbilityList) - 1);
		-- Calcula el modificador de la habilidad desde la db, no hace falta hacerlo en el codigo
        SET @AbilityModifier = FLOOR((@AbilityRolledScore - 10) / 2.0);
        INSERT INTO AbilitiesXCharacter (ID_Character, ID_Ability, RolledScore, Modifier)
        VALUES (@CharacterId, @AbilityPosition, @AbilityRolledScore, @AbilityModifier);
        SET @AbilityList = SUBSTRING(@AbilityList, CHARINDEX(',', @AbilityList) + 1, LEN(@AbilityList));
        SET @AbilityPosition = @AbilityPosition + 1;
    END
    SET @AbilityRolledScore = @AbilityList;
    SET @AbilityModifier = FLOOR((@AbilityRolledScore - 10) / 2.0);
    INSERT INTO AbilitiesXCharacter (ID_Character, ID_Ability, RolledScore, Modifier)
    VALUES (@CharacterId, @AbilityPosition, @AbilityRolledScore, @AbilityModifier);
END;

--+-- Consigue las abilidades de todos los personajes --+--
go
CREATE PROCEDURE SP_GetCharacterAbilities
@ID_Character int
AS
BEGIN
    SELECT 
        A.ID_Ability, A._Name AS AbilityName,  A._Desc AS AbilityDesc, AC.RolledScore, AC.Modifier
    FROM 
        Abilities A
    INNER JOIN 
        AbilitiesXCharacter AC ON @ID_Character = AC.ID_Character AND AC.ID_Ability = A.ID_Ability
    
END;

--+-- Inserta un Usuario Nuevo --+--
go
CREATE PROCEDURE SP_InsertNewUser
@UserName VARCHAR(50),
@PasswordHash nvarchar(255)
AS INSERT INTO Users (Username, PasswordHash) OUTPUT INSERTED.ID_USER VALUES (@UserName, @PasswordHash);

