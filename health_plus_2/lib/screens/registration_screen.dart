import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_plus_2/constants.dart';
import 'package:health_plus_2/screens/registration_2_screen.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int flagSignUp = 0;

  final conUsername = TextEditingController();
  final conEmail = TextEditingController();
  final conPassword1 = TextEditingController();
  final conPassword2 = TextEditingController();

  Future register() async {
    var url = "http://192.168.0.103/Test_localhost/registration_1.php";
    var response = await http.post(url, body: {
      "EMAIL": regEmail1,
      "PASSWORD": regPassword1,
      "NAME": regUsername1,
    });
    print("Inside Register");
    var data = response.body;
    print("hELLO");
    var anyID = jsonDecode(data)[0]["PERSON_ID"];

    universalId = anyID;

    print(anyID);

    print("Inside Register...2");

    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "User Already Exists",
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

      Navigator.pushNamed(context, RegistrationScreen2.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 170,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0XFF6C38D9),
                        Color(0XFF7234C7),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          'images/logo_crop_2.png',
                          //height: 90,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Health Plus',
                          style: TextStyle(
                            fontFamily: 'Lobster',
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 180,
                child: Container(
                  child: Image.asset(
                    'images/dash_2.jpg',
                    fit: BoxFit.fill,
                    //height: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 331,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0XFF7228AB),
                        Color(0XFFA53182),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment(0, 0.45),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: screensize.width * 0.73,
                    margin: EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        regUsername1 = value;
                      },
                      //controller: conUsername,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Username",
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
                  Container(
                    width: screensize.width * 0.73,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                    child: TextFormField(
                      //controller: conEmail,
                      onChanged: (value) {
                        regEmail1 = value;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Email",
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
                  Container(
                    width: screensize.width * 0.73,
                    margin: EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      obscureText: true,
                      //controller: conPassword1,
                      onChanged: (value) {
                        regPassword1 = value;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
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
                  Container(
                    width: screensize.width * 0.73,
                    margin: EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      obscureText: true,
                      //controller: conPassword2,
                      onChanged: (value) {
                        regConfirmPassword1 = value;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
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
                  Container(
                    width: screensize.width * 0.73,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                    child: FlatButton(
                      onPressed: () {
                        print(regUsername1);
                        print(regEmail1);
                        print(regPassword1);
                        print(regConfirmPassword1);
                        if (conPassword1 == conPassword2) {
                          print(conPassword1);
                          print(conPassword2);
                        }
                        print('Sign up');

                        register();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'SIGN UP',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0XFFAC7DCC),
                          fontSize: 15,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print('Sign in');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
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
