import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDFCF4), // Light cream shade
              Color(0xFFFFF7F0), // Slightly darker cream shade
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B5249), // Dark green shade
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 32),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Color(0xFF3B5249),
                  ),
                  prefixIcon:
                      Icon(Icons.email_outlined, color: Color(0xFF3B5249)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B5249)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B5249)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color(0xFF3B5249),
                  ),
                  prefixIcon:
                      Icon(Icons.lock_outline, color: Color(0xFF3B5249)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B5249)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3B5249)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFF3B5249),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Login button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE28067), // Orange button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                    assetPath: 'assets/Social_Icons_facebook.png',
                    color: Colors.white,
                    onPressed: () {
                      print("Facebook login clicked!");
                    },
                  ),
                  SocialButton(
                    assetPath: 'assets/Social_Icons_google.png',
                    // Use an asset image for Google
                    color: Colors.white,
                    // Default background color
                    onPressed: () {
                      print("Google login clicked!");
                    },
                  ),
                  SocialButton(
                    assetPath: 'assets/Social_Icons_apple.png',
                    color: Colors.white,
                    onPressed: () {
                      print("Apple login clicked!");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New to Aakrosh? "),
                  TextButton(
                    onPressed: () {
                      // Sign up action
                    },
                    child: const Text(
                      "Sign up Now",
                      style: TextStyle(color: Color(0xFFE28067)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final String? assetPath; // New parameter for asset image
  final VoidCallback onPressed; // Added onPressed callback

  const SocialButton({
    super.key,
    this.icon,
    required this.color,
    this.assetPath, // Accept assetPath for image
    required this.onPressed, // Accept onPressed callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the onPressed action
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: assetPath != null
            ? Image.asset(assetPath!) // If assetPath is provided, use image
            : Icon(icon, color: Colors.white), // Otherwise, use icon
      ),
    );
  }
}
