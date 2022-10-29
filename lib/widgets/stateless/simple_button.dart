import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleRoundedButton extends StatelessWidget {
  final double fontSize;
  final double height;
  final double width;
  final String text;
  final Function() onPressed;

  const SimpleRoundedButton({
    Key? key,
    required this.fontSize,
    required this.height,
    this.width = double.maxFinite,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
      ),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}


