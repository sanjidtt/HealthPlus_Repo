import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
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
                          print('Sign up');
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
      ),
    );
  }
}
