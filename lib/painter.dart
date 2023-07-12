import 'package:flutter/material.dart';

class CustomTextPainter extends CustomPainter {
  final String text;
  final TextStyle topStyle;
  final TextStyle bottomStyle;

  const CustomTextPainter({
    required this.text,
    required this.topStyle,
    required this.bottomStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bottomTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: bottomStyle,
      ),
    );
    final topTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: topStyle,
      ),
    );

    bottomTextPainter.layout(maxWidth: size.width);
    topTextPainter.layout(maxWidth: size.width);

    final bottomTextSize = bottomTextPainter.size;
    final topTextSize = topTextPainter.size;

    bottomTextPainter.paint(
        canvas,
        Offset(
          (size.width * .5) - bottomTextSize.width / 2,
          (size.height * .5) + bottomTextSize.height / 2,
        ));
    topTextPainter.paint(
      canvas,
      Offset(
        (size.width * .5) - (topTextSize.width / 2) * .95,
        (size.height * .5) + (topTextSize.height / 2) * .97,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomTextPainter oldDelegate) {
    return oldDelegate.text != text ||
        oldDelegate.bottomStyle != bottomStyle ||
        oldDelegate.topStyle != topStyle;
  }
}
