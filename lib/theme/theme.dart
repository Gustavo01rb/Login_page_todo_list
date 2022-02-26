import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData defaultTheme() => ThemeData(
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

  ) 
);