import 'package:flutter/material.dart';
import 'package:meu_tcc/themes/themes_colors.dart';

ThemeData MyTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  brightness: Brightness.dark,
  cardColor: Color.fromRGBO(76, 175, 80, 1),
  scaffoldBackgroundColor: Color.fromRGBO(29, 33, 27, 1),
  appBarTheme: AppBarTheme(color: Color.fromRGBO(76, 175, 80, 1)),
  textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(29, 33, 27, 1)),
      bodySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(255, 255, 255, 1),
          shadows: kElevationToShadow[8]),
      labelMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
);
