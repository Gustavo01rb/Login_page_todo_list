import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/base_sign_in_page.dart';
import '../theme/theme.dart' as mythemeclass;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Minha lista de tarefas',
                theme: mythemeclass.defaultTheme(),
                home: const BaseSignInPage());
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Minha lista de tarefas',
              theme: mythemeclass.defaultTheme(),
              home: snapshot.hasError 
              ? Container()
              : const CircularProgressIndicator()
              //TODO: Implementar página de erro e criar Wiget de Progresso
            );
          }
        });
  }
}
