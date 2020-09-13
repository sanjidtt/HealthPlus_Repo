import 'package:bmicalculator/inputPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Result extends StatefulWidget {

  final double bmi;
  final String comment;

  Result({Key key, @required this.bmi, this.comment}) :super(key: key);

  @override
  _ResultState createState() => _ResultState();
}


class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR BMI'),
      ),
      body: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: BoxBmi(
                boxColor: Color(0xFFb2b2b2),
                boxChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('BMI IS', style:TextStyle(color: Colors.black87,fontSize: 18.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.black87)),
                      ],
                    ),
                  ],
                ),
              ),

            ),
            Expanded(
              child: BoxBmi(
                boxColor: Color(0xFFb2b2b2),
                boxChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(comment, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
                      ],
                    ),



                  ],



                ),
              ),

            ),
            Expanded(

              child: Container(
                height: 200,
                width: 200,
                color: Colors.white70,
                child: Image(
                  image: (bmi>=18.5 && bmi<=24.9) ? AssetImage('assets/happyheart.png') : AssetImage('assets/sadheart.png'),
                )
              ),

            )

          ],
        ),

      ),




    );
  }
}
