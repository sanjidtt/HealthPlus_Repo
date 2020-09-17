import 'package:flutter/material.dart';

class CylindricalButton extends StatelessWidget {
  CylindricalButton(
      {this.str, this.onTap, this.foodChoiceVar, this.foodChoiceVarFixed});

  final String str;
  final Function onTap;
  final int foodChoiceVar;
  final int foodChoiceVarFixed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        //width: 160,
        height: 30,
        decoration: BoxDecoration(
          color: foodChoiceVar == foodChoiceVarFixed
              ? Color(0XFFF3F3F3)
              : Colors.white,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              str,
              style: TextStyle(
                color: foodChoiceVar == foodChoiceVarFixed
                    ? Colors.black
                    : Colors.black26,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
