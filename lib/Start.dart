import 'package:flutter/material.dart';
import 'package:watertwo/WaterHome.dart';
import 'package:watertwo/WaterMisc.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  int _currentIndex=0;
  final List<Widget> children = [
    WaterHome(),
    WaterMisc()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      appBar: AppBar(
        title: Text('Water Intake'),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          iconSize: 20,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('HOME'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections),
                title: Text('MISC.'),
            ),

          ],
          onTap: (index) {
            setState(() {
              _currentIndex=index;
            }
            );
          },
        ),
      ),

    );
  }
}
