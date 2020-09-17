import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus_2/constants.dart';
import 'package:http/http.dart' as http;

import 'diet_fooddetail_screen.dart';

class DietAddFoodScreen extends StatefulWidget {
  static String id = 'diet_addfood_screen';

  @override
  _DietAddFoodScreenState createState() => _DietAddFoodScreenState();
}

class _DietAddFoodScreenState extends State<DietAddFoodScreen> {
  Future<List<FoodDetails>> getFoodData() async {
    String apiId = '7fdab7c5';
    String apiKey = '3f5a6c217811fab4b71ed2a0b5c18d48';

    List<FoodDetails> foodlist = [];

    print("Enter getUsers");
    var data = await http.get(
        "https://api.edamam.com/api/food-database/v2/parser?ingr=$dietSearch&app_id=$apiId&app_key=$apiKey");
    print("Hello 1...");
    var jsonData = json.decode(data.body);
    print(jsonData);
    print(jsonData["hints"][1]["food"]["label"]);
    print("Hello 2...");

    for (int i = 0; i < 20; i++) {
      if (jsonDecode(data.body)['hints'][i]['food']['image'] != null) {
        temp_picture =
            (jsonDecode(data.body)['hints'][i]['food']['image']).toString();
      } else {
        temp_picture = "nothing nothing";
      }

      temp_label =
          (jsonDecode(data.body)['hints'][i]['food']['label']).toString();
      temp_kcal = checkNumKcal(
          jsonDecode(data.body)['hints'][i]['food']['nutrients']['ENERC_KCAL']);
      temp_prot = checkNum(
          jsonDecode(data.body)['hints'][i]['food']['nutrients']['PROCNT']);
      temp_fat = checkNum(
          jsonDecode(data.body)['hints'][i]['food']['nutrients']['FAT']);
      temp_carb = checkNum(
          jsonDecode(data.body)['hints'][i]['food']['nutrients']['CHOCDF']);

      print(temp_label);
      print(temp_kcal);
      print(temp_prot);
      print(temp_fat);
      print(temp_carb);
      print(temp_picture);

      print("...........Hello(2.5)........");

      FoodDetails obj = FoodDetails(
          temp_label, temp_kcal, temp_carb, temp_prot, temp_fat, temp_picture);

      foodlist.add(obj);
    }
    print("Hello 5....");
    print(foodlist.length);

    return foodlist;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF2F3F8),
        body: ListView(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height) * (4 / 133),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) * (16 / 19),
              height: (MediaQuery.of(context).size.height) * (12 / 133),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 258,
                      child: TextFormField(
                        onChanged: (value) {
                          dietSearch = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                          border: InputBorder.none,
                          hintText: "Search food here...",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: VerticalDivider(
                        thickness: 1.5,
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: IconButton(
                        onPressed: () {
                          print(dietSearch);
                          print("Pressed Search");
                          //_getUsers();
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height) * (4 / 133),
            ),
            Container(
              height: (MediaQuery.of(context).size.height) * (98 / 133),
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: FutureBuilder(
                future: getFoodData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading..."),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            tempObj2 = snapshot.data[index];
                            Navigator.pushNamed(
                                context, DietFoodDetailScreen.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1.8,
                                  //spreadRadius: 3.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            //height: (MediaQuery.of(context).size.height) * (3 / 19),
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 0,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 13,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          snapshot.data[index].foodLabel,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  "Protein",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                          .foodProtien +
                                                      " g",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  "Carbs",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                          .foodCarbs +
                                                      " g",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  "Fat",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 8.0),
                                                child: Text(
                                                  snapshot.data[index].foodFat +
                                                      " g",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].foodKCal,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "KCal",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class FoodDetails {
  final String foodLabel;
  final String foodKCal;
  final String foodCarbs;
  final String foodProtien;
  final String foodFat;
  final String foodPic;

  FoodDetails(this.foodLabel, this.foodKCal, this.foodCarbs, this.foodProtien,
      this.foodFat, this.foodPic);
}*/
