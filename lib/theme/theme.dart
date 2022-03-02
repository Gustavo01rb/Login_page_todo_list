import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData defaultTheme() => ThemeData(
  fontFamily: "Ubuntu" ,
  primaryColor: ProjectColors().primary,
  colorScheme: ColorScheme(
    brightness:   Brightness.light,
    primary:      ProjectColors().primary,
    onPrimary:    ProjectColors().secondary,
    secondary:    ProjectColors().darkPrimary,
    onSecondary:  ProjectColors().secondary,
    background:   ProjectColors().secondary,
    onBackground: ProjectColors().darkPrimary,
    error:      Colors.red,
    onError:    Colors.black,
    surface:      ProjectColors().darkPrimary,
    onSurface:    ProjectColors().secondary,
    tertiary:     ProjectColors().lightPrimary,
    tertiaryContainer: ProjectColors().darkSecondary
  ),
  textTheme: const TextTheme(
    headline1:  TextStyle(fontSize: 45, fontFamily: "Lobster", fontWeight: FontWeight.w900, color: Colors.black),
    headline2:  TextStyle(fontSize: 30, fontFamily: "Lobster"),
    headline3:  TextStyle(fontSize: 30, fontFamily: "Lobster"),
    headline4:  TextStyle(),
    bodyText2:  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    
  ),
  primaryIconTheme: IconThemeData(
    color: ProjectColors().darkPrimary,
    size: 25
  )
);