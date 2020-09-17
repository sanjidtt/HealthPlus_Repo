import 'package:flutter/material.dart';

import 'food_card.dart';

class DietLowerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width) * (3 / 38),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (29 / 95),
          child: FoodCard(
            startColor: Color(0XFFF6767E),
            endColor: Color(0XFFF9AF93),
            title: 'Breakfast',
            breakfastKcal: '625',
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (3 / 38),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (29 / 95),
          child: FoodCard(
            startColor: Color(0XFF7186E5),
            endColor: Color(0XFF595EDD),
            title: 'Lunch',
            breakfastKcal: '235',
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (3 / 38),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (29 / 95),
          child: FoodCard(
            startColor: Color(0XFFFB91B2),
            endColor: Color(0XFFE2487B),
            title: 'Snacks',
            breakfastKcal: '105',
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (3 / 38),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (29 / 95),
          child: FoodCard(
            startColor: Color(0XFFFFAB67),
            endColor: Color(0XFFFF8357),
            title: 'Dinner',
            breakfastKcal: '257',
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * (3 / 38),
        ),
      ],
    );
  }
}
