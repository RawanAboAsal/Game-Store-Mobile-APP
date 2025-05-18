import 'package:flutter/material.dart';
import '../utils/mock_data.dart';

class FeaturedCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: PageView.builder(
        itemCount: mockGames.length,
        itemBuilder: (context, index) {
          final game = mockGames[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(game.imagePath, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
