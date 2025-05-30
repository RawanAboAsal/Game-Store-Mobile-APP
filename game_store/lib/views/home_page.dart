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
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 16), // <-- Added vertical space here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SearchBarWidget(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
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
                  _buildSectionTitle('Top Games'),
                  _buildGameGrid(mockGames),
                  _buildSectionTitle('Best Sellers'),
                  _buildGameGrid(bestSellers),
                  _buildSectionTitle('Trending Games'),
                  _buildGameGrid(trendingGames),
                  _buildSectionTitle('Top Upcoming Wishlist'),
                  _buildUpcomingWishlistList(upcomingWishlistGames),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildGameGrid(List<Game> games) {
    return Column(
      children: games.map((game) => _buildUpcomingCard(game)).toList(),
    );
  }

  Widget _buildUpcomingWishlistList(List<Game> games) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: games.map((game) => _buildUpcomingCard(game)).toList(),
      ),
    );
  }

  Widget _buildUpcomingCard(Game game) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700,
        ), // max card width, adjust as needed
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ), // margins around card
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.asset(
                game.imagePath,
                width: 200, // increased width for bigger image
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, // a bit bigger text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Release Date: ${game.releaseDate}',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      game.description,
                      style: TextStyle(color: Colors.grey[300], fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
