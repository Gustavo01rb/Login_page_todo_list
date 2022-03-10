import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/core/app.dart';
import 'package:todolist_flutter/error/firebase_init.dart';
import 'package:todolist_flutter/theme/colors.dart';

class AppFirebase extends StatelessWidget {
  AppFirebase({ Key? key }) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) return const FirebaseInitError();
        if(snapshot.connectionState == ConnectionState.done) return const MyApp();
        return Container(
          decoration: BoxDecoration(
            color: ProjectColors.primary
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: CircularProgressIndicator(
                  color: ProjectColors.secondary,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}