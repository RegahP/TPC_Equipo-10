use TPC_ChambersAndWyverns

--+-- ABILITY --+--

INSERT INTO Abilities (_Name, _Desc)
VALUES
--ID 0 - Fuerza
('Fuerza', 'Capacidad f�sica y potencia muscular.'), 
--ID 1- Destreza
('Destreza', 'Agilidad, coordinaci�n y reflejos.'),  
--ID 2 - Constituci�n
('Constituci�n', 'Resistencia y salud general.'),    
--ID 3 - Inteligencia
('Inteligencia', 'Capacidad l�gica y conocimiento.'),
--ID 4 - Sabidur�a
('Sabidur�a', 'Percepci�n y juicio intuitivo.'),	 
--ID 5 - Carisma
('Carisma', 'Influencia y atractivo personal.');	 
select * from Abilities;

--+-- SKILL --+--

 INSERT INTO Skills(_Name, _Desc, ID_Ability)
VALUES
--ID 0 - Acrobacias
('Acrobacias', 'Agilidad y coordinaci�n en movimientos acrob�ticos', 1),
--ID 1 - Atletismo
('Atletismo', 'Habilidad f�sica para realizar acciones atl�ticas como saltar, trepar o nadar', 0),
--ID 2 - Intimidaci�n
('Intimidaci�n', 'Capacidad para infundir miedo o respeto en otros', 5),
--ID 3 - Investigaci�n
('Investigaci�n', 'Habilidad para examinar y analizar informaci�n', 3),
--ID 4 - Percepci�n
('Percepci�n', 'Capacidad para observar y detectar detalles sutiles', 4),
--ID 5 - Persuasi�n
('Persuasi�n', 'Capacidad para influir en los dem�s y convencerlos', 5),
--ID 6 - Sigilo
('Sigilo', 'Habilidad para moverse sin ser detectado', 1),
--ID 7 - Supervivencia
('Supervivencia', 'Habilidad para sobrevivir en condiciones adversas', 4);
select * from Skills

--+-- RACE --+--

 INSERT INTO Races(_Name, _Desc, ID_Ability)
VALUES 
--ID 0 - Humano 
('Humano', 
 'En el c�mputo de la mayor�a de los mundos, los humanos son la m�s joven de las razas comunes, con una llegada tard�a al mundo y una vida corta en comparaci�n con los enanos, elfos, y dragones. Quiz�s es por su corta vida que se esfuerzan en conseguir tanto como pueden en los a�os que se les han dado. O quiz�s sienten que tienen algo que demostrar a las razas m�s antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo que les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.', 
 3),
--ID 1 - Elfo
('Elfo', 
 'Los elfos son un pueblo m�gico de gracia sobrenatural, viviendo en el mundo sin ser del todo parte de �l. Viven en lugares de et�rea belleza, en medio de antiguos bosques o en plateados minaretes que resplandecen con luz fe�rica, donde una suave m�sica flota en el aire y delicadas fragancias son transportadas por la brisa. Los elfos aman la naturaleza y la magia, el arte y la maestr�a, la m�sica y la poes�a, y las cosas buenas del mundo.', 
 4),
--ID 2 - Drac�nido
('Drac�nido', 
 'Nacido de los dragones, como su nombre proclama, el drac�nido camina orgulloso a trav�s de un mundo que le recibe lleno de miedo e incomprensi�n. Modelado por los dioses drac�nidos o por los dragones mismos, el drac�nido originalmente nac�a de huevos de drag�n como una raza �nica, combinando los mejores atributos de los dragones y los humanoides. Algunos drac�nidos son fieles sirvientes de los verdaderos dragones, otros forman parte de ej�rcitos en grandes guerras e incluso otros se encuentran a la deriva, sin una visi�n clara de la vida.', 
 0),
--ID 3 - Enano
('Enano', 
 'Reinos ricos en antiguo esplendor, salas esculpidas en las ra�ces de las monta�as, picos y martillos haci�ndose eco en profundas minas y ardientes forjas, un compromiso con el clan y las tradiciones y un odio ardiente hacia orcos y goblins estos temas comunes unen a todos los enanos.', 
 2),
--ID 4 - Tiflin
('Tiflin', 
 'Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos: este es el destino de los tiflin. Y para retorcer el pu�al, los tiflin saben que esto es a causa de un pacto sellado hace generaciones que infundi� la esencia de Asmodeo, se�or supremo de los Nueve Infiernos, en su linaje. Su apariencia y su naturaleza no tienen m�s culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus hijos, siempre se considerar�n responsables.', 
 5),
--ID 5 - Mediano
('Mediano', 
 'Las comodidades del hogar son las metas para la mayor�a de las vidas de los medianos: un lugar donde asentarse en paz y tranquilidad, lejos de monstruos merodeadores y enfrentamientos de ej�rcitos; un buen fuego y una comida generosa; buena bebida y buena conversaci�n. Aunque algunos medianos viven sus d�as en alejadas comunidades agr�colas, otros forman grupos n�madas que viajan constantemente, atra�dos por los nuevos caminos y anchos horizontes, para descubrir las maravillas de las nuevas tierras y gentes. Pero incluso estos viajeros aman la paz, comida, el bienestar y el hogar, aunque el hogar sea un vag�n empujado a tirones a trav�s de un camino embarrado o una barcaza flotando r�o abajo.', 
 4);
select * from Races;

--+-- CLASS --+--

INSERT INTO Classes(_Name, _Desc, ClassHealth, SpecialName, SpecialDesc, ID_Ability)
VALUES 
--ID 0 - Guerrero
('Guerrero', 
 'H�roes maestros de armas y armaduras, conocedores del combate. Incluyen caballeros, mercenarios y soldados de �lite.', 
 10, 
 'Cobertura Impenetrable', 
 '�Comprimes tu cuerpo, dedicas toda tu atenci�n a los movimientos del enemigo, cubres cualquier apertura�. Durante 4 rondas, tu armadura aumenta en 2.',
 0
),
--ID 1 - Mago
('Mago', 
 'Practicantes supremos de la magia, lanzan hechizos explosivos, enga�os sutiles y control mental. Invocan monstruos, vislumbran el futuro y transforman sustancias.', 
 6, 
 'Lluvia de meteoritos', 
 '�Orbes de fuego en llamas caen en picado sobre la tierra en un estallido abrasador que arrasa con lo que sea que se encuentre en su camino�. La tirada de ataque es autom�ticamente exitosa y el da�o es triplicado.',
 3
),
--ID 2 - Palad�n
('Palad�n', 
 'Guerreros devotos unidos por juramentos para luchar contra el mal. Sean cuales sean sus or�genes, sus juramentos los convierten en campeones bendecidos.', 
 12, 
 'Palabra Sagrada', 
 '�Aunque est�s sumido en un peligro indescriptible, aunque tus opciones se vean cada vez m�s acotadas, la fe en tu dios jam�s temblar�. Miras al cielo, alzas los brazos entreg�ndote a �l, y en respuesta una luz sagrada ba�a tu cuerpo, san�ndolo�. Te curas 1/2 de tu vida m�xima.',
 0
),

