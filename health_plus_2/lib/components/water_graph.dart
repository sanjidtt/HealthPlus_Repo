import 'package:flutter/cupertino.dart';

class WaterGraph extends StatelessWidget {
  final double height = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GraphBar(height: height, percentage: 0.8),
          GraphBar(height: height, percentage: 0.2),
          GraphBar(height: height, percentage: 0.5),
          GraphBar(height: height, percentage: 0.6),
          GraphBar(height: height, percentage: 1.0),
          GraphBar(height: height, percentage: 0.1),
          GraphBar(height: height, percentage: 0.05),
          GraphBar(height: height, percentage: 0.9),
        ],
      ),
    );
  }
}

class GraphBar extends StatelessWidget {
  final double height, percentage;
  GraphBar({this.height, this.percentage});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BarPainter(percentage: percentage),
      child: Container(
        height: height,
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  final double percentage;
  BarPainter({this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final Color greyColor = Color(0XFFE6E6E6);
    final Color blueColor = Color(0XFF1A73C0);

    Paint greyPaint = Paint()
      ..color = greyColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Offset topPoint = Offset(0, 0);
    Offset bottomPoint = Offset(0, size.height);
    Offset centerPoint = Offset(0, size.height / 2);

    canvas.drawLine(topPoint, bottomPoint, greyPaint);

    Paint filledPaint = Paint()
      ..color = blueColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    double filledHeight = percentage * size.height;
    double filledHalfHeight = filledHeight / 2;

    canvas.drawLine(
        centerPoint, Offset(0, centerPoint.dy - filledHalfHeight), filledPaint);
    canvas.drawLine(
        centerPoint, Offset(0, centerPoint.dy + filledHalfHeight), filledPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
