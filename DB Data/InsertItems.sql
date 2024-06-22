use TPC_ChambersAndWyverns

--+-- ABILITY --+--

INSERT INTO Abilities (_Name, _Desc)
VALUES
--ID 0 - Fuerza
('Fuerza', 'Capacidad física y potencia muscular.'), 
--ID 1- Destreza
('Destreza', 'Agilidad, coordinación y reflejos.'),  
--ID 2 - Constitución
('Constitución', 'Resistencia y salud general.'),    
--ID 3 - Inteligencia
('Inteligencia', 'Capacidad lógica y conocimiento.'),
--ID 4 - Sabiduría
('Sabiduría', 'Percepción y juicio intuitivo.'),	 
--ID 5 - Carisma
('Carisma', 'Influencia y atractivo personal.');	 

--+-- SKILL --+--

INSERT INTO Skills(_Name, _Desc, ID_Ability)
VALUES
--ID 0 - Acrobacias
('Acrobacias', 'Agilidad y coordinación en movimientos acrobáticos', 1),
--ID 1 - Atletismo
('Atletismo', 'Habilidad física para realizar acciones atléticas como saltar, trepar o nadar', 0),
--ID 2 - Intimidación
('Intimidación', 'Capacidad para infundir miedo o respeto en otros', 5),
--ID 3 - Investigación
('Investigación', 'Habilidad para examinar y analizar información', 3),
--ID 4 - Percepción
('Percepción', 'Capacidad para observar y detectar detalles sutiles', 4),
--ID 5 - Persuasión
('Persuasión', 'Capacidad para influir en los demás y convencerlos', 5),
--ID 6 - Sigilo
('Sigilo', 'Habilidad para moverse sin ser detectado', 1),
--ID 7 - Supervivencia
('Supervivencia', 'Habilidad para sobrevivir en condiciones adversas', 4);

--+-- RACE --+--

INSERT INTO Races(_Name, _Desc, ID_Ability)
VALUES 
--ID 0 - Humano 
('Humano', 
 'En el cómputo de la mayoría de los mundos, los humanos son la más joven de las razas comunes, con una llegada tardía al mundo y una vida corta en comparación con los enanos, elfos, y dragones. Quizás es por su corta vida que se esfuerzan en conseguir tanto como pueden en los años que se les han dado. O quizás sienten que tienen algo que demostrar a las razas más antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo que les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.', 
 3),
--ID 1 - Elfo
('Elfo', 
 'Los elfos son un pueblo mágico de gracia sobrenatural, viviendo en el mundo sin ser del todo parte de él. Viven en lugares de etérea belleza, en medio de antiguos bosques o en plateados minaretes que resplandecen con luz feérica, donde una suave música flota en el aire y delicadas fragancias son transportadas por la brisa. Los elfos aman la naturaleza y la magia, el arte y la maestría, la música y la poesía, y las cosas buenas del mundo.', 
 4),
--ID 2 - Dracónido
('Dracónido', 
 'Nacido de los dragones, como su nombre proclama, el dracónido camina orgulloso a través de un mundo que le recibe lleno de miedo e incomprensión. Modelado por los dioses dracónidos o por los dragones mismos, el dracónido originalmente nacía de huevos de dragón como una raza única, combinando los mejores atributos de los dragones y los humanoides. Algunos dracónidos son fieles sirvientes de los verdaderos dragones, otros forman parte de ejércitos en grandes guerras e incluso otros se encuentran a la deriva, sin una visión clara de la vida.', 
 0),
--ID 3 - Enano
('Enano', 
 'Reinos ricos en antiguo esplendor, salas esculpidas en las raíces de las montañas, picos y martillos haciéndose eco en profundas minas y ardientes forjas, un compromiso con el clan y las tradiciones y un odio ardiente hacia orcos y goblins estos temas comunes unen a todos los enanos.', 
 2),
--ID 4 - Tiflin
('Tiflín', 
 'Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos: este es el destino de los tiflin. Y para retorcer el puñal, los tiflin saben que esto es a causa de un pacto sellado hace generaciones que infundió la esencia de Asmodeo, señor supremo de los Nueve Infiernos, en su linaje. Su apariencia y su naturaleza no tienen más culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus hijos, siempre se considerarán responsables.', 
 5),
--ID 5 - Mediano
('Mediano', 
 'Las comodidades del hogar son las metas para la mayoría de las vidas de los medianos: un lugar donde asentarse en paz y tranquilidad, lejos de monstruos merodeadores y enfrentamientos de ejércitos; un buen fuego y una comida generosa; buena bebida y buena conversación. Aunque algunos medianos viven sus días en alejadas comunidades agrícolas, otros forman grupos nómadas que viajan constantemente, atraídos por los nuevos caminos y anchos horizontes, para descubrir las maravillas de las nuevas tierras y gentes. Pero incluso estos viajeros aman la paz, comida, el bienestar y el hogar, aunque el hogar sea un vagón empujado a tirones a través de un camino embarrado o una barcaza flotando río abajo.', 
 1);

--+-- CLASS --+--

