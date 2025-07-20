import 'package:flutter/material.dart';
import './input_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Image
            Image.asset(
              'assets/images/think.png',
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 20),

            // ✅ Welcome Text
            const Text(
              "Calculate your BMI and know your health!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 30),

            // ✅ Start Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputPage()),
                );
              },
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
