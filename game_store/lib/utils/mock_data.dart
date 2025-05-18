import '../models/game.dart';

final List<Game> mockGames = [
  Game(
    title: 'Fortnite',
    imagePath: 'assets/fortnite.jpeg',
    description: 'Battle Royale shooter.',
    fullDescription:
        'Fortnite is a free-to-play Battle Royale game where players compete to be the last one standing. Use building mechanics and strategy to survive.',
    price: 'Free',
    releaseDate: '2017-07-25',
    genre: 'Battle Royale',
    developer: 'Games',
    rating: 4.6,
  ),
  Game(
    title: 'GTA V',
    imagePath: 'assets/gta_v.jpeg',
    description: 'Action-packed open world.',
    fullDescription:
        'Experience the sprawling city of Los Santos in Grand Theft Auto V, a blend of storytelling and chaos with missions, vehicles, and freedom.',
    price: '\$29.99',
    releaseDate: '2013-09-17',
    genre: 'Action, Adventure',
    developer: 'Rockstar Games',
    rating: 4.8,
  ),
  Game(
    title: 'Rocket League',
    imagePath: 'assets/rocket_league.jpeg',
    description: 'Soccer with cars!',
    fullDescription:
        'Rocket League is a high-octane blend of arcade soccer and vehicular mayhem. Drive, flip, and boost your way to victory in online matches.',
    price: 'Free',
    releaseDate: '2015-07-07',
    genre: 'Sports, Racing',
    developer: 'Psyonix',
    rating: 4.3,
  ),
  Game(
    title: 'Valorant',
    imagePath: 'assets/valorant.jpeg',
    description: 'Tactical 5v5 shooter from Riot Games.',
    fullDescription:
        'Valorant is a competitive character-based 5v5 shooter. Use unique agent abilities, precise gunplay, and team strategy to dominate opponents.',
    price: 'Free',
    releaseDate: '2020-06-02',
    genre: 'Shooter, Tactical',
    developer: 'Riot Games',
    rating: 4.5,
  ),
  Game(
    title: 'The Witcher 3',
    imagePath: 'assets/witcher3.jpeg',
    description: 'Story-rich RPG with a massive open world.',
    fullDescription:
        'Play as Geralt of Rivia, a monster hunter for hire, and explore a war-torn fantasy world full of choices, consequences, and powerful magic.',
    price: '\$19.99',
    releaseDate: '2015-05-18',
    genre: 'RPG, Open World',
    developer: 'CD Projekt Red',
    rating: 4.9,
  ),
  Game(
    title: 'Cyberpunk 2077',
    imagePath: 'assets/cyberpunk2077.jpeg',
    description: 'Futuristic open-world RPG in Night City.',
    fullDescription:
        'Customize your character and make impactful decisions in a dystopian open world filled with cyber-enhanced combat, hacking, and driving.',
    price: '\$29.99',
    releaseDate: '2020-12-10',
    genre: 'Action, RPG',
    developer: 'CD Projekt Red',
    rating: 4.2,
  ),
  Game(
    title: 'Elden Ring',
    imagePath: 'assets/elden_ring.jpeg',
    description: 'Fantasy open-world action RPG.',
    fullDescription:
        'Explore the Lands Between in an epic RPG adventure created by FromSoftware and George R.R. Martin. Fight, craft, and uncover secrets in a brutal world.',
    price: '\$59.99',
    releaseDate: '2022-02-25',
    genre: 'RPG, Soulslike',
    developer: 'FromSoftware',
    rating: 4.8,
  ),
  Game(
    title: 'Call of Duty: Warzone',
    imagePath: 'assets/warzone.jpeg',
    description: 'Free-to-play battle royale shooter.',
    fullDescription:
        'Warzone delivers an epic combat experience with massive maps, realistic weapon mechanics, squad gameplay, and high-stakes firefights.',
    price: 'Free',
    releaseDate: '2020-03-10',
    genre: 'Shooter, Battle Royale',
    developer: 'Infinity Ward',
    rating: 4.4,
  ),
  Game(
    title: 'Minecraft',
    imagePath: 'assets/minecraft.jpeg',
    description: 'Endless creativity in block worlds.',
    fullDescription:
        'Minecraft is a sandbox game where players can build, explore, and survive in blocky worlds. Craft tools, fight mobs, and shape your world.',
    price: '\$26.95',
    releaseDate: '2011-11-18',
    genre: 'Sandbox, Survival',
    developer: 'Mojang Studios',
    rating: 4.7,
  ),
  Game(
    title: 'Among Us',
    imagePath: 'assets/among_us.jpeg',
    description: 'Social deception in space!',
    fullDescription:
        'Among Us is a party game where crewmates must complete tasks while impostors try to sabotage and eliminate them. Find the impostor!',
    price: '\$4.99',
    releaseDate: '2018-06-15',
    genre: 'Social, Party',
    developer: 'Innersloth',
    rating: 4.1,
  ),
  Game(
    title: 'Red Dead Redemption 2',
    imagePath: 'assets/red_dead2.jpeg',
    description: 'Western action and storytelling.',
    fullDescription:
        'RDR2 is an immersive open-world western filled with narrative, exploration, gunfights, and breathtaking detail. Play as outlaw Arthur Morgan.',
    price: '\$39.99',
    releaseDate: '2018-10-26',
    genre: 'Action, Adventure',
    developer: 'Rockstar Games',
    rating: 4.9,
  ),
  Game(
    title: 'Assassin\'s Creed Valhalla',
    imagePath: 'assets/ac_valhalla.jpeg',
    description: 'Viking open-world action adventure.',
    fullDescription:
        'Live the saga of Eivor, a Viking raider, in an  story of conquest across England. Raid, explore, and grow your settlement in a massive open world.',
    price: '\$59.99',
    releaseDate: '2020-11-10',
    genre: 'Action, RPG',
    developer: 'Ubisoft',
    rating: 4.4,
  ),
];
final List<Game> bestSellers = [
  mockGames[1],
  mockGames[4],
  mockGames[6],
  mockGames[8],
];
final List<Game> trendingGames = [mockGames[0], mockGames[2], mockGames[3]];
final List<Game> upcomingWishlistGames = [
  Game(
    title: 'Starfield',
    imagePath: 'assets/starfield.jpeg',
    description: 'Space exploration and RPG from Bethesda.',
    fullDescription:
        'Embark on a journey through the stars in Bethesda’s new space epic, combining interstellar combat, base-building, and deep RPG systems.',
    price: 'Coming Soon',
    releaseDate: '2025-09-15',
    genre: 'RPG, Sci-Fi',
    developer: 'Bethesda Game Studios',
    rating: 0.0,
  ),
  Game(
    title: 'Avowed',
    imagePath: 'assets/avowed.jpeg',
    description: 'Magic and melee in a fantasy realm.',
    fullDescription:
        'Avowed is an epic fantasy RPG from Obsidian, featuring spellcasting, exploration, and story-rich decision making in a living world.',
    price: 'Coming Soon',
    releaseDate: '2025-11-22',
    genre: 'Action RPG',
    developer: 'Obsidian Entertainment',
    rating: 0.0,
  ),
  Game(
    title: 'Black Myth: Wukong',
    imagePath: 'assets/wukong.jpeg',
    description: 'Mythical action RPG based on Journey to the West.',
    fullDescription:
        'Black Myth: Wukong is a visually stunning action RPG inspired by Chinese mythology. Battle mythical beasts and explore ancient worlds as the legendary Monkey King.',
    price: 'Coming Soon',
    releaseDate: '2025-08-20',
    genre: 'Action, Soulslike',
    developer: 'Game Science',
    rating: 0.0,
  ),
];
