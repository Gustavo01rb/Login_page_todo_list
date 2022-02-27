import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/components/forms_login.dart';

class ComponentLogin extends StatelessWidget {
  const ComponentLogin({ Key? key, required this.switchPages }) : super(key: key);
  final VoidCallback? switchPages;
  

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
            child: FormsLogin(onSignUpPressed: switchPages,),
          ),
          const SizedBox()

      ],
    );
  }
}