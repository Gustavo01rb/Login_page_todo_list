import 'package:flutter/material.dart';
//import 'dart:io' show Platform;
import 'core/android_core.dart' as androidplatform;

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp( androidplatform.MyApp() );
}