INSERT INTO Classes(_Name, _Desc, ClassHealth, SpecialName, SpecialDesc, ID_Ability)
VALUES 
--ID 0 - Guerrero
('Guerrero', 
 'Héroes maestros de armas y armaduras, conocedores del combate. Incluyen caballeros, mercenarios y soldados de élite.', 
 10, 
 'Cobertura Impenetrable', 
 '“Comprimes tu cuerpo, dedicas toda tu atención a los movimientos del enemigo, cubres cualquier apertura”. Durante 4 rondas, tu armadura aumenta en 2.',
 0
),
--ID 1 - Mago
('Mago', 
 'Practicantes supremos de la magia, lanzan hechizos explosivos, engaños sutiles y control mental. Invocan monstruos, vislumbran el futuro y transforman sustancias.', 
 6, 
 'Lluvia de Meteoritos', 
 '“Orbes de fuego en llamas caen en picado sobre la tierra en un estallido abrasador que arrasa con lo que sea que se encuentre en su camino”. La tirada de ataque es automáticamente exitosa y el daño es triplicado.',
 3
),
--ID 2 - Paladín
('Paladín', 
 'Guerreros devotos unidos por juramentos para luchar contra el mal. Sean cuales sean sus orígenes, sus juramentos los convierten en campeones bendecidos.', 
 12, 
 'Palabra Sagrada', 
 '“Aunque estés sumido en un peligro indescriptible, aunque tus opciones se vean cada vez más acotadas, la fe en tu dios jamás temblará. Miras al cielo, alzas los brazos entregándote a él, y en respuesta una luz sagrada baña tu cuerpo, sanándolo”. Te curas 1/2 de tu vida máxima.',
 0
),
--ID 3 - Pícaro
('Pícaro', 
 'Maestros del sigilo y las habilidades, confían en las vulnerabilidades de sus oponentes para sacar ventaja. Ingeniosos y versátiles, son la piedra angular de cualquier grupo de aventureros.', 
 8, 
 'Talón de Aquiles', 
 '“Antes de que tu oponente siquiera note tus intenciones, en un impulso de adrenalina sales disparado hacia él, confundiéndolo con fintas, desviando sus golpes con gracia hasta que encuentras una apertura vital donde arremeter con todas tus fuerzas”. La tirada de ataque es automáticamente exitosa, haces el daño de tu arma y adicionalmente provocas una hemorragia en el enemigo hasta el final del combate que hace 2 de daño cada ronda.',
 1
);

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
 'Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todavía tienes contactos dentro del mundo criminal. Estas mucho más cerca que la mayoría de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilización y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad.', 
 2, 
 6, 
 10),
--ID 2 - Ermitaño
 ('Ermitaño', 
 'Vivías en la reclusión, ya sea en una comunidad resguardada como un monasterio o completamente solo por una parte importante de tu vida. Durante el tiempo que pasaste lejos del clamor de la sociedad, encontraste quietud, soledad, y quizá alguna de las respuestas que buscabas.', 
 7, 
 4, 
 10),
--ID 3 - Forastero
 ('Forastero', 
 'Creciste en las tierras salvajes, lejos de la civilización y del confort de la ciudad y la tecnología. Has sido testigo de la migración de rebaños grandes como bosques enteros, has sobrevivido a un clima más extremo que el que cualquier habitante de la ciudad haya podido padecer. Llevas las tierras salvajes en la sangre, fueras un nómada, un explorador, un eremita, un cazador-recolector o incluso un saqueador. Incluso en lugares donde no conozcas las características específicas del terreno, comprendes las formas de lo salvaje.', 
 1, 
 7, 
 5),
--ID 4 - Héroe del Pueblo
('Héroe del Pueblo', 
 'Vienes de una clase social humilde, pero estás destinado para mucho más. Ya la gente de tu pueblo natal te considera como su campeón, y tú destino te llama a estar en contra de los tiranos y los monstruos que amenazan a la gente común en todas partes.', 
 5, 
 1, 
 15),
--ID 5 - Marinero 
('Marinero', 
 'Navegaste en una nave marítima por años. En ese tiempo, enfrentaste exitosamente poderosas tormentas, monstruos de las profundidades y a aquellos que quisieron hundir tu trabajo en las infinitas profundidades. Tu primer amor es la lejana línea del horizonte, pero el tiempo llegó para probarte en algo nuevo.', 
 7, 
 4, 
 15),
--ID 6 - Soldado
 ('Soldado', 
 'La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendiste las técnicas básicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ejército nacional permanente o de una compañía de mercenarios, o tal vez miembro de una milicia local que saltó a la fama durante una guerra reciente.', 
 2, 
 0, 
 10);

--+-- DAMAGE TYPE --+--

INSERT INTO DamageTypes(_Name)
VALUES
--ID 0 - Cortante
('Cortante'),
--ID 1 - Contundente
('Contundente'),
--ID 2 - Perforante
('Perforante'),
--ID 3 - Hielo (de)
('de Hielo'),
--ID 4 - Fuego (de)
('de Fuego'),
--ID 5 - Eléctrico
('Eléctrico');

--+-- WEAPON --+--

--Weapon - Fuerza
EXEC SP_InsertItem
    @Name = 'Hacha de mano',
    @Description = 'Un arma pequeña y versátil, utilizada para ataques cuerpo a cuerpo o arrojadizos. Tiene una hoja afilada montada en un mango corto.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Espada larga',
    @Description = 'Tiene una hoja recta y afilada de buena longitud, ideal para ataques de corte y estocadas. Se maneja con una o dos manos, ofreciendo un equilibrio entre velocidad y potencia.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Alabarda',
    @Description = 'Un arma de asta larga y pesada. Tiene una hoja de hacha combinada con una punta de lanza, permitiendo ataques de cortes profundos. Su longitud proporciona alcance adicional en combate cuerpo a cuerpo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 5;

EXEC SP_InsertItem
    @Name = 'Espadón',
    @Description = 'Grande y poderosa. Tiene una hoja larga y pesada diseñada para ataques devastadores. Se maneja con dos manos, sacrificando velocidad por máxima potencia y alcance en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Hacha de Batalla',
    @Description = 'Un arma robusta y poderosa. Tiene una hoja pesada montada en un mango largo, ideal para infligir golpes letales. Puede manejarse con una o dos manos, equilibrando versatilidad y potencia en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Gran Hacha',
    @Description = 'Tiene una hoja ancha y pesada montada en un largo mango, diseñada para ataques poderosos. Se maneja con dos manos, ofreciendo máxima potencia a costa de velocidad.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Gran Clava',
    @Description = 'Consiste en un grueso bastón de madera o metal, a menudo con puntas o protuberancias. Ideal para aplastar enemigos con fuerza bruta.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Maza',
    @Description = 'Compacta y contundente. Tiene una cabeza pesada, a menudo con picos o protuberancias, montada en un mango corto.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Honda',
    @Description = 'Es un arma a distancia simple y efectiva. Consiste en una correa de cuero o tela con una bolsa en el centro, usada para lanzar proyectiles como piedras.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Martillo de Guerra',
    @Description = 'Tiene una cabeza grande y pesada, generalmente con una forma de prisma o cónica, montada en un mango corto. Se maneja con una o dos manos, ideal para golpear y destrozar la armadura de los enemigos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Mayal',
    @Description = 'Consiste en una bola de metal con picos, unida a un mango mediante una cadena o cordón, permitiendo golpes devastadores que pueden atravesar la armadura y causar daño grave a los enemigos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Jabalina',
    @Description = 'Una vara larga con una punta afilada en un extremo y un equilibrio adecuado para el vuelo estable. Es liviana y fácil de transportar, pero requiere habilidad para ser precisa en el combate a distancia.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Lanza de Caballería',
    @Description = 'Tiene una hoja larga y afilada montada en un mango resistente. Ofrece alcance adicional y potencia en el combate, pero puede ser difícil de maniobrar en espacios cerrados.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Lucero del Alba',
    @Description = 'Una bola de metal con puntas afiladas, montada en un mango corto y resistente. Se maneja con una o dos manos y es especialmente efectiva contra enemigos con armadura. Su diseño único permite golpear con fuerza concentrada.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Pica de Guerra',
    @Description = 'Diseñada para enfrentamientos en formación y defensa de posiciones. Tiene una punta larga y afilada montada en un asta robusta y larga. Es ideal para detener cargas de caballería y proteger líneas de combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 5;

