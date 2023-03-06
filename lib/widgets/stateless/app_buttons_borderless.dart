import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/stateless/app_text.dart';

import '../../misc/colors.dart';

class AppButtonsNoBorder extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  double size;
  bool? isIcon;

  AppButtonsNoBorder ({Key? key,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.size,
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0),
      ),
      child: isIcon == false ?
        Center(child: AppText(text: text!, color: color)) :
        Center(child: Icon(icon, color: color))
    );
  }
}
