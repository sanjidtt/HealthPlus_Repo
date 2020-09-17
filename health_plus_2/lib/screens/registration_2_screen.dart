import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_plus_2/constants.dart';
import 'package:health_plus_2/screens/dashboard_screen.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen2 extends StatefulWidget {
  static String id = 'registration_screen_2';

  @override
  _RegistrationScreen2State createState() => _RegistrationScreen2State();
}

class _RegistrationScreen2State extends State<RegistrationScreen2> {
  int flagSignUp = 0;

  //final conUsername = TextEditingController();
  //final conEmail = TextEditingController();
  //final conPassword1 = TextEditingController();
  //final conPassword2 = TextEditingController();

  Future register2() async {
    var url = "http://192.168.0.103/Test_localhost/registration_2.php";
    var response = await http.post(url, body: {
      "GENDER": reg2GenderNum,
      "AGE": reg2Age,
      "WEIGHT": reg2Weight,
      "HEIGHT": reg2Height,
      "GOAL_ID": universalId,
      "GOAL_STEP": reg2Steps,
      "GOAL_WATER": reg2Water,
      "GOAL_KCAL": reg2Calorie,
      "GOAL_PROT": reg2Protein,
      "GOAL_CARB": reg2Carb,
      "GOAL_FAT": reg2Fat,
      "GOAL_SLEEP": reg2Sleep,
    });
    print("Inside Register(2)");
    var data = jsonDecode(response.body);
    print("hELLO");
    //var anyID = jsonDecode(data)[0]["PERSON_ID"];

    print(data);

    print("Inside Register...2");

    if (data == "Fail") {
      Fluttertoast.showToast(
        msg: "Please Try Again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 25.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 25.0,
      );

      print(data);

      Navigator.pushNamed(context, DashboardScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFF5E1DAF),
              Color(0XFFA53182),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    '  Hey  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  Text(
                    'Sanjid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(26, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Fill the following:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Lobster',
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    ' - Personal Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Age = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Year',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Gender = value;
                      if (reg2Gender == "male") {
                        reg2GenderNum = "1";
                      } else {
                        reg2GenderNum = "2";
                      }
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Weight = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Weight",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Kg',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Height = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Height",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    ' - Goals',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Steps = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Steps Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'steps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Water = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Water Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'litres',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.31,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Calorie = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Calorie Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'KCal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.31,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Protein = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Protein Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'gram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Fat = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Fat Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'gram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Carb = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Carb Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'gram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: screensize.width * 0.3,
                  margin: EdgeInsets.fromLTRB(30, 5, 5, 15),
                  child: TextFormField(
                    onChanged: (value) {
                      reg2Sleep = value;
                    },
                    //controller: conEmail,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Sleep Goal",
                      labelStyle: TextStyle(color: Color(0XFFAC7DCC)),
                      focusedBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0XFFB58DD4),
                          width: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'hours',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              //width: screensize.width * 0.5,
              margin: EdgeInsets.fromLTRB(40, 20, 40, 40),
              child: FlatButton(
                onPressed: () {
                  print('Next');

                  print(universalId);
                  print(reg2Age);
                  print(reg2Gender);
                  print(reg2GenderNum);
                  print(reg2Weight);
                  print(reg2Height);
                  print(reg2Steps);
                  print(reg2Water);
                  print(reg2Calorie);
                  print(reg2Protein);
                  print(reg2Fat);
                  print(reg2Carb);
                  print(reg2Sleep);

                  register2();
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18,
                    ),
                  ),
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
