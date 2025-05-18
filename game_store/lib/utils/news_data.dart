class NewsItem {
  final String title;
  final String description;
  final String imagePath;

  NewsItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<NewsItem> newsList = [
  NewsItem(
    title: 'Fortnite Mega Giveaway!',
    description:
        'Get free skins and V-Bucks with our summer giveaway. Ends July 1st!',
    imagePath: 'assets/news1.jpeg',
  ),
  NewsItem(
    title: 'Cyberpunk 2077 Patch 2.0 Released',
    description:
        'Major performance and graphics update available now for all players.',
    imagePath: 'assets/news2.jpeg',
  ),
  NewsItem(
    title: 'The Witcher 3 Free Next-Gen Update',
    description:
        'Enjoy ray tracing and new quests in this free next-gen upgrade.',
    imagePath: 'assets/news3.jpeg',
  ),
  NewsItem(
    title: ' Games Free Game of the Week: Control',
    description:
        'Claim Control for free this week only! Limited-time offer ends Sunday.',
    imagePath: 'assets/news4.jpeg',
  ),
  NewsItem(
    title: 'Upcoming: Starfield Launches September 2025',
    description:
        'Bethesda’s new space RPG is set to redefine sci-fi exploration.',
    imagePath: 'assets/news5.jpeg',
  ),
  NewsItem(
    title: 'Pre-Orders Open for Hollow Knight: Silksong',
    description:
        'Get ready for the sequel to one of the best Metroidvania games.',
    imagePath: 'assets/news6.jpeg',
  ),
  NewsItem(
    title: 'Free Game Alert: Tomb Raider Trilogy',
    description: 'Claim the full Tomb Raider trilogy for free until June 30.',
    imagePath: 'assets/news7.jpeg',
  ),
  NewsItem(
    title: 'Avowed Releases Q1 2026',
    description:
        'Obsidian’s next RPG adventure enters the fantasy arena with spell-slinging combat.',
    imagePath: 'assets/news8.jpeg',
  ),
];
