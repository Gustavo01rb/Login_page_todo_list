import 'package:flutter/material.dart';

class ServiceSignIn extends ChangeNotifier{
  late bool isLogin;
  late TextEditingController controllerUserName;
  late TextEditingController controllerPassword;


  ServiceSignIn() : 
    isLogin = false, 
    controllerUserName  = TextEditingController(),
    controllerPassword = TextEditingController()
    ;

  void switchPage() { 
    isLogin = !isLogin;
    notifyListeners();
  }
}