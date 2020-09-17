import 'package:flutter/material.dart';

class DietFoodDetailCard extends StatelessWidget {
  DietFoodDetailCard({
    this.numerator,
    this.denominator,
    this.startColor,
    this.endColor,
    this.conColor,
    this.titleVar,
    this.valueVar,
    this.unitVar,
  });

  final double numerator;
  final double denominator;
  final Color startColor;
  final Color endColor;
  final Color conColor;
  final String titleVar;
  final String valueVar;
  final String unitVar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width:
              (MediaQuery.of(context).size.width) * (numerator / denominator),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                startColor,
                endColor,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                titleVar,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          width:
              (MediaQuery.of(context).size.width) * (numerator / denominator),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: conColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                valueVar + " " + unitVar,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
