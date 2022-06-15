import 'package:flutter/material.dart';
import 'package:last/pages/login.dart';
//import 'package:signin/src/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.grey,
        fontFamily: 'indieflower',
        // backgroundColor: Colors.brown,
      ),
      home: LoginScreen(),
    );
  }
}
