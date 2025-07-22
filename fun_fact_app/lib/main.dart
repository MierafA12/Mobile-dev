import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const FunFactApp());
}

class FunFactApp extends StatelessWidget {
  const FunFactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun Fact Generator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const FunFactPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FunFactPage extends StatefulWidget {
  const FunFactPage({super.key});

  @override
  State<FunFactPage> createState() => _FunFactPageState();
}

class _FunFactPageState extends State<FunFactPage> {
  final List<String> _funFacts = [
    "Bananas are berries, but strawberries aren’t!",
    "A day on Venus is longer than a year on Venus.",
    "Honey never spoils — archaeologists found edible honey in ancient tombs!",
    "Octopuses have three hearts and blue blood.",
    "Sloths can hold their breath longer than dolphins.",
    "There are more stars in the universe than grains of sand on Earth.",
    "Wombat poop is cube-shaped.",
    "You can’t hum while holding your nose.",
    "Sharks existed before trees!",
    "A group of flamingos is called a 'flamboyance'.",
  ];

  String _currentFact = "Press the button to get a fun fact!";

  void _generateRandomFact() {
    final random = Random();
    final fact = _funFacts[random.nextInt(_funFacts.length)];
    setState(() {
      _currentFact = fact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Fun Fact Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                shadowColor: Colors.tealAccent,
                color: Colors.teal[50],
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    _currentFact,
                    style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text("New Fact"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.teal,
                ),
                onPressed: _generateRandomFact,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
