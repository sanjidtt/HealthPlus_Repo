import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_plus_2/components/cylindrical_button.dart';
import 'package:health_plus_2/components/diet_food_detail_card.dart';
import 'package:health_plus_2/components/round_icon_button.dart';
import 'package:health_plus_2/constants.dart';

class DietFoodDetailScreen extends StatefulWidget {
  static String id = 'diet_fooddetail_screen';

  @override
  _DietFoodDetailScreenState createState() => _DietFoodDetailScreenState();
}

class _DietFoodDetailScreenState extends State<DietFoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: (MediaQuery.of(context).size.height),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height) * (200 / 630),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(tempObj2.foodPic), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 1.8,
                      //spreadRadius: 3.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  //color: Colors.blue,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (62 / 630),
                child: Center(
                  child: Text(
                    tempObj2.foodLabel,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * (294 / 328),
                height: (MediaQuery.of(context).size.height) * (128 / 630),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Food Summary (Total)",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        DietFoodDetailCard(
                          numerator: 75,
                          denominator: 328,
                          startColor: Color(0XFFFF5247),
                          endColor: Color(0XFFFF6C19),
                          conColor: Color(0XFFFCE2E2),
                          titleVar: "Calorie",
                          valueVar:
                              (double.parse(tempObj2.foodKCal) * servingVar)
                                  .toStringAsFixed(0),
                          unitVar: "Kcal",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFFFFA705),
                          endColor: Color(0XFFFF8E06),
                          conColor: Color(0XFFFEE7D1),
                          titleVar: "Carbs",
                          valueVar:
                              (double.parse(tempObj2.foodCarbs) * servingVar)
                                  .toStringAsFixed(2),
                          unitVar: "g",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFF7CD601),
                          endColor: Color(0XFF38B901),
                          conColor: Color(0XFFD7F0C5),
                          titleVar: "Protein",
                          valueVar:
                              (double.parse(tempObj2.foodProtien) * servingVar)
                                  .toStringAsFixed(2),
                          unitVar: "g",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFF029CBD),
                          endColor: Color(0XFF017FC4),
                          conColor: Color(0XFFC7E2F1),
                          titleVar: "Fat",
                          valueVar:
                              (double.parse(tempObj2.foodFat) * servingVar)
                                  .toStringAsFixed(2),
                          unitVar: "g",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (150 / 630),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 15,
                    ),
                    Text(
                      "Serving(s): " + servingVar.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              --servingVar;
                              if (servingVar < 1.0) {
                                servingVar = 1.0;
                              }
                            });
                            print("Minus");
                          },
                        ),
                        Container(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              ++servingVar;
                            });
                            print("Plus");
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CylindricalButton(
                          str: "Breakfast",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodBreakfast,
                          onTap: () {
                            setState(() {
                              foodChoice = 1;
                            });
                          },
                        ),
                        CylindricalButton(
                          str: "Lunch",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodLunch,
                          onTap: () {
                            setState(() {
                              foodChoice = 2;
                            });
                          },
                        ),
                        CylindricalButton(
                          str: "Snack",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodSnack,
                          onTap: () {
                            setState(() {
                              foodChoice = 3;
                            });
                          },
                        ),
                        CylindricalButton(
                          str: "Dinner",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodDinner,
                          onTap: () {
                            setState(() {
                              foodChoice = 4;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (66 / 630),
                child: Container(
                  width: (MediaQuery.of(context).size.width) * (16 / 19),
                  //height: (MediaQuery.of(context).size.height) * (2 / 19),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: FlatButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, DietAddFoodScreen.id);
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
        ),
      ),
    );
  }
}

/*class DietFoodDetailScreen extends StatelessWidget {
  static String id = 'diet_fooddetail_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: (MediaQuery.of(context).size.height),
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height) * (200 / 630),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 1.8,
                      //spreadRadius: 3.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  color: Colors.blue,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (62 / 630),
                child: Center(
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * (294 / 328),
                height: (MediaQuery.of(context).size.height) * (128 / 630),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Food Summary (Total)",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        DietFoodDetailCard(
                          numerator: 75,
                          denominator: 328,
                          startColor: Color(0XFFFF5247),
                          endColor: Color(0XFFFF6C19),
                          conColor: Color(0XFFFCE2E2),
                          titleVar: "Calorie",
                          valueVar: "600",
                          unitVar: "Kcal",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFFFFA705),
                          endColor: Color(0XFFFF8E06),
                          conColor: Color(0XFFFEE7D1),
                          titleVar: "Carbs",
                          valueVar: "15",
                          unitVar: "g",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFF7CD601),
                          endColor: Color(0XFF38B901),
                          conColor: Color(0XFFD7F0C5),
                          titleVar: "Protein",
                          valueVar: "20",
                          unitVar: "g",
                        ),
                        Container(
                          width:
                              (MediaQuery.of(context).size.width) * (8 / 328),
                        ),
                        DietFoodDetailCard(
                          numerator: 65,
                          denominator: 328,
                          startColor: Color(0XFF029CBD),
                          endColor: Color(0XFF017FC4),
                          conColor: Color(0XFFC7E2F1),
                          titleVar: "Fat",
                          valueVar: "18",
                          unitVar: "g",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (150 / 630),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 15,
                    ),
                    Text(
                      "Serving(s): " + servingVar.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            */ /*setState(() {
                              --weight;
                            });*/ /*
                            print("Minus");
                          },
                        ),
                        Container(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            */ /*setState(() {
                              --weight;
                            });*/ /*
                            print("Plus");
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CylindricalButton(
                          str: "Breakfast",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodBreakfast,
                        ),
                        CylindricalButton(
                          str: "Lunch",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodLunch,
                        ),
                        CylindricalButton(
                          str: "Snack",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodSnack,
                        ),
                        CylindricalButton(
                          str: "Dinner",
                          foodChoiceVar: foodChoice,
                          foodChoiceVarFixed: foodDinner,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * (66 / 630),
                child: Container(
                  width: (MediaQuery.of(context).size.width) * (16 / 19),
                  //height: (MediaQuery.of(context).size.height) * (2 / 19),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: FlatButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, DietAddFoodScreen.id);
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
        ),
      ),
    );
  }
}*/
