import 'package:flutter/material.dart';
import 'result_page.dart'; // You’ll create this next

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      final double height = double.parse(_heightController.text);
      final double weight = double.parse(_weightController.text);

      final double bmi = weight / ((height / 100) * (height / 100));

      // Go to Result Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmi: bmi),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Your Height and Weight")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Connects to form state
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Height (cm)"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter height' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Weight (kg)"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter weight' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                 style:ElevatedButton.styleFrom(
              backgroundColor:Colors.green,
              foregroundColor: Colors.brown,
               
             ),
                onPressed: _calculateBMI,
                child: const Text("Calculate BMI"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
