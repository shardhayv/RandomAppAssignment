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
  List<Widget> scoreRight = [];
  List<Widget> scoreLeft = [];

  int roundsNumber = 10;
  int leftDiceNumber = 0;
  int rightDiceNumber = 0;
  int? randomNumber;
  int tapCounter = 0;

  void resetButton() {
    setState(() {
      selectedSide;
      scoreRight = [];
      scoreLeft = [];

      roundsNumber = 10;
      leftDiceNumber = 0;
      rightDiceNumber = 0;
      randomNumber;
      tapCounter = 0;
    });
  }

  void rollDice() async {
    leftDiceNumber = Random().nextInt(100);
    rightDiceNumber = Random().nextInt(100);
    randomNumber = checkDiceNumbers(leftDiceNumber, rightDiceNumber);
  }

  int? checkDiceNumbers(int leftDiceNum, int rightDiceNum) {
    if (leftDiceNum == rightDiceNum) {
      int randomNum = Random().nextInt(100);

      return randomNum;
    } else {
      return null;
    }
  }

  void addingRight() {
    scoreRight.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void addingLeft() {
    scoreLeft.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void handleTap() {
    if (tapCounter >= roundsNumber) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content:
                const Text('You have exceeded the maximum number of rounds'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  tapCounter = 0;
                  selectedSide = null;
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    } else {
      setState(() {
        if (selectedSide == Side.right) {
          rollDice();
        } else if (selectedSide == Side.left) {
          rollDice();
        } else {
          rollDice();
        }
        tapCounter++;
      });
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
                        handleTap();
                        selectedSide = Side.right;
                        addingRight();

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
                        handleTap();
                        selectedSide = Side.left;
                        addingLeft();
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
                      max: 15.0,

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
                        const Text(
                          textAlign: TextAlign.justify,
                          'Right Selected Value',
                          style: kResultText,
                        ),
                        Row(
                          children: scoreRight,
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          'Left Selected Value',
                          style: kResultText,
                        ),
                        Row(
                          children: scoreLeft,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'RESET',
            onTap: () {
              resetButton();
            },
          )
        ],
      ),
    );
  }
}
