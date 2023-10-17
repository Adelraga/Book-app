import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.title,
      required this.textColor,
      required this.buttonColor,
      this.borderRadius, this.onPressed});
  final String title;
  final Color textColor;
  final Color buttonColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: Styles.textStyle18
              .copyWith(color: textColor, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
