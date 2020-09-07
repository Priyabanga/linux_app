import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linux_app/screens/home.dart';
import 'package:linux_app/screens/linux.dart';
import 'package:linux_app/screens/login.dart';
import 'package:linux_app/screens/reg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "reg": (context) => MyReg(),
      "linux": (context) => MyLinux(),
      "login": (context) => MyLogin(),
    },
  ));
}
