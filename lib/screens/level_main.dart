import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';

class LevelMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.white),
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 36,
                        ),
                        shape: CircleBorder(),
                        highlightedBorderColor: Colors.white,
                        highlightColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Nivel 1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'assets/images/layout/logo.png',
                            height: 36,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: <Widget>[
                      LevelImage(index: 1),
                      LevelImage(index: 2),
                      LevelImage(index: 4),
                      LevelImage(index: 3),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LevelImage extends StatelessWidget {
  int index;
  LevelImage({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .20,
        width: MediaQuery.of(context).size.width * .40,
        child: Image.asset(
          'assets/images/levels/level1-${index.toString()}.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
