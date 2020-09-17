import 'package:flutter/material.dart';

class BmiTab extends StatelessWidget {
  BmiTab(
      {this.iconLogo, this.textHeading, this.backgroundCol, this.stepsVarTab});

  final Icon iconLogo;
  final String textHeading;
  final Color backgroundCol;
  final int stepsVarTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 1.8,
            //spreadRadius: 3.0,
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
                  child: Text(
                    textHeading,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
          /*Expanded(
            flex: 122,
            child: Center(),
          ),*/
          Expanded(
            flex: 24,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
