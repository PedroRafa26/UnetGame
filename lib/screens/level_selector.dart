import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';

class LevelSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Maneje el body del Scaffold con un Stack, cuyo primer widget sea el Back()
    //Luego va montando lo demás, las fuentes ya están agregadas en el pubspeck.yaml
    //así como el logo, aun estoy decidiendo si trabajar con .svg o .png por eso están las dos
    //La fuente del título es WildHazelnut y la de los números es SweetPurple
    // uso style: TextStyle(fontFamily: 'WildHazelnut')
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Back(),
          SafeArea(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Daniel aqui te toca',
                        style: TextStyle(fontFamily: 'WildHazelnut')),
                    Text('Esta para el titulo',
                        style: TextStyle(fontFamily: 'WildHazelnut')),
                    Text('Y esta para los numeros\n 1234567890',
                        style: TextStyle(fontFamily: 'SweetPurple')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
