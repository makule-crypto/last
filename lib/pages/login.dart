// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:last/pages/home_page.dart';
import 'package:last/pages/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Signup and Login',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        toolbarHeight: 70.0,
        elevation: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.brown,
                  ),
                  hintText: 'Email',
                  fillColor: Colors.white24,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29),
                      borderSide: BorderSide(color: Colors.brown, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2.0))),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.brown,
                      ),
                      hintText: 'Password',
                      fillColor: Colors.white24,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.brown, width: 2.0))),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    icon: Icon(
                      Icons.login,
                      color: Colors.brown,
                    ),
                    label: Text(
                      'login',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                    onLongPress: () => Fluttertoast.showToast(
                        msg: 'Sign in into your account',
                        gravity: ToastGravity.TOP_LEFT),
                    onPressed: () => _signin(_email, _password)),
                ElevatedButton.icon(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.brown,
                    ),
                    label: Text(
                      'signup',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                    onLongPress: () => Fluttertoast.showToast(
                        msg: 'Create account', gravity: ToastGravity.TOP_LEFT),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Signup()))),
              ],
            )
          ],
        ),
      ),
    );
  }

  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      // successful
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
