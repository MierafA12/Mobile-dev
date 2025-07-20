import 'package:flutter/material.dart';
import 'Screens/welcome_page.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body mass index calculater',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WelcomePage(),
    );
  }
}



// home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Let\'s calculate your BMI and know your status'),
//           backgroundColor: Colors.purple,
//         ),
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/think.png',
//                   width: 150,
//                   height: 150,
//                 ),
//                 const Text('Text 1'),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/think.png',
//                   width: 150,
//                   height: 150,
//                 ),
//                 const Text('Text 2'),
//               ],
//             ),
//           ],
//         ),
//       ),