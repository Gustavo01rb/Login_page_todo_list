import 'package:flutter/material.dart';
import 'dart:math';

class AnimationSigninPage {
  late AnimationController animationControllerInit;
  late Animation<double> rotateIcon;
  late Animation<double> emergeContainer;
  late Animation<double> emergeContainerSignup;
  late Animation<double> sizeLogo;
  late Animation<double> sizeLogoText;

  AnimationSigninPage(TickerProvider vsync) {
    animationControllerInit = AnimationController(duration: const Duration(seconds: 2), vsync: vsync);
    rotateIcon = Tween<double>(
      begin: 0, 
      end: 2 * pi
    ).animate(
        CurvedAnimation(
          parent: animationControllerInit, 
          curve: const Interval(0, 0.7, curve: Curves.easeOutBack)));
    emergeContainer = Tween<double>(
      begin: 1, 
      end: 0.3
    ).animate(
        CurvedAnimation(
          parent: animationControllerInit, 
          curve: const Interval(0.7, 1, curve: Curves.easeOutBack)));
    emergeContainerSignup = Tween<double>(
      begin: 1, 
      end: 0.2
    ).animate(
        CurvedAnimation(
          parent: animationControllerInit, 
          curve: const Interval(0.7, 1, curve: Curves.easeOutBack)));
    sizeLogo = Tween<double>(
      begin: 150, 
      end: 0
    ).animate(
        CurvedAnimation(
          parent: animationControllerInit, 
          curve: const Interval(0.8, 0.9, curve: Curves.easeOutBack)));
    sizeLogoText = Tween<double>(
      begin: 0, 
      end: 250
    ).animate(
        CurvedAnimation(
          parent: animationControllerInit, 
          curve: const Interval(0.9, 1, curve: Curves.easeOutBack)));
  }
}
