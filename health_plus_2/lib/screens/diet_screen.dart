import 'package:flutter/material.dart';
import 'package:health_plus_2/components/diet_lower_card.dart';
import 'package:health_plus_2/components/diet_upper_card.dart';

import 'diet_addfood_screen.dart';

class DietScreen extends StatefulWidget {
  static String id = 'diet_screen';

  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F3F8),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 87,
            child: Container(),
          ),
          Expanded(
            flex: 236,
            child: DietUpperCard(),
          ),
          Expanded(
            flex: 74,
            child: Container(),
          ),
          Expanded(
            flex: 180,
            child: DietLowerCard(),
          ),
          Expanded(
            flex: 88,
            child: Container(
              width: (MediaQuery.of(context).size.width) * (16 / 19),
              //height: (MediaQuery.of(context).size.height) * (2 / 19),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, DietAddFoodScreen.id);
                  print('ADD FOOD');
                },
                child: Text(
                  'ADD FOOD',
                  style: TextStyle(
                    color: Colors.green,
                    letterSpacing: 1.5,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
