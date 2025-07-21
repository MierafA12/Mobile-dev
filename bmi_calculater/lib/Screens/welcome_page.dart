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
              'assets/images/bmi2.webp',
              width: 300,
              height: 300,
            ),

            const SizedBox(height: 20),
            // ✅ Welcome Text
            const Text(
              "Calculate your BMI and know your health!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24,color: Colors.green),
            ),

            const SizedBox(height: 30),          
            // ✅ Start Button
            ElevatedButton(
             style:ElevatedButton.styleFrom(
              backgroundColor:Colors.green,
              foregroundColor: Colors.brown,
               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
             ),

              onPressed: () {   
                Navigator.push(
                  context,     
                  MaterialPageRoute(builder: (context) => const InputPage()),
                );
              },
              child: const Text("Start",style: TextStyle(fontSize: 20), ),
            ),
          ],
        ),
      ),
    );
  }
}
