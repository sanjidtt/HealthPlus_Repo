import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class WaterMisc extends StatefulWidget {
  bool isSwitched = false;
  int timeNotify = 1;

  @override
  _WaterMiscState createState() => _WaterMiscState();
}

class _WaterMiscState extends State<WaterMisc> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('app_icon');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future singleNotification(
      DateTime datetime, String message, String subtext, int hashcode,
      {String sound}) async {
    var androidChannel = AndroidNotificationDetails(
      'channel-id',
      'channel-name',
      'channel-description',
      importance: Importance.Max,
      priority: Priority.Max,
    );

    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
  }

  final textController = TextEditingController();

  triggerNotification() async {
    if (widget.isSwitched) {
      print(widget.timeNotify);
      int time = widget.timeNotify * 60;
      DateTime now = DateTime.now().toUtc().add(
            Duration(seconds: time),
          );

      await singleNotification(now, "REMINDER!", "DRINK YOUR WATER!", 98123871);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Color(0xFFf2f2f2),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /*FloatingActionButton(
                      child: Icon(Icons.notifications),
                      onPressed: () async {
                        DateTime now = DateTime.now().toUtc().add(
                          Duration(seconds: 10),
                        );
                        await singleNotification(now, "Notification", "THIS IS A NOTIFICATION", 98123871);
                      },
                    ),*/
                    Text("REMIND YOURSELF TO DRINK WATER",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.notifications_active,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Notify Me After   ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 30,
                          child: TextField(
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                            controller: textController,
                            decoration: InputDecoration(),
                          ),
                        ),
                        Text(
                          " minutes ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Switch(
                          value: widget.isSwitched,
                          onChanged: (value) {
                            setState(() {
                              widget.isSwitched = value;
                              triggerNotification();
                              widget.timeNotify =
                                  int.parse(textController.text);
                              textController.clear();
                            });
                          },
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
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