EXEC SP_InsertItem
    @Name = 'Tridente',
    @Description = 'Versátil y efectiva. Consiste en tres puntas afiladas montadas en un mango largo. Ofrece una combinación de ataques de estocada y corte.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 0,
    @Damage = 3;

--Weapon - Destreza
EXEC SP_InsertItem
    @Name = 'Hoz',
    @Description = 'Conformada por una hoja curva montada en un mango corto. Es conocida por su capacidad para realizar ataques de corte y barrido, haciéndola efectiva en combates cercanos. Además de ser un arma, la hoz también es una herramienta para tareas agrícolas.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Cimitarra',
    @Description = 'Una hoja curva y afilada, similar a un sable. Es especialmente efectiva para realizar ataques de corte rápidos y precisos. Se maneja con una mano y es popular entre los guerreros ágiles y veloces. La forma curva de la hoja la vuelve versátil y fluida en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Espada Corta',
    @Description = 'Tiene una hoja recta y afilada de longitud media, ideal para ataques rápidos y precisos en espacios reducidos. La espada corta es popular entre los aventureros que prefieren la movilidad y la rapidez en el combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Látigo',
    @Description = 'Es un arma flexible y versátil que se utiliza para ataques a distancia y para restringir movimientos. Consiste en una tira larga de cuero o cuerda con un mango en un extremo. Es ideal para incapacitar a los oponentes, así como para realizar ataques a distancia en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 0, -- Cortante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Golpe Desarmado',
    @Description = 'Puede ser efectuado con los puños, los codos, las rodillas u otras partes del cuerpo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 5,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 1;

EXEC SP_InsertItem
    @Name = 'Martillo Ligero',
    @Description = 'Tiene una cabeza pequeña y un mango corto, lo que lo hace ideal para ataques rápidos y precisos. Aunque menos poderoso que un martillo de guerra, su ligereza permite al usuario ser más ágil en combate.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Clava',
    @Description = 'Simple pero efectiva. Consiste en un palo pesado y contundente, generalmente hecho de madera o metal, con un extremo diseñado para golpear.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 1, -- Contundente
    @WeaponAbility = 1,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Daga',
    @Description = 'Tiene una hoja corta y afilada, ideal para ataques rápidos y precisos en combate cercano. Es fácil de ocultar y útil para realizar ataques sigilosos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Lanza',
    @Description = 'Una vara larga con una punta afilada en un extremo, ideal para realizar ataques de estocada desde la distancia. Es popular entre guerreros y cazadores que necesitan un arma que les sirva para un combate a distancia o cuerpo a cuerpo por igual.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Arco Corto',
    @Description = 'Un arco más pequeño que el largo, lo que lo hace más manejable en espacios reducidos o en movimiento rápido. Es ideal para ataques precisos a corta y mediana distancia. Rápida y ágil, es esencial para cualquier arquero que necesita estar en movimiento.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 30,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 3;

EXEC SP_InsertItem
    @Name = 'Ballesta Ligera',
    @Description = 'Se compone de un arco montado sobre un asta, con un mecanismo de tensión que permite disparar proyectiles con gran fuerza y precisión. Es más fácil de manejar que una ballesta pesada y puede dispararse con una sola mano, lo que la hace ideal para combate rápido y táctico.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;
	
EXEC SP_InsertItem
    @Name = 'Estoque',
    @Description = 'Su hoja larga y estrecha facilita la penetración de la armadura y la realización de ataques precisos. Es especialmente efectivo en combate uno a uno, donde puede aprovechar su agilidad y velocidad para superar las defensas del oponente.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Arco Largo',
    @Description = 'Con una estructura más larga y un mayor poder de tensión que un arco corto, el arco largo es ideal para disparos de largo alcance y ataques poderosos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Ballesta Pesada',
    @Description = 'Se compone de un arco montado sobre un asta más gruesa y resistente, con un mecanismo de tensión avanzado y robusto. A diferencia de la ballesta ligera, requiere más tiempo para cargar y apuntar, pero compensa con un mayor poder de penetración y alcance.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 75, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 2, -- Perforante
    @WeaponAbility = 1,
    @Damage = 5;

--Weapon - Inteligencia
EXEC SP_InsertItem
    @Name = 'Varita de Hielo',
    @Description = 'Es un instrumento mágico básico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de hielo.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Bastón Gélido',
    @Description = 'Es un artefacto imbuido de energía arcana. Elaborado con madera encantada y adornado con gemas místicas, le concederá a su portador la capacidad de lanzar una variedad de hechizos. Al tocarlo uno puede sentir una fría sensación de calma.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Báculo de las Nieves',
    @Description = 'Un objeto mágico poderoso imbuido con el poder del frío y la nieve. Tallado con madera de árboles antiguos de los páramos helados y adornado con cristales de hielo, este bastón canaliza la esencia de los elementos invernales.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Cetro Glacial',
    @Description = 'Forjado a partir de los secretos más profundos del hielo y la magia glacial. Este cetro, hecho de cristal helado y adornado con runas de poder, es una encarnación de la esencia misma del frío y la congelación.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 3, -- Hielo
    @WeaponAbility = 3,
    @Damage = 8;

