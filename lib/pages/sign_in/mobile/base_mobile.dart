import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/components/mobile_animated_logo.dart';
import 'package:todolist_flutter/pages/sign_in/components/mobile_sign_in.dart';
import 'package:todolist_flutter/pages/sign_in/components/mobile_sign_up.dart';
import 'package:todolist_flutter/pages/sign_in/mobile/animation.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/service/service_sign_in.dart';
import 'package:todolist_flutter/shared/containers/container_backgorund_1.dart';

class BaseMobileSignIn extends StatefulWidget {
  const BaseMobileSignIn({Key? key}) : super(key: key);

  @override
  State<BaseMobileSignIn> createState() => _BaseMobileSignInState();
}

class _BaseMobileSignInState extends State<BaseMobileSignIn>
    with SingleTickerProviderStateMixin {
  late AnimationSigninPage _animationController;

  Future<void> _switchPages(BuildContext context) async {
    await _animationController.animationControllerInit.reverse();
    context.read<ServiceSignIn>().switchPage();
    await _animationController.animationControllerInit.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationSigninPage(this);
    _animationController.animationControllerInit.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
              animation: _animationController.animationControllerInit,
              builder: (context, widgets) {
                return Column(
                  children: <Widget>[
                    AnimatedLogo(animationController: _animationController),
                    Expanded(
                      child: ContainerBackground1(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Provider.of<ServiceSignIn>(context, listen: true).isLogin
                        ? ComponentMobileSignIn(switchPages: () => _switchPages(context))
                        : ComponentMobileSignUp(switchPages: ()=>  _switchPages(context),),
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}
