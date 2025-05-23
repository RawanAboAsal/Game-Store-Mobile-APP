import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedCountry = 'Egypt';
  bool _isOver13 = false;
  bool _isLoading = false;
  String? _errorMessage;

  List<String> countries = ['Egypt', 'USA', 'UK', 'Canada'];

  void _submitForm() {
    setState(() => _errorMessage = null);

    if (_formKey.currentState!.validate()) {
      if (!_isOver13) {
        setState(
          () => _errorMessage = 'You must confirm that you are 13 or older.',
        );
        return;
      }

      setState(() => _isLoading = true);

      Future.delayed(Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registered successfully!')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("signin_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Semi-transparent black overlay
          Container(color: Colors.black.withOpacity(0.7)),

          // Content
          Column(
            children: [
              NavBar(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 40,
                        ),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 400,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CREATE YOUR ACCOUNT',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(height: 24),

                                _buildInputField(
                                  'Email Address',
                                  _emailController,
                                ),
                                SizedBox(height: 16),

                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  decoration: _inputDecoration(
                                    'Password',
                                  ).copyWith(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white70,
                                      ),
                                      onPressed:
                                          () => setState(
                                            () =>
                                                _obscurePassword =
                                                    !_obscurePassword,
                                          ),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                  validator:
                                      (value) =>
                                          value == null || value.isEmpty
                                              ? 'Enter your password'
                                              : null,
                                ),

                                SizedBox(height: 16),

                                DropdownButtonFormField<String>(
                                  value: _selectedCountry,
                                  dropdownColor: Colors.black87,
                                  items:
                                      countries.map((c) {
                                        return DropdownMenuItem(
                                          value: c,
                                          child: Text(
                                            c,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged:
                                      (val) => setState(
                                        () => _selectedCountry = val!,
                                      ),
                                  decoration: _inputDecoration(
                                    'Country of Residence',
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 16),

                                // Checkbox
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isOver13,
                                      onChanged:
                                          (val) => setState(
                                            () => _isOver13 = val ?? false,
                                          ),
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'I am 13 years of age or older and agree to the terms',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                if (_errorMessage != null)
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      _errorMessage!,
                                      style: TextStyle(color: Colors.redAccent),
                                    ),
                                  ),
                                SizedBox(height: 16),

                                _isLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ElevatedButton(
                                          onPressed: _submitForm,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueAccent,
                                            minimumSize: Size.fromHeight(45),
                                          ),
                                          child: Text("Continue"),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Already have an account? ",
                                              style: TextStyle(
                                                color: Colors.white70,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/signin',
                                                );
                                              },
                                              child: Text(
                                                "Sign in",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField _buildInputField(
    String label,
    TextEditingController controller, {
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(label),
      style: TextStyle(color: Colors.white),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) return '$label is required.';
            return null;
          },
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.black54,
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }
}
