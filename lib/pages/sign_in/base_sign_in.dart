import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/core/app_info.dart';
import 'package:todolist_flutter/pages/sign_in/mobile/base_mobile.dart';
import 'package:todolist_flutter/service/service_sign_in.dart';

class BaseSignIn extends StatelessWidget {
  const BaseSignIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => ServiceSignIn(),
      child: _width < AppInfo.maxSizeMobile
      ? const BaseMobileSignIn()
      : Container()
    );
  }
}