EXEC SP_InsertItem
    @Name = 'Varita de Fuego',
    @Description = 'Es un instrumento mágico básico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de fuego.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Bastón de Fuego',
    @Description = 'Es un artefacto imbuido de energía arcana. Elaborado con madera encantada y adornado con gemas místicas, le concederá a su portador la capacidad de lanzar una variedad de hechizos. Al tocarlo uno puede sentir una cálida sensación de coraje.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50, 
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Báculo Flamígero',
    @Description = 'Un poderoso artefacto mágico imbuido con el poder del fuego y las llamas. Hecho de madera oscura y adornado con gemas rojas resplandecientes, este báculo es una manifestación de la furia elemental del fuego.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Cetro Infernal',
    @Description = 'Este cetro es una manifestación del poder oscuro y abrasador del Infierno, capaz de desencadenar terribles fuerzas infernales sobre los enemigos del portador. Permite lanzar hechizos ardientes y destructivos.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 4, -- Fuego
    @WeaponAbility = 3,
    @Damage = 8;

EXEC SP_InsertItem
    @Name = 'Varita Eléctrica',
    @Description = 'Es un instrumento mágico básico, generalmente hecho de madera y decorado con simples grabados o runas. Aunque su apariencia puede ser modesta, su potencial es significativo. En ella pueden verse talladas runas de los elementales de electricidad.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 15,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 2;

EXEC SP_InsertItem
    @Name = 'Bastón Eléctrico',
    @Description = 'Es un artefacto imbuido de energía arcana. Elaborado con madera encantada y adornado con gemas místicas, le concederá a su portador la capacidad de lanzar una variedad de hechizos. Al tocarlo uno puede sentir una chisporroteante sensación de adrenalina.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 50,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 4;

EXEC SP_InsertItem
    @Name = 'Báculo Paralizante',
    @Description = 'Imbuido con el poder de la tormenta y la electricidad. Tallado con madera oscura y adornado con relámpagos esculpidos, este báculo es una manifestación del poderío elemental del trueno.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 105,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 6;

EXEC SP_InsertItem
    @Name = 'Cetro de las Tormentas',
    @Description = 'Creado a partir de la esencia misma de la electricidad y la fuerza de las tormentas. Imbuido con relámpagos divinos y puros, es una encarnación del poderío elemental del trueno y el relámpago. Permite a su portador lanzar hechizos de electricidad devastadores.',
    @ItemType = 1, -- Tipo 1 para Equippable
    @Price = 180,
    @EquippableType = 0, -- Tipo 0 para armas
    @DamageType = 5, -- Electricidad
    @WeaponAbility = 3,
    @Damage = 8;


--+-- PROTECTIONS --+--

--Armor
EXEC SP_InsertItem
    @Name = 'Vestimentas comunes',
    @Description = 'Ropajes iniciales de la aventura. Te queda re fachero.',
    @ItemType = 1, -- Equippable
    @Price = 0,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 0,
    @Armor = 0;

EXEC SP_InsertItem
    @Name = 'Acolchada',
    @Description = 'Una vestimenta protectora ligera y flexible, compuesta por capas de tela acolchada o cuero endurecido.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 1,
    @Armor = 1;

EXEC SP_InsertItem
    @Name = 'Cuero',
    @Description = 'Es una protección ligera y flexible hecha de cuero curtido y endurecido.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC SP_InsertItem
    @Name = 'Cuero Tachonado',
    @Description = 'Una mejora de la armadura de cuero básica. Está reforzada con pequeñas placas de metal, generalmente remachadas en el cuero para aumentar su resistencia.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 2, -- Perforante
    @Armor = 2;

EXEC SP_InsertItem
    @Name = 'Pieles',
    @Description = 'Hecha de pieles de animales curtidas y tratadas. Aunque ofrece una protección limitada en comparación con las armaduras metálicas, es ligera, flexible y proporciona cierto grado de resistencia contra ataques físicos y climáticos.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 1, -- Contundente
    @Armor = 2;

EXEC SP_InsertItem
    @Name = 'Camisote de mallas',
    @Description = 'Protección intermedia hecha de anillos de metal entrelazados. Ofrece una mayor defensa que las armaduras de cuero, pero sin el peso ni la rigidez de las armaduras de placas completas.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 0, -- Cortante
    @Armor = 3;

EXEC SP_InsertItem
    @Name = 'Cota de escamas',
    @Description = 'Compuesta por pequeñas placas de metal o material duro cosidas sobre una base de cuero o tela. Las escamas se superponen como las de un pez, proporcionando una defensa sólida contra ataques de corte y perforación.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 2, -- Perforante
    @Armor = 4;

EXEC SP_InsertItem
    @Name = 'Coraza',
    @Description = 'Cubre el torso y la parte superior del cuerpo. Generalmente está hecha de metal, forjada en una sola pieza para proporcionar la máxima protección contra ataques físicos.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 1, -- Contundente
    @Armor = 4;

EXEC SP_InsertItem
    @Name = 'Semiplacas',
    @Description = 'Es una versión mejorada de la coraza, que combina la protección de las placas con la flexibilidad de la malla. Está compuesta por una mezcla de placas de metal y malla, lo que proporciona una defensa sólida sin sacrificar demasiada movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 75,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 2, -- Perforante
    @Armor = 5;

EXEC SP_InsertItem
    @Name = 'Cota de anillas',
    @Description = 'Compuesta por anillos de metal unidos entre sí para formar una malla flexible. Aunque no ofrece la misma protección que las armaduras más pesadas, como la cota de mallas o la armadura de placas, la cota de anillas es más ligera y permite una mayor movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 75,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 0, -- Cortante
    @Armor = 5;

EXEC SP_InsertItem
    @Name = 'Cota de mallas',
    @Description = 'Es una variante mejorada de la cota de anillas, reforzada con más anillos de metal y una construcción más resistente. Esta armadura proporciona una protección mejorada contra ataques de corte y perforación, mientras aún permite una cantidad razonable de movilidad.',
    @ItemType = 1, -- Equippable
    @Price = 105,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 2, -- Perforante
    @Armor = 6;

