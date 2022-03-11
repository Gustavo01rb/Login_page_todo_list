import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormsMasks{
   MaskTextInputFormatter maskDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
}

class FormsValidators{

  static String? validateName(String? value){
    if(value == null || value.isEmpty) return "Esse campo é obrigatório!";
    if (value.trim().split(' ').length <= 1) return "Preencha seu nome completo";
    return null;
  }
  static String? validateUserName(String? value){
    if(value == null || value.isEmpty) return "Esse campo é obrigatório!";
    if(value.length < 3) return "Seu nome de usuário deve conter pelo menos 3 caracteres";

    final nameExp = RegExp(r'^[a-zA-Z0-9@#$_]+$');
    if(nameExp.hasMatch(value.trim())) return null;
    return "O nome de usuário não deve conter espaços.";
  }
  static String? validatePassword(String? value){
    if(value == null || value.isEmpty) return "Esse campo é obrigatório!";
    if(value.trim().length < 4) return "Sua senha deve conter pelo menos 4 caracteres";
    return null;
  }
  static String? validateDateTime(String? value){
    if(value == null || value.isEmpty) return "Esse campo é obrigatório!";
    if(value.trim().length < 10) return "Informe a data corretamente segundo o parâmetro: DD/MM/AAAA";
    final nameExp = RegExp(r'^\d\d/\d\d/\d\d\d\d$');
    if(nameExp.hasMatch(value)) return null;
    return "Por favor não tente burlar o sistema de segurança do aplicativo";
  }
}