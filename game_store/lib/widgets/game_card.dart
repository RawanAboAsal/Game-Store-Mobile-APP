import 'package:flutter/material.dart';
import '../models/game.dart';
import '../views/game_details_page.dart';

class GameCard extends StatefulWidget {
  final Game game;
  GameCard(this.game);

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool hovered = false;

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.game.title} added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isUpcoming = widget.game.price.toLowerCase().contains('coming');

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GameDetailsPage(widget.game)),
            ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 180,
          height: isUpcoming ? 260 : 300, // Shorter card if no button
          decoration: BoxDecoration(
            color: hovered ? Colors.grey[800] : Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            boxShadow:
                hovered
                    ? [BoxShadow(color: Colors.white24, blurRadius: 10)]
                    : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Game image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  widget.game.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Game details and (optional) button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.game.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.game.price,
                      style: TextStyle(color: Colors.greenAccent, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          widget.game.rating.toStringAsFixed(1),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    if (!isUpcoming) ...[
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: _addToCart,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
