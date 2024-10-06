import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.ic,
    this.backgroundColor,
    this.borderColor,
    this.borderRaduis,
    this.boderWidth,
    required this.height,
    this.onTap,
    this.textColor,
    this.boxShadowColor,
    required this.fontSize,
  });

  final String label;
  final String? ic;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRaduis;
  final double? boderWidth;
  final double height;
  final double fontSize;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? boxShadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor!, width: boderWidth!),
            borderRadius: BorderRadius.circular(borderRaduis!),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  blurStyle: BlurStyle.solid,
                  // blurStyle: BlurStyle.inner,
                  color: boxShadowColor ?? Colors.transparent,
                  offset: const Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
