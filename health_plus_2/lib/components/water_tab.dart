import 'package:flutter/material.dart';
import 'package:health_plus_2/components/water_graph.dart';

class WaterTab extends StatelessWidget {
  WaterTab({this.iconLogo, this.textHeading, this.backgroundCol});

  final Icon iconLogo;
  final String textHeading;
  final Color backgroundCol;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 1.8,
            //spreadRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundCol,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 29,
            child: SizedBox(),
          ),
          Expanded(
            flex: 25,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 19,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 58,
                  child: Text(textHeading),
                ),
                Expanded(
                  flex: 21,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 25,
                  child: iconLogo,
                ),
                Expanded(
                  flex: 11,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 24,
            child: SizedBox(),
          ),
          Expanded(
            flex: 122,
            child: Center(
              child: WaterGraph(),
            ),
          ),
          Expanded(
            flex: 35,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
              child: Align(
                alignment: Alignment(-1, 1),
                child: Row(
                  children: <Widget>[
                    Text(
                      "4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      " cups",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
