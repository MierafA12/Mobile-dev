import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  final String apiKey = 'YOUR_API_KEY_HERE'; // Replace with your OpenWeatherMap API Key

  Future<void> fetchWeather(String country) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$country&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final temp = data['main']['temp'];
        final desc = data['weather'][0]['description'];
        final city = data['name'];

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.lightBlue[50],
            title: Text('Weather in $city'),
            content: Text('🌡 Temperature: $temp°C\n☁ Description: $desc'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        );
      } else {
        showError("❌ Country not found.");
      }
    } catch (e) {
      showError("⚠️ Error fetching weather. Check your connection.");
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.red[50],
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcceeff), // Light sky blue
      appBar: AppBar(
        title: const Text('☀️ Simple Weather App'),
        backgroundColor: const Color(0xff87ceeb), // Sky blue
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Country or City',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'e.g. Ethiopia, London',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.location_on_outlined),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final input = _controller.text.trim();
                  if (input.isNotEmpty) {
                    fetchWeather(input);
                  } else {
                    showError("Please enter a country or city name.");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4fc3f7),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
