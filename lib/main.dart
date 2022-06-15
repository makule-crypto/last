// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:last/pages/app.dart';
// ignore: unused_import
import 'package:last/pages/home_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:last/pages/keys.dart';

void main() async {
  MpesaFlutterPlugin.setConsumerKey(kconsumerKey);
  MpesaFlutterPlugin.setConsumerSecret(kconsumerSecret);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
