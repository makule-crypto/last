import 'dart:async';

import 'package:flutter/material.dart';
import 'package:last/pages/receipt.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => Receipts(),
        ),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitCircle(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
