import 'package:flutter/cupertino.dart';
import 'package:flutter_cubit/widgets/stateless/app_text.dart';

import '../../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroudColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons ({Key? key,
    this.text,
    this.icon,
    this.isIcon = false,
    required this.size,
    required this.color,
    required this.backgroudColor,
    required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroudColor
      ),
      child: isIcon == false ?
        Center(child: AppText(text: text!, color: color)) :
        Center(child: Icon(icon, color: color))
    );
  }
}
