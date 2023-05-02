import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(const RandomGenerator());

class RandomGenerator extends StatelessWidget {
  const RandomGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xff090C22),
          scaffoldBackgroundColor: const Color(0xff060A1A)),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
      },
    );
  }
}
