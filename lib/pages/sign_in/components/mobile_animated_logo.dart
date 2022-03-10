import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/pages/sign_in/mobile/animation.dart';
import 'package:todolist_flutter/service/service_sign_in.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key, required this.animationController})
      : super(key: key);
  final AnimationSigninPage animationController;

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: !Provider.of<ServiceSignIn>(context, listen: false).isLogin 
      ? _height * widget.animationController.emergeContainer.value
      : _height * widget.animationController.emergeContainerSignup.value,
      child: Transform.rotate(
        angle: widget.animationController.rotateIcon.value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon.png",
              width: widget.animationController.sizeLogo.value,
            ),
            Image.asset(
              "assets/images/logoText.png",
              width: widget.animationController.sizeLogoText.value,
            ),
          ],
        ),
      ),
    );
  }
}
