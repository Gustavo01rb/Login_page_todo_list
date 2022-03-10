import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/sign_in/base_sign_in.dart';
import 'package:todolist_flutter/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context,snapshot){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Minha lista de tarefas',
          theme: defaultTheme(),
          initialRoute: "/login",
          onGenerateRoute: (setting){
            switch (setting.name){
              case '/login':
                return MaterialPageRoute(builder: (context) => const BaseSignIn());
            }
            return null;
          },
        );
      }
    );
  }
}