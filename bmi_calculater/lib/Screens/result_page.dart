import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  const ResultPage({super.key, required this.bmi});

  String getBMICategory() {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color getCategoryColor() {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final category = getBMICategory();
    final color = getCategoryColor();

    return Scaffold(
      appBar: AppBar(title: const Text("Your BMI Result")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your BMI is:",
                style: TextStyle(fontSize: 22, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                category,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Calculate Again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
