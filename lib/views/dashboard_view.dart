import 'package:flutter/material.dart';
import 'package:randomapp/views/card_view.dart';

class RandomGenerator extends StatefulWidget {
  const RandomGenerator({super.key});

  @override
  State<RandomGenerator> createState() => _RandomGeneratorState();
}

class _RandomGeneratorState extends State<RandomGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Generator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: const ReusableCard(
                      colour: Color(0xff121A15),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: const ReusableCard(
                      colour: Color(0xff121A15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xff121A15),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: const [
                  Text('Correct Result'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
