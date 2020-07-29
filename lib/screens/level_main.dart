import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';
import 'package:four_unet_one/level/level.dart';

class LevelMain extends StatefulWidget {
  @override
  _LevelMainState createState() => _LevelMainState();
}

class _LevelMainState extends State<LevelMain> {
  List<Level> pruebas = [
    Level(
      id: 1,
      passed: false,
      word: 'INDUSTRIAL',
      message: 'Estuvo tan fácil como la carrera',
      letters: 'UGTINDOSTLRAIN',
    ),
    Level(
      id: 2,
      passed: false,
      word: 'REMY',
      message: 'Como dijo el chef Gusteau, cualquiera puede cocinar',
      letters: 'AEGOMRLKASDYFI',
    ),
  ];
  Level prueba;
  List<Widget> input;
  List<String> inputWord;
  List<bool> letterInputSelected;
  var letterSelected;
  var position;
  var indexSelection;
  var victory;

  @override
  void initState() {
    prueba=pruebas[0];
    input = prueba.word
        .split("")
        .map((e) => LetterResolveItem(letter: ""))
        .toList();
    inputWord = [];
    position = 0;
    indexSelection = 0;
    victory = false;
    letterInputSelected = prueba.letters.split("").map((e) => false).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> letters = prueba.letters.split("");
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
                          'Nivel ${prueba.id}',
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
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          LevelImage(id: prueba.id, index: 1),
                          LevelImage(id: prueba.id, index: 2),
                          LevelImage(id: prueba.id, index: 4),
                          LevelImage(id: prueba.id, index: 3),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: input,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                position = 0;
                                print(position.toString());
                                inputWord = [];
                                input = prueba.word
                                    .split("")
                                    .map((e) => LetterResolveItem(letter: ""))
                                    .toList();
                                print(inputWord);
                                letterInputSelected = prueba.letters
                                    .split("")
                                    .map((e) => false)
                                    .toList();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LayoutBuilder(builder: (context, box) {
                      var buttonWidth = box.maxWidth / 9;
                      var buttonHeigth = box.maxHeight / 3;
                      return Wrap(
                        children: letters.asMap().entries.map((e) {
                          return InkWell(
                            onTap: (position == prueba.word.length ||
                                    letterInputSelected[e.key])
                                ? () {}
                                : () {
                                    setState(() {
                                      letterSelected = e.value;
                                      print(letterSelected);
                                      inputWord.add(e.value);
                                      print(input[position].toString());
                                      input[position] =
                                          LetterResolveItem(letter: e.value);
                                      position++;
                                      print(inputWord);
                                      print(position.toString());
                                      letterInputSelected[e.key] = true;
                                      if (position == prueba.word.length) {
                                        var result = inputWord.reduce(
                                            (value, element) =>
                                                value + '' + element);
                                        if (result == prueba.word) {
                                          victory = true;
                                        }
                                      }
                                    });
                                  },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: (letterInputSelected[e.key])
                                        ? Colors.transparent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                height: buttonHeigth,
                                width: buttonWidth,
                                child: (letterInputSelected[e.key])
                                    ? SizedBox()
                                    : Center(
                                        child: Text(
                                          e.value.toUpperCase(),
                                          style: TextStyle(
                                              color: Color(0xFF03245E),
                                              fontSize: 24,
                                              fontFamily: 'SweetPurple'),
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
          (victory)
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x33000000),
                  child: Center(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(240),
                        topRight: Radius.circular(200),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(410),
                      ),
                      color: Color(0xAA03245E),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .6,
                        width: MediaQuery.of(context).size.width * .8,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '! Completado !',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 48,
                                      fontFamily: 'SweetPurple'),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Center(
                                    child: Text(
                                      prueba.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'SweetPurple'),
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  child: Text(
                                    'Siguiente',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  color: Colors.green,
                                  shape: StadiumBorder(),
                                  onPressed: () {
                                    setState(() {
                                      prueba=pruebas[prueba.id++];
                                      position = 0;
                                print(position.toString());
                                inputWord = [];
                                input = prueba.word
                                    .split("")
                                    .map((e) => LetterResolveItem(letter: ""))
                                    .toList();
                                print(inputWord);
                                letterInputSelected = prueba.letters
                                    .split("")
                                    .map((e) => false)
                                    .toList();
                                      victory = false;
                                      print(victory);
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class LetterResolveItem extends StatelessWidget {
  LetterResolveItem({
    Key key,
    this.letter,
  }) : super(key: key);

  var letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            letter,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Container(
            color: Colors.white54,
            height: 2,
            width: MediaQuery.of(context).size.width * .045,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LevelImage extends StatelessWidget {
  int id;
  int index;
  LevelImage({
    Key key,
    this.id,
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
          'assets/images/levels/level${id.toString()}-${index.toString()}.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
