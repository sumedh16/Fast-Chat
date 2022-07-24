import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.onPress, required this.buttonColor, required this.buttonText}) : super(key: key);
  final VoidCallback onPress;
  final Color buttonColor;
  final Text buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
                  onPressed: onPress,
                  minWidth: 200.0,
                  height: 42.0,
                  child: buttonText,
                ),
      ),
    );
  }
}
