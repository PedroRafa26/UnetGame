import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';

class Who extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          Container(
            child: Center(
              child: Text('Sección en Construcción'),
            ),
          ),
        ],
      ),
    );
  }
}
