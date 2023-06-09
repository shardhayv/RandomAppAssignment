import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: cardChild,
    );
  }
}
