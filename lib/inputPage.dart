import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';

enum Gender{
  Male, Female
}

Gender gender;
int heightFeet=5;
int heightInch=3;
int weight=70;
int age=21;
double bmi;
String comment="";

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {

    //Color boxColorTwo=Color(0xFF1d1e33);
    //Gender gender;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BoxBmi(
                      boxColor: gender==Gender.Male?Colors.blueGrey:Color(0xFF111328),
                      boxChild: BoxDetails(label: 'MALE', iconName: FontAwesomeIcons.mars),
                      onPressed: () {
                        setState(() {
                          gender=Gender.Male;
                        });
                      },
                    )
                  ),
                  Expanded(
                    child: BoxBmi(
                      boxColor: gender==Gender.Female?Colors.blueGrey:Color(0xFF111328),
                      boxChild: BoxDetails(iconName: FontAwesomeIcons.venus, label: 'FEMALE'),
                      onPressed: () {
                        setState(() {
                          gender=Gender.Female;
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: BoxBmi(
                boxColor: Color(0xFF1d1e33),
                boxChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style:TextStyle(color: Color(0xFF8D8E98),fontSize: 20.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(heightFeet.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
                        Text('FEET', style: TextStyle(color: Color(0xFF8D8E98),fontSize: 18.0)),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            min: 3,
                            max: 9,
                            value: heightFeet.toDouble(),
                            onChanged: (double value){
                              setState(() {
                                heightFeet=value.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(heightInch.toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
                        Text('INCH', style: TextStyle(color: Color(0xFF8D8E98),fontSize: 18.0)),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 12,
                            value: heightInch.toDouble(),
                            onChanged: (double value){
                              setState(() {
                                heightInch=value.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BoxBmi(
                      boxColor: Color(0xFF1d1e33),
                      boxChild: Column(
                        children: <Widget>[
                          Text('WEIGHT(KG)', style:TextStyle(color: Color(0xFF8D8E98),fontSize: 18.0)),
                          Text(weight.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                                elevation: 6.0,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                                elevation: 6.0,
                              ),

                            ],
                          )

                        ],
                      ),
                    )
                    ),
                  Expanded(
                    child: BoxBmi(
                      boxColor: Color(0xFF1d1e33),
                      boxChild: Column(
                        children: <Widget>[
                          Text('AGE', style:TextStyle(color: Color(0xFF8D8E98),fontSize: 18.0)),
                          Text(age.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                                elevation: 6.0,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
                                elevation: 6.0,
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ),
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {
                  double height=heightFeet+(heightInch/12.0);
                  height=height/3.281;

                  bmi=weight/(height*height);
                  print(bmi);

                  if(bmi<18.5){
                    comment="YOUR BMI IS IN UNDERWEIGHT RANGE!";
                  }else if(bmi>=18.5 && bmi<=24.9){
                    comment="YOUR BMI IS IN HEALTHY RANGE!";
                  }else if(bmi>=25.0 && bmi<=29.9){
                    comment="YOUR BMI IS IN OVERWEIGHT RANGE!";
                  }else{
                    comment="YOU ARE DANGEROUSLY OBESE!";
                  }



                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Result(bmi: bmi, comment: comment)));

                },
                child: Container(
                  child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))),
                  height: 50,
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0)
                ),
              ),
            )


          ],
        ),



    );
  }
}


class BoxDetails extends StatelessWidget {

  final String label;
  final IconData iconName;
  
  BoxDetails({@required this.iconName, this.label});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 60,
        ),
        SizedBox(height: 4.0,),
        Text(label, style: TextStyle(color: Color(0xFF8D8E98),fontSize: 15.0),),
      ],
    );
  }
}

class BoxBmi extends StatelessWidget {
  final Color boxColor;
  final Widget boxChild;
  final Function onPressed;

  BoxBmi({@required this.boxColor,this.boxChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: boxChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

class BoxBmi2 extends StatelessWidget {
  final Color boxColor;
  final Widget boxChild;
  final Function onPressed;

  BoxBmi2({@required this.boxColor,this.boxChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: boxChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
