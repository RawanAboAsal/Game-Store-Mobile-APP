import 'package:flutter/material.dart';
import '../models/game.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage(this.game);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child:
            isWide
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildMainContent(context)),
                    SizedBox(width: 20),
                    Expanded(flex: 1, child: _buildSidebar(context)),
                  ],
                )
                : Column(
                  children: [
                    _buildMainContent(context),
                    SizedBox(height: 30),
                    _buildSidebar(context),
                  ],
                ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          game.title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            Text(
              " ${game.rating.toStringAsFixed(1)}  ",
              style: TextStyle(fontSize: 16),
            ),
            Chip(label: Text("Action")),
            SizedBox(width: 6),
            Chip(label: Text("Shooter")),
          ],
        ),
        SizedBox(height: 20),

        // Main banner image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(game.imagePath, height: 250, fit: BoxFit.cover),
        ),
        SizedBox(height: 12),

        // Thumbnail gallery (mocked with repeated images)
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(width: 8),
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  game.imagePath,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),

        SizedBox(height: 20),

        Text(
          game.fullDescription,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),

        SizedBox(height: 20),
        Wrap(
          spacing: 8,
          children: [
            Chip(label: Text("Competitive")),
            Chip(label: Text("Multiplayer")),
          ],
        ),
        SizedBox(height: 30),

        Text(
          "DEFY THE LIMITS FOR FREE IN ${game.title.toUpperCase()}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          "More than guns and bullets, choose an Agent armed with adaptive skills and sharp reflexes. "
          "Make the plays others will imitate for years.",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 30),

        Divider(color: Colors.white24),
        SizedBox(height: 10),

        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 6),
            Text(" Player Ratings", style: TextStyle(fontSize: 16)),
            Spacer(),
            Text(
              "${game.rating.toStringAsFixed(1)} ★",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset(game.imagePath, height: 120)),
        SizedBox(height: 12),

        Text(
          game.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          game.price,
          style: TextStyle(fontSize: 18, color: Colors.greenAccent),
        ),
        SizedBox(height: 10),

        ElevatedButton(onPressed: () {}, child: Text("Get")),
        SizedBox(height: 8),
        OutlinedButton(onPressed: () {}, child: Text("Add to Cart")),
        SizedBox(height: 8),
        OutlinedButton(onPressed: () {}, child: Text("Add to Wishlist")),
        Divider(height: 30, color: Colors.white24),

        _infoRow("Developer", game.developer),
        _infoRow("Publisher", game.developer),
        _infoRow("Release", game.releaseDate),
        _infoRow("Genre", game.genre),
        _infoRow("Platform", "PC"),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
            IconButton(icon: Icon(Icons.flag), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(color: Colors.grey))),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
