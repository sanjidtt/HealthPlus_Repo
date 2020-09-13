import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class WaterHome extends StatefulWidget {

  int inputAmount=250;
  int dailyGoal=2500;
  int drinkAmount=0;
  double ratio=0.0;
  int inputSlider=1200;



  @override
  _WaterHomeState createState() => _WaterHomeState();
}



class _WaterHomeState extends State<WaterHome> {

  @override
  void initState(){
    super.initState();
    getValues();
  }


  void setValues() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'drink';
    final value = widget.drinkAmount;
    prefs.setInt(key, value);
    //print("set $value");
  }

  void getValues() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'drink';
    final value = prefs.getInt(key) ?? 0;
    widget.drinkAmount = value;
    widget.ratio=widget.drinkAmount/widget.dailyGoal;

    //print("get $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("YOUR DAY RESULT", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    SizedBox(height: 15),

                    Row(
                      children: <Widget>[
                        SizedBox(width: 120),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                            ),
                            child: LiquidCircularProgressIndicator(
                              value: widget.ratio,
                              //valueColor: AlwaysStoppedAnimation(Colors.red),
                              borderColor: Colors.black,
                              borderWidth: 1.5,
                              direction: Axis.vertical,
                              backgroundColor: Colors.white70,
                              center: Text(widget.drinkAmount.toString() + "/" + widget.dailyGoal.toString() + "mL",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),

                            ),
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
              child: Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Color(0xFFf2f2f2),
                ),


                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("ADD A PORTION OF WATER", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                                widget.inputAmount-=50;
                            });
                          },
                          heroTag: "bleh1",
                          child: Icon(Icons.remove),
                          shape: RoundedRectangleBorder(),
                          foregroundColor: Color(0xFF22277A),
                          backgroundColor: Colors.white,
                          elevation: 1.0,
                        ),

                        SizedBox(
                          height: 55,
                          width: 55,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                widget.inputAmount.toString()+"mL",
                                style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                              ),
                            ),
                            ),
                          ),

                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                                widget.inputAmount+=50;
                            });
                          },
                          heroTag: "bleh2",
                          child: Icon(Icons.add),
                          shape: RoundedRectangleBorder(),
                          foregroundColor: Color(0xFF22277A),
                          backgroundColor: Colors.white,
                          elevation: 1.0,
                        ),
                      ],
                    ),

                    FloatingActionButton(
                        onPressed: ()async{
                          setState(() {
                              widget.drinkAmount+=widget.inputAmount;
                              widget.ratio=widget.drinkAmount/widget.dailyGoal;
                              setValues();
                          });
                        },
                        heroTag: "bleh3",
                        child: Icon(MdiIcons.cupWater , size: 18),
                        mini: true,
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF22277A),
                        elevation: 1.5,
                      ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("YOUR DAILY RATE OF WATER", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.flaskOutline,
                          size: 40,
                        ),

                        SizedBox(
                          height: 40,
                          width: 140,

                          child: Center(
                            child: Text(
                              widget.inputSlider.toString()+"mL",
                              style: TextStyle(fontSize: 35, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ),
                      ],

                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.blue,
                        inactiveTrackColor: Colors.black,
                        trackShape: RoundedRectSliderTrackShape(),
                        trackHeight: 2.0,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0),
                        thumbColor: Colors.blueAccent,
                        overlayColor: Colors.blueGrey,
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                        tickMarkShape: RoundSliderTickMarkShape(),
                        activeTickMarkColor: Colors.purpleAccent,
                        inactiveTickMarkColor: Colors.grey,
                      ),
                      child: Slider(
                        value: widget.inputSlider.toDouble(),
                        min: 1200,
                        max: 4000,
                        divisions: 56,
                        onChanged: (value){
                          setState(() {
                            widget.inputSlider=value.floor();
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 35,
                      width: 35,
                      child: FloatingActionButton(
                        child: Icon(Icons.save),
                        shape: RoundedRectangleBorder(),
                        foregroundColor: Color(0xFF22277A),
                        backgroundColor: Colors.white,
                        elevation: 1.0,
                        mini: true,
                        onPressed: (){
                          setState(() {
                            widget.dailyGoal=widget.inputSlider;
                            widget.ratio=widget.drinkAmount/widget.dailyGoal;
                          });
                        },

                      ),
                    ),


                  ],
                ),

               ),
              ),

          ],
        ),

    );
  }
}