// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:last/pages/verify.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String _email, _password;
  String _phone = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signup',
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
                keyboardType: TextInputType.emailAddress,
                maxLength: 12,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.brown,
                    ),
                    hintText: 'Phone no (254xxxxxxxxx)',
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
                  this._phone = value;
                },
              ),
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
                    onPressed: () => _signup(_email, _password)),
              ],
            )
          ],
        ),
      ),
    );
  }

  _signup(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      // successful
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
