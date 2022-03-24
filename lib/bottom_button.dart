import 'package:flutter/material.dart';
import 'constants.dart';


class NewBottomButton extends StatelessWidget {
  NewBottomButton({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButtonStyle,)),
        color: kBottomContColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomCont,
      ),
    );
  }
}