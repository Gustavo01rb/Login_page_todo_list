import 'package:flutter/material.dart';
import 'package:todolist_flutter/theme/colors.dart';

class FirebaseInitError extends StatelessWidget {
  const FirebaseInitError({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      decoration: BoxDecoration(
        color: ProjectColors.darkSecondary
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: <Widget> [
          Icon(
            Icons.warning,
            size: 80,
            color: ProjectColors.secondary, 
            textDirection: TextDirection.ltr,),
            const SizedBox(height: 20,),
            const Text(
              "Ops, parece que não foi possível se conectar ao banco de dados.",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}