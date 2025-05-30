import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Payment UI',
      theme: ThemeData.dark(), // optional: apply dark theme
      home: Scaffold(
        body: SafeArea(child: CardPaymentForm()),
      ),
    );
  }
}

class CardPaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        padding: const EdgeInsets.all(24.0),
        color: Colors.black, // black background
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text('Card Payment',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),

            // Card label and icon
            Row(
              children: [
                Icon(Icons.credit_card, size: 24, color: Colors.white),
                SizedBox(width: 10),
                Text("Card",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
              ],
            ),
            SizedBox(height: 30),

            // Card Number
            _buildInputField(
              label: 'Card Number',
              hint: '1234 5678 9012 3456',
              icon: Icons.credit_card,
            ),
            SizedBox(height: 16),

            // Expiry and CVV
            Row(
              children: [
                Expanded(
                  child: _buildInputField(label: 'MM/YY', hint: '08/27'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildInputField(label: 'CVV', hint: '123', obscure: true),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Card Holder Name
            _buildInputField(label: 'Card Holder Name', hint: 'Full name on card'),
            SizedBox(height: 30),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // white button
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Pay',
                    style: TextStyle(fontSize: 18, color: Colors.black)), // black text
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    IconData? icon,
    bool obscure = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white60),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType:
      obscure ? TextInputType.number : TextInputType.text,
      obscureText: obscure,
    );
  }
}
