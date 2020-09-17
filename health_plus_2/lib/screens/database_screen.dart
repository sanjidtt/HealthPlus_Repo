import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

/*void addSteps() {
  print("Inside addteps");

  var url = "http://192.168.0.103/Test_localhost/insertSteps.php";
  http.post(url, body: {
    "STEP_ID": varId,
    //"STEP_DATE": "2020-07-01",
    "STEPS_STEP": varValue,
  });

  print("Exit addteps 1");

  //var responseBody = json.decode(res.body);
  //print(responseBody);

  //print("Exit addteps 2");
}*/

class DatabaseScreen extends StatefulWidget {
  static String id = 'database_screen';

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  /*getMethod() async {
    print('Enter getMethod');
    String url = 'http://192.168.0.103/Test_localhost/getData.php';
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var responseBody = json.decode(res.body);
    print('Exit getMethod');
    print(responseBody);

    return responseBody;
  }*/

  addMethod() {
    var url = 'http://192.168.0.103/Test_localhost/addPersons.php';
    http.post(url, body: {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
    });
  }

  addStepMethod() {
    print(stepDate);
    var url = 'http://192.168.0.103/Test_localhost/insertSteps.php';
    http.post(url, body: {
      'STEP_ID': stepID,
      'STEP_DATE': stepDate,
      'STEPS_STEP': steps,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.redAccent,
          child: Center(
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                addStepMethod();
              },
            ),
          ),
          /*FutureBuilder(
            future: getMethod(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List snap = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error fetching data",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return ListView.builder(
                itemCount: snap.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("EMAIL: ${snap[index]['EMAIL']}"),
                    subtitle: Text("NAME: ${snap[index]['NAME']}"),
                  );
                },
              );
            },
          ),*/
        ),
      ),
    );
  }
}