--ID 3 - P�caro
('P�caro', 
 'Maestros del sigilo y las habilidades, conf�an en las vulnerabilidades de sus oponentes para sacar ventaja. Ingeniosos y vers�tiles, son la piedra angular de cualquier grupo de aventureros.', 
 8, 
 'Tal�n de Aquiles', 
 '�Antes de que tu oponente siquiera note tus intenciones, en un impulso de adrenalina sales disparado hacia �l, confundi�ndolo con fintas, desviando sus golpes con gracia hasta que encuentras una apertura vital donde arremeter con todas tus fuerzas�. La tirada de ataque es autom�ticamente exitosa, haces el da�o de tu arma y adicionalmente provocas una hemorragia en el enemigo hasta el final del combate que hace 2 de da�o cada ronda.',
 1
);
select * from Classes;

--+-- BACKGROUND --+--

INSERT INTO Backgrounds(_Name, _Desc, ID_Skill1, ID_Skill2, InitialGold)
VALUES 
--ID 0 - Artesano
 ('Artesano', 
 'Eres miembro de un gremio de artesanos, especializado en un campo particular y cercanamente asociado con otros artesanos. Eres una parte bien establecida del mundo mercantil, liberado por tu talento y riqueza de las limitaciones de la sociedad feudal. Aprendiste tus habilidades como aprendiz de un maestro, bajo el patrocinio de tu gremio, hasta que te convertiste en un maestro por tus propios medios.', 
 5, 
 3, 
 20),
--ID 1 - Criminal
 ('Criminal', 
 'Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todav�a tienes contactos dentro del mundo criminal. Estas mucho m�s cerca que la mayor�a de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilizaci�n y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad.', 
 2, 
 6, 
 10),
--ID 2 - Ermita�o
 ('Ermita�o', 
 'Viv�as en la reclusi�n, ya sea en una comunidad resguardada como un monasterio o completamente solo por una parte importante de tu vida. Durante el tiempo que pasaste lejos del clamor de la sociedad, encontraste quietud, soledad, y quiz� alguna de las respuestas que buscabas.', 
 7, 
 4, 
 10),
--ID 3 - Forastero
 ('Forastero', 
 'Creciste en las tierras salvajes, lejos de la civilizaci�n y del confort de la ciudad y la tecnolog�a. Has sido testigo de la migraci�n de reba�os grandes como bosques enteros, has sobrevivido a un clima m�s extremo que el que cualquier habitante de la ciudad haya podido padecer. Llevas las tierras salvajes en la sangre, fueras un n�mada, un explorador, un eremita, un cazador-recolector o incluso un saqueador. Incluso en lugares donde no conozcas las caracter�sticas espec�ficas del terreno, comprendes las formas de lo salvaje.', 
 1, 
 7, 
 5),
--ID 4 - H�roe del Pueblo
('H�roe del Pueblo', 
 'Vienes de una clase social humilde, pero est�s destinado para mucho m�s. Ya la gente de tu pueblo natal te considera como su campe�n, y t� destino te llama a estar en contra de los tiranos y los monstruos que amenazan a la gente com�n en todas partes.', 
 5, 
 1, 
 15),
--ID 5 - Marinero 
('Marinero', 
 'Navegaste en una nave mar�tima por a�os. En ese tiempo, enfrentaste exitosamente poderosas tormentas, monstruos de las profundidades y a aquellos que quisieron hundir tu trabajo en las infinitas profundidades. Tu primer amor es la lejana l�nea del horizonte, pero el tiempo lleg� para probarte en algo nuevo.', 
 7, 
 4, 
 15),
--ID 6 - Soldado
 ('Soldado', 
 'La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendiste las t�cnicas b�sicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ej�rcito nacional permanente o de una compa��a de mercenarios, o tal vez miembro de una milicia local que salt� a la fama durante una guerra reciente.', 
 2, 
 0, 
 10);
select * from Backgrounds;

--+-- DAMAGE TYPE --+--

INSERT INTO DamageTypes(_Name)
VALUES
--ID 0 - Cortante
('Cortante'),
--ID 1 - Contundente
('Contundente'),
--ID 2 - Perforante
('Perforante'),
--ID 3 - Hielo
('Hielo'),
--ID 4 - Fuego
('Fuego'),
--ID 5 - Electricidad
('Electricidad');
select * from DamageTypes;

--+-- WEAPON --+--

--Weapon - Fuerza
EXEC InsertItem
    @Name = 'Hacha de mano',
    @Description = 'Un arma peque�a y vers�til, utilizada para ataques cuerpo a cuerpo o arrojadizos. Tiene una hoja afilada montada en un mango corto.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 3;

EXEC InsertItem
    @Name = 'Espada larga',
    @Description = 'Tiene una hoja recta y afilada de buena longitud, ideal para ataques de corte y estocadas. Se maneja con una o dos manos, ofreciendo un equilibrio entre velocidad y potencia.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Alabarda',
    @Description = 'Un arma de asta larga y pesada. Tiene una hoja de hacha combinada con una punta de lanza, permitiendo ataques de cortes profundos. Su longitud proporciona alcance adicional en combate cuerpo a cuerpo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 5;

EXEC InsertItem
    @Name = 'Espad�n',
    @Description = 'Grande y poderosa. Tiene una hoja larga y pesada dise�ada para ataques devastadores. Se maneja con dos manos, sacrificando velocidad por m�xima potencia y alcance en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Hacha de Batalla',
    @Description = 'Un arma robusta y poderosa. Tiene una hoja pesada montada en un mango largo, ideal para infligir golpes letales. Puede manejarse con una o dos manos, equilibrando versatilidad y potencia en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Gran Hacha',
    @Description = 'Tiene una hoja ancha y pesada montada en un largo mango, dise�ada para ataques poderosos. Se maneja con dos manos, ofreciendo m�xima potencia a costa de velocidad.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Gran Clava',
    @Description = 'Consiste en un grueso bast�n de madera o metal, a menudo con puntas o protuberancias. Ideal para aplastar enemigos con fuerza bruta.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Maza',
    @Description = 'Compacta y contundente. Tiene una cabeza pesada, a menudo con picos o protuberancias, montada en un mango corto.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 3;

