import 'package:flutter/material.dart';
import '../models/game.dart';
import '../widgets/sidebar.dart';
import '../widgets/nav_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/game_card.dart';
import '../widgets/footer.dart';
import '../utils/mock_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Sidebar(),

          // Main content
          Expanded(
            child: Column(
              children: [
                // Top nav bar
                NavBar(),

                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: SearchBarWidget(),
                ),

                // Scrollable content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 20),
                    children: [
                      // Hero banner image
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/1.jpeg',
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Top Games
                      _buildSectionTitle('Top Games'),
                      _buildGameGrid(mockGames),

                      // Best Sellers
                      _buildSectionTitle('Best Sellers'),
                      _buildGameGrid(bestSellers),

                      // Trending Games
                      _buildSectionTitle('Trending Games'),
                      _buildGameGrid(trendingGames),

                      // Top Upcoming Wishlist
                      _buildSectionTitle('Top Upcoming Wishlist'),
                      _buildUpcomingWishlistList(upcomingWishlistGames),

                      // Footer
                      Footer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Section title widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Grid-style game cards
  Widget _buildGameGrid(List<Game> games) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: games.map((game) => GameCard(game)).toList(),
      ),
    );
  }

  // News-style layout for upcoming games
  Widget _buildUpcomingWishlistList(List<Game> games) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: games.map((game) => _buildUpcomingCard(game)).toList(),
      ),
    );
  }

  // Individual row-style card
  Widget _buildUpcomingCard(Game game) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Image on left
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              game.imagePath,
              width: 150,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          // Text on right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Release Date: ${game.releaseDate}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                  ),
                  SizedBox(height: 6),
                  Text(
                    game.description,
                    style: TextStyle(color: Colors.grey[300], fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
