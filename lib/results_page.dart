import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reuse_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.bmiInterpretation, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
            style: kTitleStyle,),
          ), ),
          Expanded(
            flex: 5,
            child: ReuseCard(
              color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult,
                    style: kBMI,
                  ),
                  Text(
                      bmiInterpretation,
                    style: kBMItext,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          NewBottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
