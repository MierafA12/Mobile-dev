import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 170;
  double weight = 60;
  String selectedGender = "Male";

  void calculateBMI() {
    final double bmi = weight / ((height / 100) * (height / 100));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔘 Gender Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderCard(
                  gender: "Male",
                  isSelected: selectedGender == "Male",
                  onTap: () => setState(() => selectedGender = "Male"),
                ),
                const SizedBox(width: 20),
                GenderCard(
                  gender: "Female",
                  isSelected: selectedGender == "Female",
                  onTap: () => setState(() => selectedGender = "Female"),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 📏 Height Slider
            Text("Height: ${height.toStringAsFixed(0)} cm",
                style: const TextStyle(fontSize: 20)),
            Slider(
              value: height,
              min: 100,
              max: 220,
              divisions: 120,
              label: height.toStringAsFixed(0),
              activeColor: Colors.green,
              onChanged: (value) => setState(() => height = value),
            ),
            const SizedBox(height: 30),

            // ⚖️ Weight Slider
            Text("Weight: ${weight.toStringAsFixed(0)} kg",
                style: const TextStyle(fontSize: 20)),
            Slider(
              value: weight,
              min: 30,
              max: 200,
              divisions: 170,
              label: weight.toStringAsFixed(0),
              activeColor: Colors.green,
              onChanged: (value) => setState(() => weight = value),
            ),
            const SizedBox(height: 40),

            // ✅ Calculate Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: calculateBMI,
              child: const Text("Calculate BMI", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