EXEC InsertItem
    @Name = 'Honda',
    @Description = 'Es un arma a distancia simple y efectiva. Consiste en una correa de cuero o tela con una bolsa en el centro, usada para lanzar proyectiles como piedras.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Martillo de Guerra',
    @Description = 'Tiene una cabeza grande y pesada, generalmente con una forma de prisma o c�nica, montada en un mango corto. Se maneja con una o dos manos, ideal para golpear y destrozar la armadura de los enemigos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Mayal',
    @Description = 'Consiste en una bola de metal con picos, unida a un mango mediante una cadena o cord�n, permitiendo golpes devastadores que pueden atravesar la armadura y causar da�o grave a los enemigos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Jabalina',
    @Description = 'Una vara larga con una punta afilada en un extremo y un equilibrio adecuado para el vuelo estable. Es liviana y f�cil de transportar, pero requiere habilidad para ser precisa en el combate a distancia.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 3;

EXEC InsertItem
    @Name = 'Lanza de Caballer�a',
    @Description = 'Tiene una hoja larga y afilada montada en un mango resistente. Ofrece alcance adicional y potencia en el combate, pero puede ser dif�cil de maniobrar en espacios cerrados.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Lucero del Alba',
    @Description = 'Una bola de metal con puntas afiladas, montada en un mango corto y resistente. Se maneja con una o dos manos y es especialmente efectiva contra enemigos con armadura. Su dise�o �nico permite golpear con fuerza concentrada.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Pica de Guerra',
    @Description = 'Dise�ada para enfrentamientos en formaci�n y defensa de posiciones. Tiene una punta larga y afilada montada en un asta robusta y larga. Es ideal para detener cargas de caballer�a y proteger l�neas de combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 5;

EXEC InsertItem
    @Name = 'Tridente',
    @Description = 'Vers�til y efectiva. Consiste en tres puntas afiladas montadas en un mango largo. Ofrece una combinaci�n de ataques de estocada y corte.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 3;

--Weapon - Destreza
EXEC InsertItem
    @Name = 'Hoz',
    @Description = 'Conformada por una hoja curva montada en un mango corto. Es conocida por su capacidad para realizar ataques de corte y barrido, haci�ndola efectiva en combates cercanos. Adem�s de ser un arma, la hoz tambi�n se utiliza en tareas agr�colas, lo que la convierte en una opci�n vers�til tanto en la granja como en el campo de batalla.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Cimitarra',
    @Description = 'Una hoja curva y afilada, similar a un sable. Es especialmente efectiva para realizar ataques de corte r�pidos y precisos. Se maneja con una mano y es popular entre los guerreros �giles y veloces. La forma curva de la hoja permite realizar ataques vers�tiles y fluidos en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC InsertItem
    @Name = 'Espada Corta',
    @Description = 'Tiene una hoja recta y afilada de longitud media, ideal para ataques r�pidos y precisos en espacios reducidos. La espada corta es popular entre los aventureros que prefieren la movilidad y la rapidez en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC InsertItem
    @Name = 'L�tigo',
    @Description = 'Es un arma flexible y vers�til que se utiliza para ataques a distancia y para restringir movimientos. Consiste en una tira larga de cuero o cuerda con un mango en un extremo. Es ideal para incapacitar a los oponentes, as� como para realizar ataques a distancia en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Golpe Desarmado',
    @Description = 'Puede ser efectuado con los pu�os, los codos, las rodillas u otras partes del cuerpo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 5,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 1;

EXEC InsertItem
    @Name = 'Martillo Ligero',
    @Description = 'Tiene una cabeza peque�a y un mango corto, lo que lo hace ideal para ataques r�pidos y precisos. Aunque menos poderoso que un martillo de guerra, su ligereza permite al usuario ser m�s �gil en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Clava',
    @Description = 'Simple pero efectiva. Consiste en un palo pesado y contundente, generalmente hecho de madera o metal, con un extremo dise�ado para golpear.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Daga',
    @Description = 'Tiene una hoja corta y afilada, ideal para ataques r�pidos y precisos en combate cercano. Es f�cil de ocultar y �til para realizar ataques sigilosos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Lanza',
    @Description = 'Una vara larga con una punta afilada en un extremo, ideal para realizar ataques de estocada desde la distancia. Es popular entre guerreros y cazadores que necesitan un arma vers�til que pueda ser utilizada tanto en combate a distancia como en combate cuerpo a cuerpo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 3;

	EXEC InsertItem
    @Name = 'Arco Corto',
    @Description = 'Un arco m�s peque�o que el largo, lo que lo hace m�s manejable en espacios reducidos o en movimiento r�pido. Es ideal para ataques precisos a corta y mediana distancia. Es la elecci�n de los arqueros que valoran la movilidad y la rapidez en el combate, ya que les permite disparar con facilidad mientras se desplazan por el campo de batalla.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC InsertItem
    @Name = 'Ballesta Ligera',
    @Description = 'Se compone de un arco montado sobre un asta, con un mecanismo de tensi�n que permite disparar proyectiles con gran fuerza y precisi�n. Es m�s f�cil de manejar que una ballesta pesada y puede dispararse con una sola mano, lo que la hace ideal para combate r�pido y t�ctico.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;
	
EXEC InsertItem
    @Name = 'Estoque',
    @Description = 'Su hoja larga y estrecha facilita la penetraci�n de la armadura y la realizaci�n de ataques precisos. Es especialmente efectivo en combate uno a uno, donde puede aprovechar su agilidad y velocidad para superar las defensas del oponente.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Arco Largo',
    @Description = 'Con una estructura m�s larga y un mayor poder de tensi�n que un arco corto, el arco largo es ideal para disparos de largo alcance y ataques poderosos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;

EXEC InsertItem
    @Name = 'Ballesta Pesada',
    @Description = 'Se compone de un arco montado sobre un asta m�s gruesa y resistente, con un mecanismo de tensi�n que permite disparar proyectiles con gran fuerza y precisi�n. A diferencia de la ballesta ligera, la ballesta pesada requiere m�s tiempo para cargar y apuntar, pero compensa con un mayor poder de penetraci�n y alcance.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 5;

--Weapon - Inteligencia
EXEC InsertItem
    @Name = 'Varita de Hielo',
    @Description = 'Es un instrumento m�gico b�sico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de hielo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Bast�n G�lido',
    @Description = 'Es un artefacto imbuido de energ�a arcano. Suele ser elaborado con madera encantada o adornado con gemas m�sticas. Este bast�n concede a su portador la capacidad de lanzar una variedad de hechizos de nivel medio con mayor facilidad y potencia. Al tocarlo uno puede sentir una fr�a sensaci�n de calma.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 4;