EXEC SP_InsertItem
    @Name = 'Bandas',
    @Description = 'Está compuesta por tiras anchas de metal entrecruzadas y cosidas sobre una base de cuero o tela robusta. Esta armadura proporciona una defensa sólida contra golpes y cortes.',
    @ItemType = 1, -- Equippable
    @Price = 140,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 0, -- Cortante
    @Armor = 7;

EXEC SP_InsertItem
    @Name = 'Placas',
    @Description = 'Es una protección pesada y robusta compuesta por placas de metal articuladas o laminadas que cubren gran parte del cuerpo. Esta armadura ofrece una defensa superior contra una amplia variedad de ataques, incluidos los golpes contundentes y los cortes.',
    @ItemType = 1, -- Equippable
    @Price = 180,
    @EquippableType = 1, -- Armor
    @ArmorType = 0,
    @ResistanceType = 1, -- Contundente
    @Armor = 8;

--Shield
EXEC SP_InsertItem
    @Name = 'Rodela',
    @Description = 'Pequeño escudo redondo, generalmente de metal o madera, que se sujeta al antebrazo con correas.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC SP_InsertItem
    @Name = 'Rondache',
    @Description = 'Ligero, similar a una rodela, pero apenas más robusto. Hecho de madera o metal.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 0, -- Cortante
    @Armor = 1;

EXEC SP_InsertItem
    @Name = 'Escudo de madera reforzada',
    @Description = 'Un escudo hecho principalmente de madera, pero con refuerzos de metal o cuero para aumentar su durabilidad y capacidad de defensa.',
    @ItemType = 1, -- Equippable
    @Price = 5,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 1, -- Contundente
    @Armor = 1;

EXEC SP_InsertItem
    @Name = 'Escudo con correa',
    @Description = 'Especialmente diseñado para ser utilizado sin necesidad de sostenerlo directamente con la mano. Este escudo se asegura al brazo del portador mediante correas y hebillas, lo que permite al usuario mantener ambas manos libres para otras tareas.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 2, -- Perforante
    @Armor = 2;

EXEC SP_InsertItem
    @Name = 'Escudo de Pieles',
    @Description = 'Está compuesto por capas gruesas de pieles curtidas y tratadas, reforzadas con tiras de cuero endurecido o placas de metal para aumentar su durabilidad y capacidad de defensa.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 1, -- Contundente
    @Armor = 2;

EXEC SP_InsertItem
    @Name = 'Robaespadas',
    @Description = 'Además de ofrecer protección estándar, este escudo tiene protuberancias, ganchos o ranuras que pueden atrapar las hojas de las espadas enemigas, logrando una disminución en la potencia del impacto de los enemigos.',
    @ItemType = 1, -- Equippable
    @Price = 15,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 0, -- Cortante
    @Armor = 2;

EXEC SP_InsertItem
    @Name = 'Fortaleza',
    @Description = 'Grande y robusto, diseñado para proporcionar una defensa excepcional en combate. Este escudo es más grande y más pesado que los escudos estándar, a menudo cubriendo una mayor parte del cuerpo del portador.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 2, -- Perforante
    @Armor = 3;

EXEC SP_InsertItem
    @Name = 'Escudo Salvo',
    @Description = 'Un escudo de origen desconocido, con la apariencia de un orbe de protección pseudomágico, capaz de desviar con maestría cualquier daño perforante que se le acerque.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 2, -- Perforante
    @Armor = 3;

EXEC SP_InsertItem
    @Name = 'Escudo de acero reforzado',
    @Description = 'Un escudo pesado y resistente hecho principalmente de acero, con refuerzos adicionales para aumentar su durabilidad y capacidad defensiva.',
    @ItemType = 1, -- Equippable
    @Price = 30,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 0, -- Cortante
    @Armor = 3;

EXEC SP_InsertItem
    @Name = 'Escudo Meteoro',
    @Description = 'Excepcionalmente resistente y poderoso, a menudo considerado un artefacto o una creación mágica. Se dice que está forjado con metales raros y materiales de meteoritos, lo que le otorga propiedades únicas y una increíble durabilidad.',
    @ItemType = 1, -- Equippable
    @Price = 50,
    @EquippableType = 1, -- Shield
    @ArmorType = 1,
    @ResistanceType = 1, -- Contundente
    @Armor = 4;

--+-- CONSUMABLES --+--

--Cure
EXEC SP_InsertItem
    @Name = 'Poción de curación',
    @Description = 'Restaura una cantidad pequeña de puntos de golpe al usuario. Es una herramienta común para recuperarse durante o después de una batalla.',
    @ItemType = 2, -- Consumable
    @Price = 13,
    @Effect = -1, -- Curación
    @Amount = 6;

EXEC SP_InsertItem
    @Name = 'Tereré de Yuyos Fey',
    @Description = 'Un refrescante tereré hecho con yuyos mágicos de los bosques de las hadas. Al tomarlo te sientes como nuevo.',
    @ItemType = 2, -- Consumable
    @Price = 28,
    @Effect = -1, -- Curación
    @Amount = 14;

EXEC SP_InsertItem
    @Name = 'Suprema de Wyvern',
    @Description = 'Una deliciosa milanesa de carne de wyvern, crujiente y sazonada, al comerla una sensación de satisfacción te llena',
    @ItemType = 2, -- Consumable
    @Price = 60,
    @Effect = -1, -- Curación
    @Amount = 32;

EXEC SP_InsertItem
    @Name = 'Ojo de Bife del Contemplador',
    @Description = 'Un jugoso y vibrante ojo de bife del contemplador, con un sabor rico y sobrenatural. Su energía se adentra en tu mente al consumirlo, y sientes que ves más claro.',
    @ItemType = 2, -- Consumable
    @Price = 128,
    @Effect = -1, -- Curación
    @Amount = 72;

