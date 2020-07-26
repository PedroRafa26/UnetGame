import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF03245E),
            Color(0xFF6b2a7b),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
      ),
    );
  }
}