EXEC InsertItem
    @Name = 'B�culo de las Nieves',
    @Description = 'Un objeto m�gico poderoso imbuido con el poder del fr�o y la nieve. Tallado con madera de �rboles antiguos de los p�ramos helados y adornado con cristales de hielo, este bast�n canaliza la esencia de los elementos invernales.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Cetro Glacial',
    @Description = 'Forjado a partir de los secretos m�s profundos del hielo y la magia glacial. Este cetro, hecho de cristal helado y adornado con runas de poder, es una encarnaci�n de la esencia misma del fr�o y la congelaci�n.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 8;

EXEC InsertItem
    @Name = 'Varita de Fuego',
    @Description = 'Es un instrumento m�gico b�sico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de fuego.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Bast�n de Fuego',
    @Description = 'Es un artefacto imbuido de energ�a arcano. Suele ser elaborado con madera encantada o adornado con gemas m�sticas. Este bast�n concede a su portador la capacidad de lanzar una variedad de hechizos de nivel medio con mayor facilidad y potencia. Al tocarlo uno puede sentir una c�lida sensaci�n de coraje.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 4;

EXEC InsertItem
    @Name = 'B�culo Flam�gero',
    @Description = 'Un poderoso artefacto m�gico imbuido con el poder del fuego y las llamas. Hecho de madera oscura y adornado con gemas rojas resplandecientes, este b�culo es una manifestaci�n de la furia elemental del fuego.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Cetro Infernal',
    @Description = 'Este cetro es una manifestaci�n del poder oscuro y abrasador del Infierno, capaz de desencadenar terribles fuerzas infernales sobre los enemigos del portador. Permite lanzar hechizos ardientes y destructivos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 8;

EXEC InsertItem
    @Name = 'Varita El�ctrica',
    @Description = 'Es un instrumento m�gico b�sico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de electricidad.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 2;

EXEC InsertItem
    @Name = 'Bast�n El�ctrico',
    @Description = 'Es un artefacto imbuido de energ�a arcano. Suele ser elaborado con madera encantada o adornado con gemas m�sticas. Este bast�n concede a su portador la capacidad de lanzar una variedad de hechizos de nivel medio con mayor facilidad y potencia. Al tocarlo uno puede sentir una chisporroteante sensaci�n de adrenalina.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 4;

EXEC InsertItem
    @Name = 'B�culo Paralizante',
    @Description = 'Imbuido con el poder de la tormenta y la electricidad. Tallado con madera oscura y adornado con rel�mpagos esculpidos, este b�culo es una manifestaci�n del poder�o elemental del trueno.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 6;

EXEC InsertItem
    @Name = 'Cetro de las Tormentas',
    @Description = 'Creado a partir de la esencia misma de la electricidad y la fuerza de las tormentas. Este cetro, adornado con rel�mpagos danzantes y grabados de nubes tormentosas, es una encarnaci�n del poder�o elemental del trueno y el rel�mpago. Permite a su portador lanzar hechizos de electricidad devastadores.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 8;


--+-- PROTECTIONS --+--

--Armor
EXEC InsertItem
    @Name = 'Vestimentas comunes',
    @Description = 'Ropajes iniciales de la aventura.',
    @ItemType = 1, -- Equippable
    @Price = 0,
    @EquippableType = 1, -- Armor
    @ResistanceType = 0,
    @Armor = 0;

EXEC InsertItem
    @Name = 'Acolchada',
    @Description = 'Una vestimenta protectora ligera y flexible, compuesta por capas de tela acolchada o cuero endurecido.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Armor
    @ResistanceType = 1,
    @Armor = 1;

EXEC InsertItem
    @Name = 'Cuero',
    @Description = 'Es una protecci�n ligera y flexible hecha de cuero curtido y endurecido.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Armor
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC InsertItem
    @Name = 'Cuero Tachonado',
    @Description = 'Una mejora de la armadura de cuero b�sica. Est� reforzada con peque�as placas de metal, generalmente remachadas en el cuero para aumentar su resistencia.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Armor
    @ResistanceType = 2, -- Perforante
    @Armor = 2;

EXEC InsertItem
    @Name = 'Pieles',
    @Description = 'Hecha de pieles de animales curtidas y tratadas. Aunque ofrece una protecci�n limitada en comparaci�n con las armaduras met�licas, es ligera, flexible y proporciona cierto grado de resistencia contra ataques f�sicos y clim�ticos.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Armor
    @ResistanceType = 1, -- Contundente
    @Armor = 2;

EXEC InsertItem
    @Name = 'Camisote de mallas',
    @Description = 'Protecci�n intermedia hecha de anillos de metal entrelazados. Ofrece una mayor defensa que las armaduras de cuero, pero sin el peso ni la rigidez de las armaduras de placas completas.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 1, -- Armor
    @ResistanceType = 0, -- Cortante
    @Armor = 3;

EXEC InsertItem
    @Name = 'Cota de escamas',
    @Description = 'Compuesta por peque�as placas de metal o material duro cosidas sobre una base de cuero o tela. Las escamas se superponen como las de un pez, proporcionando una defensa s�lida contra ataques de corte y perforaci�n.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 1, -- Armor
    @ResistanceType = 2, -- Perforante
    @Armor = 4;

EXEC InsertItem
    @Name = 'Coraza',
    @Description = 'Cubre el torso y la parte superior del cuerpo. Generalmente est� hecha de metal, forjada en una sola pieza para proporcionar la m�xima protecci�n contra ataques f�sicos.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 1, -- Armor
    @ResistanceType = 1, -- Contundente
    @Armor = 4;

EXEC InsertItem
    @Name = 'Semiplacas',
    @Description = 'Es una versi�n mejorada de la coraza, que combina la protecci�n de las placas con la flexibilidad de la malla. Est� compuesta por una mezcla de placas de metal y malla, lo que proporciona una defensa s�lida sin sacrificar demasiada movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 75,
    @EquippableType = 1, -- Armor
    @ResistanceType = 2, -- Perforante
    @Armor = 5;

EXEC InsertItem
    @Name = 'Cota de anillas',
    @Description = 'Compuesta por anillos de metal unidos entre s� para formar una malla flexible. Aunque no ofrece la misma protecci�n que las armaduras m�s pesadas, como la cota de mallas o la armadura de placas, la cota de anillas es m�s ligera y permite una mayor movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 75,
    @EquippableType = 1, -- Armor
    @ResistanceType = 0, -- Cortante
    @Armor = 5;

EXEC InsertItem
    @Name = 'Cota de mallas',
    @Description = 'Es una variante mejorada de la cota de anillas, reforzada con m�s anillos de metal y una construcci�n m�s resistente. Esta armadura proporciona una protecci�n mejorada contra ataques de corte y perforaci�n, mientras a�n permite una cantidad razonable de movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 105,
    @EquippableType = 1, -- Armor
    @ResistanceType = 2, -- Perforante
    @Armor = 6;

