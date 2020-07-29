import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:four_unet_one/screens/menu.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unetmes',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'WildHazelnut',
      ),
      home: Menu(),
    );
  }
}
