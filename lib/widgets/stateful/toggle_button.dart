import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../stateless/app_buttons_borderless.dart';

class ToggleButton extends StatefulWidget {
  final void Function() pressedFunction;
  final void Function() releaseFunction;
  const ToggleButton({
    Key? key,
    required this.pressedFunction,
    required this.releaseFunction
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isPressed = false;

  void togglePressed() {
    setState(() {
      if (_isPressed) {
        _isPressed = false;
        widget.releaseFunction();
      } else {
        _isPressed = true;
        widget.pressedFunction();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: togglePressed,
      child: AppButtonsNoBorder(
        size: 40,
        color: _isPressed ? Colors.pinkAccent : Colors.black,
        isIcon: true,
        icon: _isPressed ? Icons.favorite: Icons.favorite_border,
      ),
    );
  }
}
