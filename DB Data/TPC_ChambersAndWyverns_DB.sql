--create database TPC_ChambersAndWyverns
--use TPC_ChambersAndWyverns

--no use ninguna relacion excepto primary keys, identities y un unique, porque en teoria los datos deberian manejarse
--limpiamente desde el programa, y la db se crea una vez y ya, no vamos a estar agregando a clases, razas, trasfondos,
--etc. podria ser una capa mas de seguridad, pero creo que es redundante si el c# hace su trabajo como corresponde

create table Users(
    ID_User int not null primary key identity,
    Username nvarchar(50) unique,
    PasswordHash nvarchar(255) not null
)

create table Characters(
    ID_Character int not null primary key identity,
    ID_User int not null,

    ID_Race int not null,
    ID_Class int not null,
    ID_Background int not null,

    _Name nvarchar(50) not null,
    _Level int not null,        --1
    Experience int not null,    --no se va a mostrar
    Proficiency int not null,   --2

    ArmorClass int not null,    --10 + RA.Modifier where RA.ID = 1 (DEX)
    MaxHealth int not null,     --(CL.ClassHealth where CL.ID_Class = ID_Class) + (RA.Modifier where = RA.ID_Character = ID_Character)
    CurrentHealth int not null, --maxHealth
    Gold int not null,          --BG.InitialGold where BG.ID_Background = ID_Background
    --necesitamos una stored procedure para armar con un solo comando el pj entero, aplicando modificadores
    --de raza, clase, trasfondo, configurando proficiencia, armorclass, maxhp y currenthp, y el oro
)

create table Races(
    ID_Race int not null primary key identity,
    _Name nvarchar(50) not null,
    _Desc text not null,
    ID_Ability int not null --ability a la que le agrega al modificador un +2
)

create table Classes(
    ID_Class int not null primary key identity,
    _Name nvarchar(50) not null,
    _Desc text not null,
    ClassHealth int not null,
    SpecialName nvarchar(50) not null,
    SpecialDesc text not null
)

create table Abilities(
    ID_Ability int not null primary key identity,
    _Name nvarchar(50) not null,
    _Desc text not null
)

create table Skills(
    ID_Skill int not null primary key identity,
    ID_Ability int not null,
    _Name nvarchar(50) not null,
    _Desc text not null
)

create table Backgrounds(
    ID_Background int not null primary key identity,
    _Name nvarchar(50) not null,
    _Desc text not null,
    ID_Ability1 int not null,
    ID_Ability2 int not null,
    InitialGold int not null
)

create table Items(
    ID_Item int not null primary key identity,
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
    ID_DamageType int not null primary key identity,
    _Name nvarchar(50) not null
)

create table Creatures(
    ID_Creature int not null primary key identity,
    _Name nvarchar(50) not null,
    _Desc text not null,
    Rating int not null,
    Experience int not null,
    Proficiency int not null,
    ArmorClass int not null,
    MaxHealth int not null
)

create table CreaturesXEncounter(
    ID_Creature int not null,
    CurrentHealth int not null
)

create table ItemsXCreature(
    ID_Creature int not null,
    ID_Item int not null,
    Chance int not null
    primary key(ID_Item, ID_Character)
)

--stored procedures para la creacion de toda la db (races, classes, backgrounds, abilities, skills, items)
--stored procedures para el uso recurrente de inserciones (a usuarios, a characters, a items x character)