import 'package:flutter/material.dart';

import './views/dashboard_view.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xff090C22),
          scaffoldBackgroundColor: const Color(0xff060A1A)),
      home: const RandomGenerator(),
    );
  }
}
