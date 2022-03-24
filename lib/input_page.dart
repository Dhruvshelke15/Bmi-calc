import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuse_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_icon.dart';
import 'calculate_brain.dart';


enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCard = kInactiveCard;
  Color femaleCard = kInactiveCard;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male ? kActiveCard : kInactiveCard,
              cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),),),
              Expanded(child: ReuseCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? kActiveCard: kInactiveCard,
              cardChild: IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),),),
            ],
          )),
          Expanded(
            child: ReuseCard(
              color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT', style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kFontStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseCard(color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('WEIGHT', style: kLabelTextStyle,),
                  Text(
                    weight.toString(),
                    style: kFontStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            if (weight != 0){
                              weight--;
                            }
                            else {
                            }
                          });
                        },
                        icon: FontAwesomeIcons.minus,
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        icon: FontAwesomeIcons.plus,
                      ),
                    ],
                  ),
                ],
              ),
              ),),
              Expanded(child: ReuseCard(color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AGE', style: kLabelTextStyle,),
                  Text(
                    age.toString(),
                    style: kFontStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            if (age != 0){
                              age--;
                            }
                            else {
                            }
                          });
                        },
                        icon: FontAwesomeIcons.minus,
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        icon: FontAwesomeIcons.plus,
                      ),
                    ],
                  )
                ],
              ),
              ),),
            ],
          )),
          NewBottomButton(buttonTitle: 'CALCULATE', onTap: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultsPage(
                bmiResult: calc.calculateBMI(),
                bmiInterpretation: calc.getInterpretation(),
                resultText: calc.getResult(),
              );
            }));
          },),
        ],
      ),
    );
  }
}