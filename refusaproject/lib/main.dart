import 'package:flutter/material.dart';

import 'package:refuseproject/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Car publish",
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        //'/home': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
