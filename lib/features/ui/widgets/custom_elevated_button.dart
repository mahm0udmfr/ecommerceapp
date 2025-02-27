import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  String text;
  Color? backgroundColor;
  void Function()? onPressed;
  TextStyle? textStyle;
  CustomElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.04,
              vertical: screenSize.height * 0.019)),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