EXEC InsertItem
    @Name = 'Bandas',
    @Description = 'Est� compuesta por tiras anchas de metal entrecruzadas y cosidas sobre una base de cuero o tela robusta. Esta armadura proporciona una defensa s�lida contra golpes y cortes.',
    @ItemType = 1, -- Equippable
    @Price = 140,
    @EquippableType = 1, -- Armor
    @ResistanceType = 0, -- Cortante
    @Armor = 7;

EXEC InsertItem
    @Name = 'Placas',
    @Description = 'Es una protecci�n pesada y robusta compuesta por placas de metal articuladas o laminadas que cubren gran parte del cuerpo. Esta armadura ofrece una defensa superior contra una amplia variedad de ataques, incluidos los golpes contundentes y los cortes.',
    @ItemType = 1, -- Equippable
    @Price = 180,
    @EquippableType = 1, -- Armor
    @ResistanceType = 1, -- Contundente
    @Armor = 8;

--Shield
EXEC InsertItem
    @Name = 'Rodela',
    @Description = 'Peque�o escudo redondo, generalmente de metal o madera, que se sujeta al antebrazo con correas.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 2, -- Shield
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC InsertItem
    @Name = 'Rondache',
    @Description = 'Ligero, similar a una rodela, pero apenas m�s robusto. Hecho de madera o metal.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 2, -- Shield
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC InsertItem
    @Name = 'Escudo de madera reforzada',
    @Description = 'Un escudo hecho principalmente de madera, pero con refuerzos de metal o cuero para aumentar su durabilidad y capacidad de defensa.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 2, -- Shield
    @ResistanceType = 1, -- Contundente
    @Armor = 1;

EXEC InsertItem
    @Name = 'Escudo con correa',
    @Description = 'Especialmente dise�ado para ser utilizado sin necesidad de sostenerlo directamente con la mano. Este escudo se asegura al brazo del portador mediante correas y hebillas, lo que permite al usuario mantener ambas manos libres para otras tareas.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 2, -- Shield
    @ResistanceType = 2, -- Perforante
    @Armor = 2;

EXEC InsertItem
    @Name = 'Escudo de Pieles',
    @Description = 'Est� compuesto por capas gruesas de pieles curtidas y tratadas, reforzadas con tiras de cuero endurecido o placas de metal para aumentar su durabilidad y capacidad de defensa.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 2, -- Shield
    @ResistanceType = 1, -- Contundente
    @Armor = 2;

EXEC InsertItem
    @Name = 'Robaespadas',
    @Description = 'Adem�s de ofrecer protecci�n est�ndar, este escudo tiene protuberancias, ganchos o ranuras que pueden atrapar las hojas de las espadas enemigas, logrando una disminuci�n en la potencia del impacto de los enemigos.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 2, -- Shield
    @ResistanceType = 0, -- Cortante
    @Armor = 2;

EXEC InsertItem
    @Name = 'Fortaleza',
    @Description = 'Grande y robusto, dise�ado para proporcionar una defensa excepcional en combate. Este escudo es m�s grande y m�s pesado que los escudos est�ndar, a menudo cubriendo una mayor parte del cuerpo del portador.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 2, -- Shield
    @ResistanceType = 2, -- Perforante
    @Armor = 3;

EXEC InsertItem
    @Name = 'Escudo Salvo',
    @Description = 'Escudo �nico dise�ado para proporcionar una defensa m�vil y vers�til en combate. Este escudo tiene una caracter�stica especial que le permite lanzar peque�os proyectiles defensivos, como dardos o flechas, para deflectar los ataques antes de que impacten.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 2, -- Shield
    @ResistanceType = 2, -- Perforante
    @Armor = 3;

EXEC InsertItem
    @Name = 'Escudo de acero reforzado',
    @Description = 'Un escudo pesado y resistente hecho principalmente de acero, con refuerzos adicionales para aumentar su durabilidad y capacidad defensiva.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 2, -- Shield
    @ResistanceType = 0, -- Cortante
    @Armor = 3;

EXEC InsertItem
    @Name = 'Escudo Meteoro',
    @Description = 'Excepcionalmente resistente y poderoso, a menudo considerado un artefacto o una creaci�n m�gica. Se dice que est� forjado con metales raros y materiales de meteoritos, lo que le otorga propiedades �nicas y una incre�ble durabilidad.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 2, -- Shield
    @ResistanceType = 1, -- Contundente
    @Armor = 4;

--+-- CONSUMABLES --+--

--Cure
EXEC InsertItem
    @Name = 'Poci�n de curaci�n',
    @Description = 'Restaura una cantidad peque�a de puntos de golpe al usuario. Es una herramienta com�n para recuperarse durante o despu�s de una batalla.',
    @ItemType = 2, -- Consumable
    @Price = 13,
    @Effect = -1, -- Curaci�n
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de curaci�n mayor',
    @Description = 'Una versi�n m�s potente de la poci�n b�sica. Al ser consumida, proporciona una cantidad considerablemente mayor de puntos de golpe al usuario.',
    @ItemType = 2, -- Consumable
    @Price = 28,
    @Effect = -1, -- Curaci�n
    @Amount = 14;

EXEC InsertItem
    @Name = 'Poci�n de curaci�n superior',
    @Description = 'Una versi�n a�n m�s poderosa de la poci�n de curaci�n mayor. Al ser consumida, restaura una cantidad significativa de puntos de golpe.',
    @ItemType = 2, -- Consumable
    @Price = 60,
    @Effect = -1, -- Curaci�n
    @Amount = 32;

EXEC InsertItem
    @Name = 'Poci�n de curaci�n suprema',
    @Description = 'Es la forma m�s poderosa de poci�n de curaci�n disponible. Al consumirla, proporciona una cantidad extraordinaria de puntos de golpe, lo que la convierte en un recurso invaluable en situaciones cr�ticas donde la supervivencia est� en juego.',
    @ItemType = 2, -- Consumable
    @Price = 128,
    @Effect = -1, -- Curaci�n
    @Amount = 72;
	
