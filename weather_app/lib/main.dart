import 'package:flutter/material.dart';

void main(){
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner:false 
    );
  }

}