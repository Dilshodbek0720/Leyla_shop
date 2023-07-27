import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.onTap, required this.borderColor, required this.color, required this.textColor, required this.text});
  final VoidCallback onTap;
  final Color borderColor;
  final Color textColor;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: borderColor),
            color: color,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: Text(text ,style: TextStyle(
            fontSize: 20,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            color: textColor
        ),
        ),),
      ),
    );
  }
}