--BUFF
EXEC InsertItem
    @Name = 'Poci�n de Fuerza menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en la fuerza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 0, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Fuerza media',
    @Description = 'Una versi�n m�s potente de la poci�n de fuerza menor. Al ser consumida, proporciona un aumento moderado en la fuerza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 0, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Fuerza superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de fuerza media. Al ser consumida, otorga un aumento significativo en la fuerza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 0, -- Buff
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de Destreza menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en la destreza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 1, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Destreza media',
    @Description = 'Una versi�n m�s potente de la poci�n de destreza menor. Al ser consumida, proporciona un aumento moderado en la destreza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 1, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Destreza superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de destreza media. Al ser consumida, otorga un aumento significativo en la destreza del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 1, -- Buff
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de Constituci�n menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en la constituci�n del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 2, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Constituci�n media',
    @Description = 'Una versi�n m�s potente de la poci�n de constituci�n menor. Al ser consumida, proporciona un aumento moderado en la constituci�n del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 2, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Constituci�n superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de constituci�n media. Al ser consumida, otorga un aumento significativo en la constituci�n del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 2, -- Buff
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de Inteligencia menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en la inteligencia del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 3, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Inteligencia media',
    @Description = 'Una versi�n m�s potente de la poci�n de inteligencia menor. Al ser consumida, proporciona un aumento moderado en la inteligencia del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 3, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Inteligencia superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de inteligencia media. Al ser consumida, otorga un aumento significativo en la inteligencia del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 3, -- Buff
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de Sabidur�a menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en la sabidur�a del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 4, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Sabidur�a media',
    @Description = 'Una versi�n m�s potente de la poci�n de sabidur�a menor. Al ser consumida, proporciona un aumento moderado en la sabidur�a del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 4, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Sabidur�a superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de sabidur�a media. Al ser consumida, otorga un aumento significativo en la sabidur�a del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 4, -- Buff
    @Amount = 6;

EXEC InsertItem
    @Name = 'Poci�n de Carisma menor',
    @Description = 'Brebaje m�gico que, al ser consumido, otorga temporalmente un aumento menor en el carisma del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 5, -- Buff
    @Amount = 2;

EXEC InsertItem
    @Name = 'Poci�n de Carisma media',
    @Description = 'Una versi�n m�s potente de la poci�n de carisma menor. Al ser consumida, proporciona un aumento moderado en el carisma del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 5, -- Buff
    @Amount = 4;

EXEC InsertItem
    @Name = 'Poci�n de Carisma superior',
    @Description = 'Una versi�n a�n m�s potente de la poci�n de carisma media. Al ser consumida, otorga un aumento significativo en el carisma del usuario.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 5, -- Buff
    @Amount = 6;

--+-- Attacks --+--

INSERT INTO Attacks (_Name, _Desc, ID_DamageType, Damage)
VALUES 
    ('Garras', 'Un ataque con afiladas garras que puede desgarrar la piel y causar da�os profundos.', 0, 1),
    ('Garrote', 'Un golpe contundente con un garrote que puede romper huesos y causar severos hematomas.', 1, 2),
    ('Tent�culos', 'Tent�culos que golpean con fuerza, aplastando y envolviendo a su objetivo.', 1, 1),
    ('Daga Espectral', 'Un ataque con una daga fantasmal que atraviesa la carne con facilidad.', 2, 3),
    ('Toque Corruptor', 'Un toque maligno que no solo corta la piel sino que tambi�n infecta con energ�a corrupta.', 0, 3),
    ('Piedra', 'Un lanzamiento de piedra que impacta con fuerza bruta.', 1, 1),
    ('Rayos Oculares', 'Poderosos rayos de energ�a el�ctrica disparados desde los ojos.', 5, 5),
    ('Mordisco', 'Un mordisco feroz que puede desgarrar carne y hueso.', 2, 1),
    ('Choque Aplastante', 'Un ataque demoledor que aplasta todo a su paso.', 1, 4),
    ('Tridente', 'Un golpe con un tridente que puede atravesar y empalar al enemigo.', 2, 3),
    ('L�tigo de Ra�ces', 'Un l�tigo hecho de ra�ces que desgarra la piel al contacto.', 0, 2),
    ('Gran hacha', 'Un poderoso hachazo que puede partir al enemigo en dos.', 0, 4),
    ('Embestida Cornamentada', 'Una carga con cuernos afilados que puede atravesar a los enemigos.', 2, 4),
    ('Aliento G�lido', 'Un soplo de aire helado que congela a todo lo que toca.', 3, 5),
    ('Lanza', 'Un ataque con una lanza que puede perforar armaduras y carne.', 2, 2),
    ('Cimitarra', 'Un corte r�pido y mortal con una cimitarra curva.', 0, 4),
    ('Arco Corto', 'Una flecha disparada con precisi�n que perfora la piel del enemigo.', 2, 2),
    ('Daga', 'Un ataque r�pido y letal con una daga afilada.', 2, 1),
    ('Galope Flam�gero', 'Un ataque ardiente mientras se carga hacia adelante, envolviendo al enemigo en llamas.', 4, 5),
    ('Pezu�a', 'Una patada fuerte con pezu�as que puede aplastar huesos.', 1, 3),
    ('Embestida', 'Un embate brutal que derriba y aplasta al enemigo.', 1, 3);
select * from Attacks;

--+-- Creatures --+--
----OJO CON LOS DAMAGE MOD, REVISAR QUE SE SUBAN BIEN
EXEC InsertCreature
    @Name = 'Arp�a',
    @Description = 'Las arp�as son criaturas s�dicas que cazan constantemente, disfrutando con el sufrimiento y la muerte. Su dulce canci�n ha llevado a una infinidad de aventureros a sus muertes, ya que provoca que se acerquen a la arp�a para que esta los mate y los devore.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 11,
    @MaxHealth = 15,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'0,1,1,1,-2,0,1',
    @Attacks = N'0,1';

EXEC InsertCreature
    @Name = 'Azotamentes',
    @Description = 'Los azotamentes son una plaga para las criaturas inteligentes de incontables mundos. Se trata de viajeros interdimensionales, esclavistas, tiranos psi�nicos y genios insidiosos que cosechan razas enteras para sus propios fines retorcidos. De su cabeza de pulpo surgen cuatro tent�culos que se retuercen de hambre cuando una criatura inteligente se acerca.',
    @Rating = 7,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 15,
    @MaxHealth = 38,
    @DamageMod = 2,  -- Constituci�n
    @Abilities = N'0,1,1,4,3,3',
    @Attacks = N'2,0';

EXEC InsertCreature
    @Name = 'Banshee',
    @Description = 'Al caer la noche, los viajeros m�s desafortunados escuchan los distantes lamentos de esp�ritus abandonados a su suerte. Este desgraciado esp�ritu es una banshee, almas en pena rencorosas creadas a partir de los esp�ritus de mujeres elfas.',
    @Rating = 4,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 12,
    @MaxHealth = 26,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'-5,2,0,1,0,3',
    @Attacks = N'3,4';

EXEC InsertCreature
    @Name = 'C�clope',
    @Description = 'Los c�clopes son gigantes con un solo ojo que viven sumidos en la pobreza en zonas despobladas. Estas criaturas son retra�das por naturaleza y evitan el contacto con otras razas, expulsando a aquellos que se adentran en sus tierras.',
    @Rating = 6,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 32,
    @DamageMod = 0,  -- Fuerza
    @Abilities = N'4,0,5,-1,2,0',
    @Attacks = N'1,5';

