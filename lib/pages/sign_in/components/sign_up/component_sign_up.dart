import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/components/sign_up/forms_sign_up.dart';
import 'package:todolist_flutter/theme/icons.dart';

class ComponentSignUp extends StatelessWidget {
  const ComponentSignUp({ Key? key, required this.switchPages }) : super(key: key);
  final VoidCallback? switchPages;

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
              onPressed: switchPages, 
              icon: Icon(ProjectIcons().arrowBack, size: 40,)
            ),
            Text("Cadastrar", style: Theme.of(context).textTheme.headline1,)
          ],
        ),
         Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: _height*0.06),
            child: FormSignUp()
         )
      ]
    );
  }
}