import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  FoodCard(
      {this.title,
      this.breakfastList,
      this.startColor,
      this.endColor,
      this.breakfastKcal});

  final String title;
  final ListView breakfastList;
  final Color startColor;
  final Color endColor;
  final String breakfastKcal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 1.8,
            //spreadRadius: 3.0,
          ),
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            startColor,
            endColor,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          //Placeholder(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              breakfastKcal,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
