import 'package:flutter/material.dart';

enum ButtonVariant { defaultButton, secondary, outlined, ghost, destructive, link }

Widget CustomButton({
  IconData? icon, // Optional icon
  required String text,
  Function? onPressed,
  ButtonVariant variant = ButtonVariant.defaultButton, // Default variant
  Color? iconColor,
  Color? color, // Optional background color
  Color? textColor, // Optional text color
}) {
  Color backgroundColor;
  Color defaultTextColor;
  BorderSide border;
  TextDecoration textDecoration;

  // Default styles based on the variant
  switch (variant) {
    case ButtonVariant.secondary:
      backgroundColor = Color.fromRGBO(230, 230, 230, 1);
      defaultTextColor = Colors.black;
      textDecoration = TextDecoration.none;
      break;
    case ButtonVariant.outlined:
      backgroundColor = Colors.transparent;
      defaultTextColor = Colors.grey;
      textDecoration = TextDecoration.none;
      break;
    case ButtonVariant.ghost:
      backgroundColor = Colors.transparent;
      defaultTextColor = Colors.black;
      textDecoration = TextDecoration.none;
      break;
    case ButtonVariant.destructive:
      backgroundColor = Colors.red;
      defaultTextColor = Colors.white;
      textDecoration = TextDecoration.none;
      break;
    case ButtonVariant.link:
      backgroundColor = Colors.transparent;
      defaultTextColor = Colors.blue;
      textDecoration = TextDecoration.underline;
      break;
    default: // defaultButton
      backgroundColor = Colors.amber;
      defaultTextColor = Colors.black;
      textDecoration = TextDecoration.none;
  }

  // Override the background color if 'color' parameter is provided
  if (color != null) {
    backgroundColor = color;
  }

  // Override the text color if 'textColor' parameter is provided
  final effectiveTextColor = textColor ?? defaultTextColor;

  // Border style for 'outlined' variant
  border = variant == ButtonVariant.outlined ? BorderSide(color: Colors.grey) : BorderSide.none;

  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Padding( // Add padding around the Row
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (icon != null) ...[
              Icon(icon, size: 21.0, color: iconColor ?? effectiveTextColor),
              SizedBox(width: 12.0),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 16.0, color: effectiveTextColor, decoration: textDecoration),
            ),
          ],
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: border,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding for the button itself
      ),
    ),
  );
}
