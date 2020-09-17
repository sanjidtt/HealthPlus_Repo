import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DietCamera extends StatefulWidget {
  static String id = 'diet_camera';

  @override
  _DietCameraState createState() => _DietCameraState();
}

class _DietCameraState extends State<DietCamera> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: //'https://www.youtube.com/',
                'https://fruit-classifer.onrender.com/?fbclid=IwAR2cuvsOePXpFX-lpotEUjSM9U-Iab5JM54GZ9PewOP9lCKb6aWzLDOTG-8',
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          );
        },
      ),
    );
  }
}
