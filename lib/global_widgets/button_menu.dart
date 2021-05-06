import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    Key key,
    this.colors,
    this.direction,
    this.icon,
    this.menuLabel,
  }) : super(key: key);
  final List<Color> colors;
  final int direction;
  final IconData icon;
  final String menuLabel;

  @override
  Widget build(BuildContext context) {
    var tHeight = MediaQuery.of(context).size.height;
    var tWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        BackButtonMenu(
          tHeight: tHeight,
          tWidth: tWidth,
          colors: colors,
          direction: direction,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: (direction == 0)
              ? <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        menuLabel,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      ClipPath(
                        clipper: BottomLineClipper(),
                        child: Container(
                          height: 10,
                          width: tWidth * .4,
                          color: Colors.white12,
                        ),
                      ),
                    ],
                  ),
                ]
              : <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        menuLabel,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      ClipPath(
                        clipper: BottomLineClipper(),
                        child: Container(
                          height: 10,
                          width: tWidth * .4,
                          color: Colors.white12,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
        ),
      ],
    );
  }
}

class BackButtonMenu extends StatelessWidget {
  final double tHeight;
  final double tWidth;
  final int direction;
  final List<Color> colors;

  const BackButtonMenu({
    Key key,
    this.colors,
    this.tHeight,
    this.tWidth,
    this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: direction,
      child: ClipPath(
        clipper: MenuClipper(),
        child: Container(
          height: tHeight * .10,
          width: tWidth * .7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              List: colors,
              // tileMode: TileMode.clamp,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width / 2, 10, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = size.width * .1;
    Path path = Path()
      ..lineTo(0, size.height - roundnessFactor)
      ..quadraticBezierTo(
          0, size.height * .8, roundnessFactor, size.height * .83)
      ..lineTo(size.width - roundnessFactor, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - roundnessFactor)
      ..lineTo(size.width, roundnessFactor)
      ..quadraticBezierTo(
          size.width, 0, size.width - roundnessFactor, size.height * .03)
      ..lineTo(roundnessFactor, size.height * .17)
      ..quadraticBezierTo(0, size.height * .2, 0, roundnessFactor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
