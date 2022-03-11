
import 'package:flutter/cupertino.dart';

class ServiceSignIn extends ChangeNotifier{
  late bool isLogin;
  late TextEditingController controllerUserName;
  late TextEditingController controllerPassword;
  late GlobalKey<FormState>  formKeySignIn;
  late GlobalKey<FormState>  formKeySignUp;



  ServiceSignIn(): 
    isLogin = true, 
    controllerUserName = TextEditingController(),
    controllerPassword = TextEditingController(),
    formKeySignIn      = GlobalKey<FormState>(),
    formKeySignUp      = GlobalKey<FormState>();

  
  void switchPage() { 
    isLogin = !isLogin;
    notifyListeners();
  }

  void onButtonLoginPressed(){
    if(formKeySignIn.currentState!.validate())
      print("Funfa");
  }
  void onButtonSiginUpPressed(){
    if(formKeySignUp.currentState!.validate())
      print("Funfa");
  }
}