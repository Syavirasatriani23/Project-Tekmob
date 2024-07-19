import 'package:flutter/material.dart';
import 'package:nutridish/home_page.dart';
import 'package:nutridish/start_page.dart';
import 'package:nutridish/login_page.dart';
import 'package:nutridish/register_page.dart';

void main() {
  runApp(NutridishApp());
}

class NutridishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutridish',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
