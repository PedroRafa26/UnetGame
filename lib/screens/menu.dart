import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';
import 'package:four_unet_one/global_widgets/button_menu.dart';
import 'package:four_unet_one/screens/level_main.dart';
import 'package:four_unet_one/screens/level_selector.dart';
import 'package:four_unet_one/screens/who.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
    bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // SvgPicture.asset(
                  //   'assets/images/layout/logo.svg'
                  //   semanticsLabel: 'Unetmes Logo'
                  // ),
                  Image.asset('assets/images/layout/logo.png'),
                  Text(
                    'Nombre del juego',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LevelMain()),
                      );
                    },
                    child: ButtonMenu(
                      colors: [
                        Color(0xFF00e07f),
                        Color(0xff349061),
                        Color(0xff00e07f),
                      ],
                      menuLabel: 'Jugar',
                      icon: Icons.play_circle_outline,
                      direction: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => LevelSelector()),
                      );
                    },
                    child: ButtonMenu(
                      colors: [
                        Color(0xFFd68839),
                        Color(0xffff6633),
                        Color(0xffe07f37),
                      ],
                      menuLabel: 'Ver Niveles',
                      icon: Icons.remove_circle_outline,
                      direction: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Who()),
                      );
                    },
                    child: ButtonMenu(
                      colors: [
                        Color(0xFFfb677d),
                        Color(0xffff5858),
                        Color(0xfffc5777),
                      ],
                      menuLabel: '¿ Qué Somos ?',
                      icon: Icons.info_outline,
                      direction: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        more = true;
                      });
                      print(more);
                    },
                    child: ButtonMenu(
                      colors: [
                        Color(0xFF17d5f9),
                        Color(0xff03c4fe),
                        Color(0xff33ecf2),
                      ],
                      menuLabel: 'Algo más ...',
                      icon: Icons.add_circle_outline,
                      direction: 2,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Mas que una universidad,\nsomos un meme.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          (more)
              ? Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo[900],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'De momento solo tenemos esto.\nLo sentimos.\n #UnetenseLivesMatter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                more = false;
                                print(more);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