EXEC SP_InsertItem
    @Name = 'Anillo de Fuerza',
    @Description = 'Un anillo mágico que, al ser usado, otorga temporalmente un aumento en la fuerza del usuario, aunque rápidamente se hará frágil y partirá.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 0, -- Fuerza
    @Amount = 2;

EXEC SP_InsertItem
    @Name = 'Cinturón de los Gigantes',
    @Description = 'Un cinturón que en su interior tiene el espíritu de los gigantes. Su fuerza poseerá al portador por un tiempo. La fuerza es tal que el cinturón no se mantendrá en una pieza por mucho tiempo.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 0, -- Fuerza
    @Amount = 4;

EXEC SP_InsertItem
    @Name = 'Ira de Ares',
    @Description = 'Este casco desatará una furia sin igual sobre quien lo porte. La fuerza del dios de la guerra caerá sobre su portador destruyendo a quien esté a su paso. Unas enormes llamas brotarán del casco, quemándolo en el proceso.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 0, -- Fuerza
    @Amount = 6;

EXEC SP_InsertItem
    @Name = 'Polvo de Hadas',
    @Description = 'Al respirar este polvo mágico, tus sentidos se verán agudizados levemente y tendrás un mejor control de tu cuerpo y sus limitaciones.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 1, -- Destreza
    @Amount = 2;

EXEC SP_InsertItem
    @Name = 'Blister Misterioso',
    @Description = 'Tras consumir el blister, inmediatamente sentirás su efecto. Durante un tiempo, estarás más ligero y más rápido, como si percibieras a tus oponentes como lentos.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 1, -- Destreza
    @Amount = 4;

EXEC SP_InsertItem
    @Name = 'Aguas de los Eladrins',
    @Description = 'Este agua fue extraída del mundo de los Eladrins, hogar de la magia. Su refrescante sabor inunda tu cuerpo con una energía indescriptible, tu velocidad se dispara, tus sentidos estarán afilados como una navaja y tu velocidad de respuesta será veloz como un rayo.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 1, -- Destreza
    @Amount = 6;

    EXEC SP_InsertItem
    @Name = 'Escrituras de Babaluk',
    @Description = 'Babaluk, el alquimista, dejó cientos de escrituras rúnicas esparcidas por el mundo. Al activarlas, sus conocimientos serán traspasados temporalmente al portador.',
    @ItemType = 2, -- Consumable
    @Price = 23,
    @Effect = 3, -- Inteligencia
    @Amount = 2;

EXEC SP_InsertItem
    @Name = 'Pergamino Oculto',
    @Description = 'Un viejo pergamino que, al abrirse, compartirá sus secretos con aquel cuyos ojos se posen en ellos. Tu entendimiento del mundo se profundizará a la par que el pergamino es consumido poco a poco.',
    @ItemType = 2, -- Consumable
    @Price = 49,
    @Effect = 3, -- Inteligencia
    @Amount = 4;

EXEC SP_InsertItem
    @Name = 'Últimas palabras del Archimago',
    @Description = 'Antes de fallecer, el Archimago dejó escritos donde detalla descubrimientos que podrían cambiar las leyes de la existencia como la conocemos. Llevan una runa que transformará tu mente al leerlo. pero el conocimiento se desintegrará poco a poco.',
    @ItemType = 2, -- Consumable
    @Price = 94,
    @Effect = 3, -- Inteligencia
    @Amount = 6;

--+-- ATTACKS --+--

INSERT INTO Attacks (_Name, _Desc, ID_DamageType, Damage)
VALUES 
    ('Garras', 'Un ataque con afiladas garras que puede desgarrar la piel y causar daños profundos.', 0, 1),
    ('Garrote', 'Un golpe contundente con un garrote que puede romper huesos y causar severos hematomas.', 1, 2),
    ('Tentáculos', 'Tentáculos que golpean con fuerza, aplastando y envolviendo a su objetivo.', 1, 1),
    ('Daga Espectral', 'Un ataque con una daga fantasmal que atraviesa la carne con facilidad.', 2, 3),
    ('Toque Corruptor', 'Un toque maligno que no solo corta la piel sino que también infecta con energía corrupta.', 0, 3),
    ('Piedra', 'Un lanzamiento de piedra que impacta con fuerza bruta.', 1, 1),
    ('Rayos Oculares', 'Poderosos rayos de energía eléctrica disparados desde los ojos.', 5, 5),
    ('Mordisco', 'Un mordisco feroz que puede desgarrar carne y hueso.', 2, 1),
    ('Choque Aplastante', 'Un ataque demoledor que aplasta todo a su paso.', 1, 4),
    ('Tridente', 'Un golpe con un tridente que puede atravesar y empalar al enemigo.', 2, 3),
    ('Látigo de Raíces', 'Un látigo hecho de raíces que desgarra la piel al contacto.', 0, 2),
    ('Gran hacha', 'Un poderoso hachazo que puede partir al enemigo en dos.', 0, 4),
    ('Embestida Cornamentada', 'Una carga con cuernos afilados que puede atravesar a los enemigos.', 2, 4),
    ('Aliento Gélido', 'Un soplo de aire helado que congela a todo lo que toca.', 3, 5),
    ('Lanza', 'Un ataque con una lanza que puede perforar armaduras y carne.', 2, 2),
    ('Cimitarra', 'Un corte rápido y mortal con una cimitarra curva.', 0, 4),
    ('Arco Corto', 'Una flecha disparada con precisión que perfora la piel del enemigo.', 2, 2),
    ('Daga', 'Un ataque rápido y letal con una daga afilada.', 2, 1),
    ('Galope Flamígero', 'Un ataque ardiente mientras se carga hacia adelante, envolviendo al enemigo en llamas.', 4, 5),
    ('Pezuña', 'Una patada fuerte con pezuñas que puede aplastar huesos.', 1, 3),
    ('Embestida', 'Un embate brutal que derriba y aplasta al enemigo.', 1, 3);

--+-- CREATURES --+--

EXEC SP_InsertCreature
    @Name = 'Arpía',
    @Description = 'Las arpías son criaturas sádicas que cazan constantemente, disfrutando con el sufrimiento y la muerte. Su dulce canción ha llevado a una infinidad de aventureros a sus muertes, ya que provoca que se acerquen a la arpía para que esta los mate y los devore.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 11,
    @MaxHealth = 15,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'0,1,1,1,-2,0,1',
    @Attacks = N'0,1';