EXEC InsertCreature
    @Name = 'Contemplador',
    @Description = 'Una sola mirada a un contemplador basta para percibir su naturaleza ultraterrena e infame. Agresivas, llenas de odio y codiciosas, estas aberraciones se consideran superiores al resto de criaturas, con las que juguetean o destruyen a su antojo.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @DamageMod = 2,  -- Constituci�n
    @Abilities = N'0,2,4,3,2,3',
    @Attacks = N'6,7,8';

	---DE ACA PARA ABAJO LAS CRIATURAS NO VAN
EXEC InsertCreature
    @Name = 'Arp�a',
    @Description = 'Las arp�as son criaturas s�dicas que cazan constantemente, disfrutando con el sufrimiento y la muerte. Su dulce canci�n ha llevado a una infinidad de aventureros a sus muertes, ya que provoca que se acerquen a la arp�a para que esta los mate y los devore.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 11,
    @MaxHealth = 15,
    @CurrentHealth = 15,
    @GoldDrop = 10,
    @DamageMod = 1, -- Destreza
    @Abilities = O,1,1,1,-2,0,1,
    @Attacks = 0,1;  -- Garras y Garrote

	EXEC InsertCreature
    @Name = 'Azotamentes',
    @Description = 'Los azotamentes son una plaga para las criaturas inteligentes de incontables mundos. Se trata de viajeros interdimensionales, esclavistas, tiranos psi�nicos y genios insidiosos que cosechan razas enteras para sus propios fines retorcidos. De su cabeza de pulpo surgen cuatro tent�culos que se retuercen de hambre cuando una criatura inteligente se acerca.',
    @Rating = 7,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 15,
    @MaxHealth = 38,
    @CurrentHealth = 38,
    @GoldDrop = 20,
    @DamageMod = 2, -- Constituci�n
    @Abilities = '0,1,1,4,3,3',
    @Attacks = '2,0';  -- Tent�culos y Garras

EXEC InsertCreature
    @Name = 'Banshee',
    @Description = 'Al caer la noche, los viajeros m�s desafortunados escuchan los distantes lamentos de esp�ritus abandonados a su suerte. Este desgraciado esp�ritu es una banshee, almas en pena rencorosas creadas a partir de los esp�ritus de mujeres elfas.',
    @Rating = 4,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 12,
    @MaxHealth = 26,
    @CurrentHealth = 26,
    @GoldDrop = 14,
    @DamageMod = 1, -- Destreza
    @Abilities = '-5,2,0,1,0,3',
    @Attacks = '3,4';  -- Daga espectral y Toque Corruptor

EXEC InsertCreature
    @Name = 'C�clope',
    @Description = 'Los c�clopes son gigantes con un solo ojo que viven sumidos en la pobreza en zonas despobladas. Estas criaturas son retra�das por naturaleza y evitan el contacto con otras razas, expulsando a aquellos que se adentran en sus tierras.',
    @Rating = 6,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 32,
    @CurrentHealth = 32,
    @GoldDrop = 18,
    @DamageMod = 0, -- Fuerza
    @Abilities = '4,0,5,-1,2,0',
    @Attacks = '1,5';  -- Garrote y Piedra

EXEC InsertCreature
    @Name = 'Contemplador',
    @Description = 'Una sola mirada a un contemplador basta para percibir su naturaleza ultraterrena e infame. Agresivas, llenas de odio y codiciosas, estas aberraciones se consideran superiores al resto de criaturas, con las que juguetean o destruyen a su antojo.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @CurrentHealth = 80,
    @GoldDrop = 40,
    @DamageMod = 2, -- Constituci�n
    @Abilities = '0,2,4,3,2,3',
    @Attacks = '6,7,8';  -- Rayos oculares, Mordisco y Choque aplastante

EXEC InsertCreature
    @Name = 'Diablo Astado',
    @Description = 'Los diablos astados son perezosos hasta l�mites insospechados y se muestran reacios a exponerse a situaciones peligrosas. Adem�s, odian y temen a cualquier criatura m�s fuerte que ellos. Pero cuando se los provoca pueden demostrar una furia terrible.',
    @Rating = 11,
    @Experience = 7,
    @Proficiency = 7,
    @ArmorClass = 17,
    @MaxHealth = 60,
    @CurrentHealth = 60,
    @GoldDrop = 30,
    @DamageMod = 3, -- Destreza
    @Abilities = N'3,3,5,1,3,3',
    @Attacks = N'9,0';  -- Tridente y Garras

EXEC InsertCreature
    @Name = 'Dracoliche',
    @Description = 'Todos los dragones mueren, incluso teniendo en cuenta lo longevos que pueden llegar a ser. Esta idea no suele sentar bien a muchos dragones, por lo que algunos de ellos permiten que se les transforme con energ�a nigrom�ntica y rituales antiguos en poderosos dracoliches muertos vivientes.',
    @Rating = 13,
    @Experience = 7,
    @Proficiency = 9,
    @ArmorClass = 18,
    @MaxHealth = 67,
    @CurrentHealth = 67,
    @GoldDrop = 34,
    @DamageMod = 4, -- Inteligencia
    @Abilities = N'4,0,4,3,2,4',
    @Attacks = N'7,0';  -- Mordisco y Garras

	EXEC InsertCreature
    @Name = 'Dr�ade',
    @Description = 'Aquellas personas que entren en un bosque podr�an ser capaces de vislumbrar una figura femenina que viaja entre los �rboles. Una c�lida risa inunda el ambiente y atrae a quienes la escuchan a las profundidades de la sombra esmeralda.',
    @Rating = 3,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 12,
    @MaxHealth = 18,
    @CurrentHealth = 18,
    @GoldDrop = 14,
    @DamageMod = 4, -- Inteligencia
    @Abilities = N'0,1,0,2,2,4',
    @Attacks = N'1,10';  -- Garrote y L�tigo de Ra�ces

EXEC InsertCreature
    @Name = 'Ent',
    @Description = 'Los ents son �rboles despertados que habitan en bosques antiguos. Aunque prefieren pasar los d�as, meses y a�os en una quietud contemplativa, protegen con ferocidad los bosques, que son su herencia, de amenazas exteriores.',
    @Rating = 9,
    @Experience = 7,
    @Proficiency = 7,
    @ArmorClass = 15,
    @MaxHealth = 55,
    @CurrentHealth = 55,
    @GoldDrop = 26,
    @DamageMod = 1, -- Destreza
    @Abilities = N'1,1,1,-2,0,1',
    @Attacks = N'10,5';  -- L�tigo de Ra�ces y Piedra

