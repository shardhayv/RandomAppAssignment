import 'dart:math';

import 'package:flutter/material.dart';

import '../components/button_page_view.dart';
import '../components/card_view.dart';
import '../components/dice_view.dart';
import '../constants.dart';

enum Side { right, left }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Side? selectedSide;

  int roundsNumber = 10;
  int leftDiceNumber = 0;
  int rightDiceNumber = 0;
  int? randomNumber;

  void rollDice() {
    leftDiceNumber = Random().nextInt(100);
    rightDiceNumber = Random().nextInt(100);
    randomNumber = checkDiceNumbers(leftDiceNumber, rightDiceNumber);
  }

  int? checkDiceNumbers(int leftDiceNum, int rightDiceNum) {
    if (leftDiceNum == rightDiceNum) {
      int randomNum = Random().nextInt(100);
      print(
          'Left and right dice numbers are the same. Random number generated: $randomNum');
      return randomNum;
    } else {
      print('Left and right dice numbers are not the same.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RANDOM NUMBER GENERATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSide = Side.right;
                        rollDice();
                      });
                    },
                    child: ReusableCard(
                      cardChild: CardData(
                        label: rightDiceNumber.toString(),
                      ),
                      colour: selectedSide == Side.right
                          ? kActiveCardCOlour
                          : kCardColour,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSide = Side.left;
                        rollDice();
                      });
                    },
                    child: ReusableCard(
                      cardChild: CardData(
                        label: leftDiceNumber.toString(),
                      ),
                      colour: selectedSide == Side.left
                          ? kActiveCardCOlour
                          : kCardColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Slide the number of rounds you want to play.',
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        roundsNumber.toString(),
                        style: kNumberLabelStyle,
                      ),
                      const Text(
                        'rounds',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kActiveTrackColour,
                        thumbColor: kThumbColour,
                        overlayColor: kOverlayColour,
                        inactiveTrackColor: kInactiveTrackColour,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: roundsNumber.toDouble(),
                      min: 5.0,
                      max: 20.0,

                      // activeColor: Colors.amber,
                      onChanged: (double newValue) {
                        setState(() {
                          roundsNumber = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ReusableCard(
                    colour: kAppCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Results',
                          style: kTitleText,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          'Right Greater Value : $rightDiceNumber',
                          style: kResultText,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Left Greater Value : $leftDiceNumber',
                          style: kResultText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
