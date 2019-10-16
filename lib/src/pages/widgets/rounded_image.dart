import 'package:flutter/material.dart';
import 'package:stadia_app/src/pages/styles/colors.dart';
import 'package:stadia_app/src/pages/styles/text_styles.dart';

import 'package:vector_math/vector_math_64.dart' as math;

class RoundedImage extends StatelessWidget {
  final isOnline;
  final bool showRanking;
  final int ranking;
  final String imagePath;
  final String name;
  final imageSize = 70.0;

  const RoundedImage({
    Key key,
    @required this.imagePath,
    this.name = "",
    this.isOnline = false,
    this.showRanking = false,
    this.ranking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          height: imageSize + 8,
          child: Stack(
            children: <Widget>[
              _circleImage(),
              if (showRanking) _showRanking(),
            ],
          ),
        ),
        if (name != null)
          Text(
            name,
            style: bodyTextStyle,
          )
      ],
    );
  }

  Widget _circleImage() => CustomPaint(
        painter: RoundedImageBorder(isOnline),
        child: Container(
          width: imageSize,
          height: imageSize,
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget _showRanking() => Positioned(
        right: 0,
        bottom: 0,
        child: ClipOval(
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(gradient: appGradient),
            child: Center(
              child: Text(
                ranking.toString(),
                style: rankTextStyle,
              ),
            ),
          ),
        ),
      );
}

class RoundedImageBorder extends CustomPainter {
  final bool isOnline;

  RoundedImageBorder(this.isOnline);

  @override
  void paint(Canvas canvas, Size s) {
    final size = s.width / 2;

    Offset center = Offset(size, size);
    Paint borderPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Rect circle = Rect.fromCircle(center: center, radius: size);

    if (isOnline) {
      borderPaint.shader = appGradient.createShader(circle);
    } else {
      borderPaint.color = tertiaryTextColor;
    }

    canvas.drawArc(
      circle,
      math.radians(-90),
      math.radians(360),
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
