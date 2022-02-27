import 'package:flutter/material.dart';
import 'package:todolist_flutter/shared/forms/default_form_with_text.dart';
import 'package:todolist_flutter/theme/icons.dart';

class FormsLogin extends StatefulWidget {
  const FormsLogin({ Key? key }) : super(key: key);

  @override
  _FormsLoginState createState() => _FormsLoginState();
}

class _FormsLoginState extends State<FormsLogin> {
  bool _passwordVisible = false;
  void _changePasswordVisible() => setState(()=> _passwordVisible = !_passwordVisible);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DefaultFormFieldWithText(
            titleText: "Nome de usuário",
            hint: "Chapolin_123",
            leftPadding: 20,
            icon: ProjectIcons().person,
          ),
          const SizedBox(height: 20,),
           DefaultFormFieldWithText(
            titleText: "Senha",
            icon: ProjectIcons().key,
            obscure: !_passwordVisible,
            suffixIcon: IconButton(
              onPressed: _changePasswordVisible,
              icon: Icon( _passwordVisible
                ? ProjectIcons().passwordVisible
                : ProjectIcons().passwordNotVisible
              )
            ),
            leftPadding: 20,
          ),
        ],
    );
  }
}