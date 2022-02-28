import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/services/service_sign_in.dart';
import 'package:todolist_flutter/shared/buttons/default_button.dart';
import 'package:todolist_flutter/shared/dividers/or_divider.dart';
import 'package:todolist_flutter/shared/forms/default_form_with_text.dart';
import 'package:todolist_flutter/theme/icons.dart';

class FormsLogin extends StatefulWidget {
  const FormsLogin({ Key? key, required this.onSignUpPressed }) : super(key: key);
  final VoidCallback? onSignUpPressed;

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
            hint: "ex: Chapolin_123",
            controller: Provider.of<ServiceSignIn>(context, listen: false).controllerUserName,
            leftPadding: 20,
            icon: ProjectIcons().person,
          ),
          const SizedBox(height: 20,),
           DefaultFormFieldWithText(
            titleText: "Senha",
            controller: Provider.of<ServiceSignIn>(context, listen: false).controllerPassword,
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: DefaultButton(
              text: "Entrar",
              onPressed: (){},
            ),
          ),
          const Padding(
            padding:EdgeInsets.symmetric(horizontal: 30),
            child: OrDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DefaultButton(
              text: "Cadastre-se",
              color: Theme.of(context).colorScheme.primary,
              onPressed: widget.onSignUpPressed,
            ),
          ),
        ],
    );
  }
}