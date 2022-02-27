import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/aniamtion.dart';
import 'package:todolist_flutter/pages/sign_in/components/animated_logo.dart';
import 'package:todolist_flutter/pages/sign_in/components/component_login.dart';
import 'package:todolist_flutter/services/service_sign_in.dart';
import 'package:todolist_flutter/shared/containers/container_top_rounded.dart';
import 'package:provider/provider.dart';

class BaseSignInPage extends StatefulWidget {
  const BaseSignInPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<BaseSignInPage>
    with SingleTickerProviderStateMixin {
  late AnimationSigninPage _animationClassController;

  @override
  void initState() {
    super.initState();
    _animationClassController = AnimationSigninPage(this);
    _animationClassController.animationControllerInit.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ServiceSignIn(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
              animation: _animationClassController.animationControllerInit,
              builder: (context, widget) {
                return Column(
                  children: <Widget>[
                    AnimatedLogo(animationClassController: _animationClassController),
                    const Expanded(
                        child: ContainerTopRounded(
                          width: double.infinity,
                          child: ComponentLogin(),
                        ))
                  ],
                );
              }),
        )),
    );
  }
}
