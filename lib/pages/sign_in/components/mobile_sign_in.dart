import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/service/service_sign_in.dart';
import 'package:todolist_flutter/shared/buttons/default_button.dart';
import 'package:todolist_flutter/shared/dividers/or_divider_horizontal.dart';
import 'package:todolist_flutter/shared/forms/default_form_with_text.dart';
import 'package:todolist_flutter/shared/forms/validators.dart';
import 'package:todolist_flutter/theme/icons.dart';

class ComponentMobileSignIn extends StatefulWidget {
  const ComponentMobileSignIn({ Key? key, this.switchPages }) : super(key: key);
  final VoidCallback? switchPages;

  @override
  State<ComponentMobileSignIn> createState() => _ComponentMobileSignInState();
}

class _ComponentMobileSignInState extends State<ComponentMobileSignIn> {
  bool _passwordVisible = false;
  void _changePasswordVisible() => setState(()=> _passwordVisible = !_passwordVisible);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text("Login", style: Theme.of(context).textTheme.headline1,),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: _height*0.06),
            child: Form(
              key: Provider.of<ServiceSignIn>(context, listen: false).formKeySignIn,
              child: Column(
                children: [
                  FormDefaultWithText(
                    titleText: "Nome de usuário", 
                    validator: FormsValidators.validateUserName,
                    hint: "ex: Chapolin_123",
                    controller: Provider.of<ServiceSignIn>(context, listen: false).controllerUserName,
                    leftPadding: 20,
                    icon: ProjectIcons.person,
                  ),
                  const SizedBox(height: 20,),
                  FormDefaultWithText(
                    titleText: "Senha",
                    validator: FormsValidators.validatePassword,
                    controller: Provider.of<ServiceSignIn>(context, listen: false).controllerPassword,
                    icon: ProjectIcons.key,
                    obscure: !_passwordVisible,
                    suffixIcon: IconButton(
                    onPressed: _changePasswordVisible,
                    icon: Icon( _passwordVisible
                      ? ProjectIcons.passwordVisible
                      : ProjectIcons.passwordNotVisible
                    )),
                    leftPadding: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
                    child: ButtonDefault(
                    text: "Entrar",
                    onPressed: Provider.of<ServiceSignIn>(context, listen: false).onButtonLoginPressed,
                  ),),
            
                  const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 30),
                    child: OrDividerHorizontal(),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ButtonDefault(
                    text: "Cadastre-se",
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: widget.switchPages,
                  ),
                      ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}