EXEC SP_InsertCreature
    @Name = 'Azotamentes',
    @Description = 'Los azotamentes son una plaga para las criaturas inteligentes de incontables mundos. Se trata de viajeros interdimensionales, esclavistas, tiranos psiónicos y genios insidiosos que cosechan razas enteras para sus propios fines retorcidos. De su cabeza de pulpo surgen cuatro tentáculos que se retuercen de hambre cuando una criatura inteligente se acerca.',
    @Rating = 7,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 15,
    @MaxHealth = 38,
    @DamageMod = 2,  -- Constitución
    @Abilities = N'0,1,1,4,3,3',
    @Attacks = N'2,0';

EXEC SP_InsertCreature
    @Name = 'Banshee',
    @Description = 'Al caer la noche, los viajeros más desafortunados escuchan los distantes lamentos de espíritus abandonados a su suerte. Este desgraciado espíritu es una banshee, almas en pena rencorosas creadas a partir de los espíritus de mujeres elfas.',
    @Rating = 4,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 12,
    @MaxHealth = 26,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'-5,2,0,1,0,3',
    @Attacks = N'3,4';

EXEC SP_InsertCreature
    @Name = 'Cíclope',
    @Description = 'Los cíclopes son gigantes con un solo ojo que viven sumidos en la pobreza en zonas despobladas. Estas criaturas son retraídas por naturaleza y evitan el contacto con otras razas, expulsando a aquellos que se adentran en sus tierras.',
    @Rating = 6,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 32,
    @DamageMod = 0,  -- Fuerza
    @Abilities = N'4,0,5,-1,2,0',
    @Attacks = N'1,5';

EXEC SP_InsertCreature
    @Name = 'Contemplador',
    @Description = 'Una sola mirada a un contemplador basta para percibir su naturaleza ultraterrena e infame. Agresivas, llenas de odio y codiciosas, estas aberraciones se consideran superiores al resto de criaturas, con las que juguetean o destruyen a su antojo.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @DamageMod = 2,  -- Constitución
    @Abilities = N'0,2,4,3,2,3',
    @Attacks = N'6,7,8';

EXEC SP_InsertCreature
    @Name = 'Diablo Astado',
    @Description = 'Los diablos astados son perezosos hasta límites insospechados y se muestran reacios a exponerse a situaciones peligrosas. Además, odian y temen a cualquier criatura más fuerte que ellos. Pero cuando se los provoca pueden demostrar una furia terrible.',
    @Rating = 11,
    @Experience = 7,
    @Proficiency = 7,
    @ArmorClass = 17,
    @MaxHealth = 60,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'3,3,5,1,3,3',
    @Attacks = N'9,0';

EXEC SP_InsertCreature
    @Name = 'Dracoliche',
    @Description = 'Todos los dragones mueren, incluso teniendo en cuenta lo longevos que pueden llegar a ser. Esta idea no suele sentar bien a muchos dragones, por lo que algunos de ellos permiten que se les transforme con energía nigromántica y rituales antiguos en poderosos dracoliches muertos vivientes.',
    @Rating = 13,
    @Experience = 7,
    @Proficiency = 9,
    @ArmorClass = 18,
    @MaxHealth = 67,
    @DamageMod = 3,  -- Inteligencia
    @Abilities = N'4,0,4,3,2,4',
    @Attacks = N'7,0';

EXEC SP_InsertCreature
    @Name = 'Dríade',
    @Description = 'Aquellas personas que entren en un bosque podrían ser capaces de vislumbrar una figura femenina que viaja entre los árboles. Una cálida risa inunda el ambiente y atrae a quienes la escuchan a las profundidades de la sombra esmeralda.',
    @Rating = 3,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 12,
    @MaxHealth = 18,
    @DamageMod = 3,  -- Inteligencia
    @Abilities = N'0,1,0,2,2,4',
    @Attacks = N'1,10';

EXEC SP_InsertCreature
    @Name = 'Ent',
    @Description = 'Los ents son árboles despertados que habitan en bosques antiguos. Aunque prefieren pasar los días, meses y años en una quietud contemplativa, protegen con ferocidad los bosques, que son su herencia, de amenazas exteriores.',
    @Rating = 9,
    @Experience = 7,
    @Proficiency = 7,
    @ArmorClass = 15,
    @MaxHealth = 55,
    @DamageMod = 1,  -- Destreza
    @Abilities = N'1,1,1,-2,0,1',
    @Attacks = N'10,5';

EXEC SP_InsertCreature
    @Name = 'Gigante de Escarcha',
    @Description = 'Los gigantes de escarcha, enormes saqueadores provenientes de las heladas tierras de más allá de la civilización, son fieros y duros guerreros que sobreviven de lo conseguido en sus incursiones y saqueos. Tan solo respetan la fuerza bruta y la habilidad para el combate, mostrando ambas con cicatrices y los grotescos trofeos que cogen de sus enemigos.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @DamageMod = 0,  -- Fuerza
    @Abilities = N'5,-1,5,-1,0,1',
    @Attacks = N'11,12,13';

EXEC SP_InsertCreature
    @Name = 'Gnoll',
    @Description = 'Los gnolls son humanoides salvajes que atacan sin previo aviso asentamientos en las fronteras de la civilización, asesinando a sus víctimas y devorando su carne.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 12,
    @MaxHealth = 17,
    @DamageMod = 0,  -- Fuerza
    @Abilities = N'2,1,0,-2,0,-2',
    @Attacks = N'7,14';

EXEC SP_InsertCreature
    @Name = 'Goblin',
    @Description = 'Los goblins son pequeños humanoides, egoístas y de negro corazón, que habitan en cavernas, minas abandonadas, mazmorras saqueadas y otros lugares lúgubres.',
    @Rating = 1,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 11,
    @MaxHealth = 12,
    @DamageMod = 1, -- Destreza
    @Abilities = N'-1,2,0,0,-1,-1',
    @Attacks = N'15,16'; -- Cimitarra y Arco Corto

