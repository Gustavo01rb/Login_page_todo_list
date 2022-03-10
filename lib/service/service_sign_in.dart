
import 'package:flutter/cupertino.dart';

class ServiceSignIn extends ChangeNotifier{
  late bool isLogin;
  late TextEditingController controllerUserName;
  late TextEditingController controllerPassword;
  late GlobalKey<FormState>  formKeySignIn;


  ServiceSignIn(): 
    isLogin = true, 
    controllerUserName = TextEditingController(),
    controllerPassword = TextEditingController(),
    formKeySignIn      = GlobalKey<FormState>();
  
  void switchPage() { 
    isLogin = !isLogin;
    notifyListeners();
  }

  void onButtonLoginPressed(){
    if(formKeySignIn.currentState!.validate())
      print("Funfa");
  }
}