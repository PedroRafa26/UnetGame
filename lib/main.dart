import 'package:flutter/material.dart';
import 'package:four_unet_one/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unetmes',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Menu(),
    );
  }
}