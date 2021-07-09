import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

class ResultArguments {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultArguments({
    this.bmiResult,
    this.resultText,
    this.interpretation,
  });
}

class ResultsPage extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ResultArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    args.resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    args.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    args.interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            flex: 5,
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
