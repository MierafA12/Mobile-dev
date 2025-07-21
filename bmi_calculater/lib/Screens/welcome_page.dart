import 'package:flutter/material.dart';
import 'input_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Optional: background color
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Image
              Image.asset(
                'assets/images/bmi2.webp',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 20),

              // ✅ Welcome Text
              const Text(
                "Calculate your BMI\nand know your health!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 30),

              // ✅ Start Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InputPage()),
                    );
                  },
                  child: const Text("Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