EXEC SP_InsertCreature
    @Name = 'Golem de Piedra',
    @Description = 'Los gólems de piedra existen en múltiples formas, pero siempre tallados en roca como altas e impresionantes estatuas. Aunque la mayoría tienen rasgos humanoides, los gólems de piedra pueden estar tallados de cualquier manera que quien los esculpe decida.',
    @Rating = 7,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 48,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'3,-1,4,-4,0,-4',
    @Attacks = N'5,1'; -- Piedra y Garrote

EXEC SP_InsertCreature
    @Name = 'Grifo',
    @Description = 'Los grifos son feroces aves carnívoras con los musculosos cuerpos de un león y las cabezas, patas delanteras y alas de un águila. Cuando atacan, son ágiles y letales como águilas, pero luchan con el poder y la gracilidad de un león.',
    @Rating = 4,
    @Experience = 7,
    @Proficiency = 3,
    @ArmorClass = 13,
    @MaxHealth = 22,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'2,3,2,-2,1,-1',
    @Attacks = N'0,7'; -- Garras y Mordisco

EXEC SP_InsertCreature
    @Name = 'Kobold',
    @Description = 'Los kobolds son humanoides reptilianos sumamente cobardes, que adoran a los dragones malvados como semidioses y los sirven como esbirros. Habitan en las guaridas de los dragones siempre que pueden, pero lo más normal es que moren en mazmorras donde acumulan los tesoros y bagatelas que conforman sus pequeñas fortunas.',
    @Rating = 2,
    @Experience = 7,
    @Proficiency = 1,
    @ArmorClass = 13,
    @MaxHealth = 15,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'0,2,0,-2,-1,-2',
    @Attacks = N'17,0'; -- Daga y Garras

EXEC SP_InsertCreature
    @Name = 'Hombre Lobo',
    @Description = 'Los hombres lobos son depredadores salvajes. En su forma de humanoide, estas criaturas poseen sentidos muy agudos, un temperamento fuerte y la tendencia a comer carne muy poco hecha. Pero su forma híbrida se compone de un musculoso cuerpo similar al de un humanoide rematado con la cabeza de un lobo enloquecido.',
    @Rating = 8,
    @Experience = 7,
    @Proficiency = 5,
    @ArmorClass = 14,
    @MaxHealth = 52,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'2,3,1,0,0,0',
    @Attacks = N'0,7'; -- Garras y Mordisco

EXEC SP_InsertCreature
    @Name = 'Pesadilla',
    @Description = 'Las pesadillas aparecen rodeadas de una nube de humo, con su crin, cola y pezuñas envueltas en llamas. La espeluznante y oscura forma de estos seres se mueve con una velocidad sobrenatural, desapareciendo en una nube de azufre tan rápidamente cómo apareció.',
    @Rating = 16,
    @Experience = 7,
    @Proficiency = 11,
    @ArmorClass = 19,
    @MaxHealth = 80,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'4,3,3,1,2,2',
    @Attacks = N'18,19,20'; -- Galope Flamígero, Pezuña y Embestida

EXEC SP_InsertCreature
    @Name = 'Vampiro',
    @Description = 'Despertados a una noche eterna y ansiando la vida que han perdido, los vampiros se sacian bebiendo la sangre de los vivos. Odian la luz solar, ya que esta les quema.',
    @Rating = 12,
    @Experience = 7,
    @Proficiency = 9,
    @ArmorClass = 16,
    @MaxHealth = 68,
    @DamageMod = 0, -- Fuerza
    @Abilities = N'3,3,2,1,2,2',
    @Attacks = N'0,7'; -- Garras y Mordisco

--+-- CHARACTERS --+--
--Esto es un ejemplo de personaje nuevo, no hace falta Execute
--EXEC SP_InsertNewCharacter 
--    @ID_User = 1,
--    @Sex = 1,
--    @ID_Race = 1,
--    @ID_Class = 1,
--    @ID_Background = 1,
--    @_Name = 'John Doe',
--    @Abilities = '14,12,10,8,16,10';

SELECT * FROM Characters

---Buscador de Caracteríscas
SELECT * FROM Abilities
---Buscador de Habilidades
SELECT * FROM Skills
---Buscador de Razas
SELECT * FROM Races
---Buscador de Clases
SELECT * FROM Classes
---Buscador de Trasfondo
SELECT * FROM Backgrounds
---Buscador de Tipos de Daño
SELECT * FROM DamageType
---Buscador de Ataques
SELECT * FROM Attacks

---Buscador de Armas
EXEC SP_GetWeapons
---Buscador de Armaduras y Escudos
EXEC SP_GetArmorsShields
---Buscador de Consumibles
EXEC SP_GetConsumables
---Buscador de Genéricos
EXEC SP_GetCharacterAbilities @ID_Character = 0
	




-----Esto por el momento son pruebas, no prestar atencion
---Buscador de criaturas
--SELECT * FROM Creatures
--SELECT * FROM AttacksXCreature
--SELECT * FROM AbilitiesXCreatures
--SELECT * FROM Attacks
--SELECT * FROM Abilities


--SELECT 
--    C.ID_Creature,
--    C._Name,
--    Abilities.Abilities,
--    Attacks.Attacks
--FROM 
--    Creatures C
--INNER JOIN (
--    SELECT 
--        AC.ID_Creature,
--        STRING_AGG(A._Name + ': ' + CAST(AC.Modifier AS NVARCHAR(10)), ', ') AS Abilities
--    FROM 
--        AbilitiesXcreatures AC
--    INNER JOIN 
--        Abilities A ON AC.ID_Ability = A.ID_Ability
--    GROUP BY 
--        AC.ID_Creature
--) Abilities ON C.ID_Creature = Abilities.ID_Creature
--LEFT JOIN (
--    SELECT 
--        AXC.ID_Creature,
--        STRING_AGG(ATK._Name, ', ') AS Attacks
--    FROM 
--        AttacksXCreature AXC
--    INNER JOIN 
--        Attacks ATK ON AXC.ID_Attack = ATK.ID_Attack
--    GROUP BY 
--        AXC.ID_Creature
--) Attacks ON C.ID_Creature = Attacks.ID_Creature;