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
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _controller = TextEditingController();
  final String apiKey = ''; //  Replace by OpenWeatherMap API Key

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
            title: Text('Weather in $city'),
            content: Text('Temperature: $temp°C\nDescription: $desc'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        );
      } else {
        showError("Country not found or error fetching data.");
      }
    } catch (e) {
      showError("Something went wrong. Please try again.");
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Country or City',
                border: OutlineInputBorder(),
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
              child: const Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}


