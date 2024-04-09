import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App basic colors
  static const Color primary = Color(0XFFF4F7FE);
  static const Color secondary = Color(0xffDB8C09);
  static const Color accent = Color(0xFF00A884);

  // Gradient colors
  static Gradient kDarkGradientBackgroundColor = LinearGradient(
    colors: [
      blackBg, // bottom color
      blackBg.withOpacity(0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.70, 1.0],
  );

  static Gradient kLightGradientBackgroundColor = LinearGradient(
    colors: [
      whiteBg, // bottom color
      whiteBg.withOpacity(0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [0.70, 1.0],
  );

  // Text colors

  // Background colors
  static const Color blackBg = Color(0xff121b22);
  static const Color whiteBg = Color(0xFFFFFFFF);

  // Background container color
  static const Color pineGreen = Color(0xFF008069);

  // Button colors

  //Border colors

  // Error and validation color

  // Neutral shades
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF333333);
  static const Color lightGray = Color(0xFFBBBBBB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyBg = Color(0XFF1F2C34);

  // Custom Snackbar Colors
  static const Color failedBackgroundColor = Color(0xFFC72C41);
  static const Color failedAssetsColor = Color(0xFF801336);

  static const Color successBackgroundColor = Color(0xFF346E45);
  static const Color successAssetsColor = Color(0xFF214D34);

  static const Color warningBackgroundColor = Color(0xFFE09147);
  static const Color warningAssetsColor = Color(0xFFBD5D30);
}
