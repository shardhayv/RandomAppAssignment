import 'package:flutter/cupertino.dart';

import '../constants.dart';

class CardData extends StatelessWidget {
  const CardData({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kNumberLabelStyle,
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
