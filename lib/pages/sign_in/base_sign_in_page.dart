import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/aniamtion.dart';
import 'package:todolist_flutter/pages/sign_in/components/animated_logo.dart';
import 'package:todolist_flutter/pages/sign_in/components/sign_in/component_login.dart';
import 'package:todolist_flutter/pages/sign_in/components/sign_up/component_sign_up.dart';
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
   Future<void> _switchPages(BuildContext context)async{
      await _animationClassController.animationControllerInit.reverse();
      context.read<ServiceSignIn>().switchPage();
      await _animationClassController.animationControllerInit.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceSignIn(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
              animation: _animationClassController.animationControllerInit,
              builder: (context, widgets) {
                return Column(
                  children: <Widget>[
                    AnimatedLogo(animationClassController: _animationClassController),
                    Expanded(
                        child: ContainerTopRounded(
                          width: double.infinity,
                          child: Provider.of<ServiceSignIn>(context, listen: false).isLogin
                          ? ComponentSignUp(switchPages: () => _switchPages(context),)
                          : ComponentLogin(switchPages: () => _switchPages(context),),
                        ))
                  ],
                );
              }),
        )),
    );
  }
}
