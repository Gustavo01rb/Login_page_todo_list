import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/services/service_sign_in.dart';
import 'package:todolist_flutter/shared/buttons/default_button.dart';
import 'package:todolist_flutter/shared/forms/default_form_with_text.dart';
import 'package:todolist_flutter/shared/forms/validators.dart';
import 'package:todolist_flutter/theme/icons.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({ Key? key }) : super(key: key);

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  bool _passwordVisible = false;
  void _changePasswordVisible() => setState(()=> _passwordVisible = !_passwordVisible);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          children: [
            DefaultFormFieldWithText(
              titleText: "Nome Completo",
              hint: "João Silva",
              leftPadding: 20,
              validator: FormsValidators().validateName,
              icon: ProjectIcons().person2,
            ),
            const SizedBox(height: 20,),
            DefaultFormFieldWithText(
              titleText: "Nome de usuário",
              hint: "ex: Chapolin_123",
              controller: Provider.of<ServiceSignIn>(context, listen: false).controllerUserName,
              leftPadding: 20,
              validator: FormsValidators().validateUserName,
              icon: ProjectIcons().person,
              suffixIcon: Tooltip(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary
                ),
                message: "Nome que será usado para realizar login.",
                child: Icon(ProjectIcons().information),
              ),
            ),
            const SizedBox(height: 20,),
             DefaultFormFieldWithText(
              titleText: "Senha",
              hint:"Pelo menos 4 carcteres",
              controller: Provider.of<ServiceSignIn>(context, listen: false).controllerPassword,
              icon: ProjectIcons().key,
              obscure: !_passwordVisible,
              validator: FormsValidators().validatePassword,
              suffixIcon: IconButton(
                onPressed: _changePasswordVisible,
                icon: Icon( _passwordVisible
                  ? ProjectIcons().passwordVisible
                  : ProjectIcons().passwordNotVisible
                )
              ),
              leftPadding: 20,
            ),
            const SizedBox(height: 20,),
            DefaultFormFieldWithText(
              titleText: "Data de nascimento",
              hint: "DD/MM/AAAA",
              mask: FormsMasks().maskDate,
              textInputType: TextInputType.datetime,
              validator: FormsValidators().validateDateTime,
              leftPadding: 20,
              icon: ProjectIcons().calendar,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10, top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                    text: "Cadastrar",
                    width: 250,
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        print("Funfou");

                      }
                    },
                  ),
                ],
              ),
            ),
          ]
        ),
    );
  }
}