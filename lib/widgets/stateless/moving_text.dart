import 'package:flutter/cupertino.dart';
import 'package:marquee/marquee.dart';

class MovingText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final int maxLength;

  const MovingText({
    Key? key,
    this.textStyle,
    required this.text,
    required this.maxLength
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.length > maxLength ?
      Marquee(
          text: text,
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 70.0,
          pauseAfterRound: Duration(seconds: 3),
          startPadding: 10.0,
          accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: Duration(milliseconds: 1),
          decelerationCurve: Curves.easeOut,
          style: textStyle
      ) :
      Text(text, style: textStyle);
  }
}
