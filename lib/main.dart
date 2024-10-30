import 'package:flutter/material.dart';
import 'package:flutter_application_uts/login.dart';
import 'package:flutter_application_uts/dashboard.dart';
import 'package:flutter_application_uts/register.dart';
import 'package:flutter_application_uts/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home:  SplashScreen(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/home' : (context) => MenuPage(),
          '/login' : (context) =>  LoginPage(),
          '/register' : (context) => SignupPage(),
        },
      );
  }
}