EXEC InsertCreature
    @Name = 'Gigante de Escarcha',
    @Description = 'Los gigantes de escarcha, enormes saqueadores provenientes de las heladas tierras de m�s all� de la civilizaci�n, son fieros y duros guerreros que sobreviven de lo conseguido en sus incursiones y saqueos. Tan solo respetan la fuerza bruta y la habilidad para el combate, mostrando ambas con cicatrices y los grotescos trofeos que cogen de sus enemigos.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @CurrentHealth = 80,
    @GoldDrop = 40,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'5,-1,5,-1,0,1',
    @Attacks = N'11,12,13';  -- Gran Hacha, Embestida Cornamentada, Aliento G�lido

EXEC InsertCreature
    @Name = 'Gnoll',
    @Description = 'Los gnolls son humanoides salvajes que atacan sin previo aviso asentamientos en las fronteras de la civilizaci�n, asesinando a sus v�ctimas y devorando su carne.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 12,
    @MaxHealth = 17,
    @CurrentHealth = 17,
    @GoldDrop = 12,
    @DamageMod = 2, -- Fuerza
    @Abilities = N'2,1,0,-2,0,-2',
    @Attacks = N'7,14';  -- Mordisco y Lanza

EXEC InsertCreature
    @Name = 'Goblin',
    @Description = 'Los goblins son peque�os humanoides, ego�stas y de negro coraz�n, que habitan en cavernas, minas abandonadas, mazmorras saqueadas y otros lugares l�gubres.',
    @Rating = 1,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 11,
    @MaxHealth = 12,
    @CurrentHealth = 12,
    @GoldDrop = 10,
    @DamageMod = 1, -- Destreza
    @Abilities = N'-1,2,0,0,-1,-1',
    @Attacks = N'15,16';  -- Cimitarra y Arco Corto


EXEC InsertCreature
    @Name = 'Golem de Piedra',
    @Description = 'Los g�lems de piedra existen en m�ltiples formas, pero siempre tallados en roca como altas e impresionantes estatuas. Aunque la mayor�a tienen rasgos humanoides, los g�lems de piedra pueden estar tallados de cualquier manera que quien los esculpe decida.',
    @Rating = 7,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 48,
    @CurrentHealth = 48,
    @GoldDrop = 22,
    @DamageMod = 3, -- Fuerza
    @Abilities = N'3,-1,4,-4,0,-4',
    @Attacks = N'5,5';  -- Piedra y Garrote

EXEC InsertCreature
    @Name = 'Grifo',
    @Description = 'Los grifos son feroces aves carn�voras con los musculosos cuerpos de un le�n y las cabezas, patas delanteras y alas de un �guila. Cuando atacan, son �giles y letales como �guilas, pero luchan con el poder y la gracilidad de un le�n.',
    @Rating = 4,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 13,
    @MaxHealth = 22,
    @CurrentHealth = 22,
    @GoldDrop = 16,
    @DamageMod = 2, -- Fuerza
    @Abilities = N'2,3,2,-2,1,-1',
    @Attacks = N'0,7';  -- Garras y Mordisco

EXEC InsertCreature
    @Name = 'Kobold',
    @Description = 'Los kobolds son humanoides reptilianos sumamente cobardes, que adoran a los dragones malvados como semidioses y los sirven como esbirros. Habitan en las guaridas de los dragones siempre que pueden, pero lo m�s normal es que moren en mazmorras donde acumulan los tesoros y bagatelas que conforman sus peque�as fortunas.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 13,
    @MaxHealth = 15,
    @CurrentHealth = 15,
    @GoldDrop = 10,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'0,2,0,-2,-1,-2',
    @Attacks = N'17,0';  -- Daga y Garras

EXEC InsertCreature
    @Name = 'Hombre Lobo',
    @Description = 'Los hombres lobos son depredadores salvajes. En su forma de humanoide, estas criaturas poseen sentidos muy agudos, un temperamento fuerte y la tendencia a comer carne muy poco hecha. Pero su forma h�brida se compone de un musculoso cuerpo similar al de un humanoide rematado con la cabeza de un lobo enloquecido.',
    @Rating = 8,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 52,
    @CurrentHealth = 52,
    @GoldDrop = 24,
    @DamageMod = 2, -- Fuerza
    @Abilities = N'2,3,1,0,0,0',
    @Attacks = N'0,7';  -- Garras y Mordisco

EXEC InsertCreature
    @Name = 'Pesadilla',
    @Description = 'Las pesadillas aparecen rodeadas de una nube de humo, con su crin, cola y pezu�as envueltas en llamas. La espeluznante y oscura forma de estos seres se mueve con una velocidad sobrenatural, desapareciendo en una nube de azufre tan r�pidamente c�mo apareci�.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @CurrentHealth = 80,
    @GoldDrop = 40,
    @DamageMod = 4, -- Fuerza
    @Abilities = N'4,3,3,1,2,2',
    @Attacks = N'18,19,20';  -- Galope Flam�gero, Pezu�a y Embestida

EXEC InsertCreature
    @Name = 'Vampiro',
    @Description = 'Despertados a una noche eterna y ansiando la vida que han perdido, los vampiros se sacian bebiendo la sangre de los vivos. Odian la luz solar, ya que esta les quema.',
    @Rating = 12,
    @Experience = 7,
    @Proficiency = 9,
    @ArmorClass = 16,
    @MaxHealth = 68,
    @CurrentHealth = 68,
    @GoldDrop = 32,
    @DamageMod = 3, -- Fuerza
    @Abilities = N'3,3,2,1,2,2',
    @Attacks = N'0,7';  -- Garras y Mordisco




---Buscador de armas
SELECT I.ID_Item AS ID, I._Name AS Name, I._Desc AS Description, W.Damage, A._Name AS Ability, DT._Name AS Damage_Type, I.Price
FROM Items I
INNER JOIN Weapons W ON I.ID_Item = W.ID_Item
INNER JOIN Abilities A  ON W.ID_Ability = A.ID_Ability
INNER JOIN DamageTypes DT ON W.ID_DamageType = DT.ID_DamageType

---Buscador de criaturas

--Tratar de encajar bien todo para que quede visible bien, probar con subquerys
--SELECT C._Name, C._Desc, C.Rating, C.Experience, C.Proficiency, C.ArmorClass, C.MaxHealth, C.DamageMod
SELECT *
FROM Creatures C
INNER JOIN AttacksXCreature ATTC ON C.ID_Creature = ATTC.ID_Creature
INNER JOIN AbilitiesXCreatures ABC  ON C.ID_Creature = ABC.ID_Creature
INNER JOIN Attacks ATT ON ATTC.ID_Attack = ATT.ID_Attack
INNER JOIN Abilities AB ON ABC.ID_Ability =	AB.ID_Ability
