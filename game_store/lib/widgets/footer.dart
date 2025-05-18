import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Divider(color: Colors.white24),
          SizedBox(height: 10),
          Text(' All rights reserved', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
