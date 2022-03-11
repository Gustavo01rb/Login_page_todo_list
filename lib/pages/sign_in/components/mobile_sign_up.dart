import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/service/service_sign_in.dart';
import 'package:todolist_flutter/shared/buttons/default_button.dart';
import 'package:todolist_flutter/shared/forms/default_form_with_text.dart';
import 'package:todolist_flutter/shared/forms/validators.dart';
import 'package:todolist_flutter/theme/icons.dart';

class ComponentMobileSignUp extends StatefulWidget {
  const ComponentMobileSignUp({Key? key, required this.switchPages})
      : super(key: key);
  final VoidCallback? switchPages;

  @override
  State<ComponentMobileSignUp> createState() => _ComponentMobileSignUpState();
}

class _ComponentMobileSignUpState extends State<ComponentMobileSignUp> {
  bool _passwordVisible = false;
  void _changePasswordVisible() =>
      setState(() => _passwordVisible = !_passwordVisible);
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: widget.switchPages,
                  icon: Icon(
                    ProjectIcons.arrowBack,
                    size: 40,
                  )),
              Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: _height * 0.06),
              child: Form(
                  key: Provider.of<ServiceSignIn>(context, listen: false)
                      .formKeySignUp,
                  child: Column(children: [
                    FormDefaultWithText(
                      titleText: "Nome Completo",
                      hint: "ex: João Silva",
                      leftPadding: 20,
                      validator: FormsValidators.validateName,
                      icon: ProjectIcons.person2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormDefaultWithText(
                      titleText: "Nome de usuário",
                      hint: "ex: Chapolin_123",
                      controller:
                          Provider.of<ServiceSignIn>(context, listen: false)
                              .controllerUserName,
                      leftPadding: 20,
                      validator: FormsValidators.validateUserName,
                      icon: ProjectIcons.person,
                      suffixIcon: Tooltip(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary),
                          message: "Nome que será usado para realizar login.",
                          child: Icon(ProjectIcons.information)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormDefaultWithText(
                      titleText: "Senha",
                      hint: "Pelo menos 4 carcteres",
                      controller:
                          Provider.of<ServiceSignIn>(context, listen: false)
                              .controllerPassword,
                      icon: ProjectIcons.key,
                      obscure: !_passwordVisible,
                      validator: FormsValidators.validatePassword,
                      suffixIcon: IconButton(
                          onPressed: _changePasswordVisible,
                          icon: Icon(_passwordVisible
                              ? ProjectIcons.passwordVisible
                              : ProjectIcons.passwordNotVisible)),
                      leftPadding: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 10, top: 40, bottom: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonDefault(
                                  text: "Cadastrar",
                                  width: 250,
                                  onPressed: Provider.of<ServiceSignIn>(context,
                                          listen: false)
                                      .onButtonSiginUpPressed)
                            ]))
                  ])))
        ]);
  }
}
