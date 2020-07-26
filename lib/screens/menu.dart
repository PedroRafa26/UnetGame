import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';
import 'package:four_unet_one/screens/level_selector.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          Center(
            child: RaisedButton(
              child: Text('Ver Niveles'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LevelSelector(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
