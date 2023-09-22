import 'dart:io';

import 'package:flutter/material.dart';

abstract class Styles {

  static const Color grey1         = Color(0xFFA4A4A4);
  static const Color grey2         = Color(0xFFF5F5F5);
  static const Color grey3         = Color(0xFFF8F8F8);
  static const Color grey4         = Color(0xFFD5D5D5);
  static const Color black         = Color(0xFF101010);
  static const Color blue1         = Color(0xFF0D47A1);
  static const Color blue2         = Color(0xFF0C4FB7);
  static const Color blue3         = Color(0xFF007AFF);

  static Color bottonShadowColor = const Color(0xFF292B32).withOpacity(0.12);
  static Color appBarStrokeColor = const Color(0xFFE6E6E6);

  static Color textFieldsStrokeColor = const Color(0xFFEEEEEE);

  static Color requestNewOtpGreyTimerColor = const Color(0xFFBBBBBB);

  static Color checkboxBorderColor = const Color(0xFFc5c5c5);

  static Color labelGreyMedium = const Color(0xFFA0A0A0);

  static const TextStyle defaultStyleFont = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static ThemeData mainThemeData() {
    return ThemeData(
      useMaterial3: true,
      bannerTheme: const MaterialBannerThemeData(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Styles.whiteMaterial,
      primaryColor: Styles.blue1,
      fontFamily: "Mona-Sans",
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent
      ),
      textTheme: const TextTheme(
        displayLarge:   TextStyle(color: Colors.black), //fontsize: 64
        displayMedium:  TextStyle(color: Colors.black), //fontsize: 45
        displaySmall:   TextStyle(color: Colors.black), //fontsize: 36
        headlineLarge:  TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34, letterSpacing: -1), //fontsize: 32
        headlineMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w700), //fontsize: 28
        headlineSmall:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24), //fontsize: 24
        titleLarge:     TextStyle(color: Colors.black, fontWeight: FontWeight.w700), //fontsize: 22
        titleMedium:    TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17, letterSpacing: 0.6), //fontsize: 16
        titleSmall:     TextStyle(color: Colors.black), //fontsize: 14
        bodyLarge:      TextStyle(color: Colors.black, fontSize: 17, letterSpacing: 0.6), //fontsize: 17
        bodyMedium:     TextStyle(color: Colors.black, fontSize: 15), //fontsize: 14
        bodySmall:      TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500), //fontsize: 12
        labelLarge:     TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17, letterSpacing: 2), //fontsize: 14
        labelMedium:    TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: 0.6), //fontsize: 12
        labelSmall:     TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12, letterSpacing: 0.8), //fontsize: 11
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }

  static TextStyle defaultFontStyleWithWeight(
      FontStyle style,
      Color color,
      FontWeight weight,
      { double fontSize = 16,
        TextDecoration decoration = TextDecoration.none,
        backgroundColor = Colors.transparent,
      })
  {
    return TextStyle(
        fontStyle: style,
        fontSize: fontSize,
        color: color,
        fontWeight: weight,
        decoration: decoration,
        backgroundColor: backgroundColor
    );
  }

  static Decoration defaultContainerDecoration({double borderRadius = 4, double blurRadius = 8.0, Color backgroundColor = Colors.white}) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          blurRadius: 8.0,
          spreadRadius: 0.0,
          offset: const Offset(
            0.0, 0.0,
          ),
        ),
      ],
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  static const defaultCornerRadiusValue = 20.0;
  static const defaultCornerRadiusValueContentImage = 12.0;

  static const MaterialColor blackMaterial = MaterialColor(0xFF161616, {
    50: Color.fromRGBO(22, 22, 22, .1),
    100: Color.fromRGBO(22, 22, 22, .2),
    200: Color.fromRGBO(22, 22, 22, .3),
    300: Color.fromRGBO(22, 22, 22, .4),
    400: Color.fromRGBO(22, 22, 22, .5),
    500: Color.fromRGBO(22, 22, 22, .6),
    600: Color.fromRGBO(22, 22, 22, .7),
    700: Color.fromRGBO(22, 22, 22, .8),
    800: Color.fromRGBO(22, 22, 22, .9),
    900: Color.fromRGBO(22, 22, 22, 1),
  });

  static const MaterialColor blueMaterial = MaterialColor(0xFF00A3FF, {
    50:  Color.fromRGBO(0, 163, 255, .1),
    100: Color.fromRGBO(0, 163, 255, .2),
    200: Color.fromRGBO(0, 163, 255, .3),
    300: Color.fromRGBO(0, 163, 255, .4),
    400: Color.fromRGBO(0, 163, 255, .5),
    500: Color.fromRGBO(0, 163, 255, .6),
    600: Color.fromRGBO(0, 163, 255, .7),
    700: Color.fromRGBO(0, 163, 255, .8),
    800: Color.fromRGBO(0, 163, 255, .9),
    900: Color.fromRGBO(0, 163, 255, 1),
  });

  static const MaterialColor whiteMaterial = MaterialColor(0xFFFFFFFF, {
    50:  Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  });

  static BoxDecoration backgroundGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 1),
          Color.fromRGBO(249, 249, 249, 1),
        ],
      )
  );

  static List<BoxShadow>? defaultShadow = [
    BoxShadow(
      color: bottonShadowColor,
      blurRadius: 8.0,
      spreadRadius: 0.0,
      offset: const Offset(
        0.0, 2.0,
      ),
    ),
  ];

}