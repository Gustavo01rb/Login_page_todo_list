import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/pages/sign_in/aniamtion.dart';
import 'package:todolist_flutter/services/service_sign_in.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key, required this.animationClassController})
      : super(key: key);
  final AnimationSigninPage animationClassController;

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: !Provider.of<ServiceSignIn>(context, listen: false).isLogin 
      ? _height * widget.animationClassController.emergeContainer.value
      : _height * widget.animationClassController.emergeContainerSignup.value,
      child: Transform.rotate(
        angle: widget.animationClassController.rotateIcon.value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon.png",
              width: widget.animationClassController.sizeLogo.value,
            ),
            Image.asset(
              "assets/images/logoText.png",
              width: widget.animationClassController.sizeLogoText.value,
            ),
          ],
        ),
      ),
    );
  }
}
