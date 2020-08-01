import 'package:flutter/material.dart';
import 'package:four_unet_one/global_widgets/back.dart';
import 'package:four_unet_one/level/level.dart';

class LevelMain extends StatefulWidget {
  final List<Level> levels;
  LevelMain(this.levels);
  @override
  _LevelMainState createState() => _LevelMainState();
}

class _LevelMainState extends State<LevelMain> {
  // List<Level> prueba = [
  //   Level(
  //     id: 1,
  //     passed: false,
  //     word: 'INDUSTRIAL',
  //     message: 'Estuvo tan fácil como la carrera',
  //     letters: 'UGTINDOSTLRAIN',
  //   ),
  //   Level(
  //     id: 2,
  //     passed: false,
  //     word: 'REMY',
  //     message: 'Como dijo el chef Gusteau, cualquiera puede cocinar',
  //     letters: 'REMYMEYAMEOAPA',
  //   ),
  // ];
  Level level;
  List<Widget> input;
  List<String> inputWord;
  List<bool> letterInputSelected;
  List<dynamic> idletterSelected;
  List<String> lettersInput;
  var previousPosition;
  var letterSelected;
  var position;
  var indexSelection;
  var victory;
  dynamic flag;

  @override
  void initState() {
    flag = "-";
    level = widget.levels[0];
    idletterSelected = [];
    input =
        level.word.split("").map((e) => LetterResolveItem(letter: "")).toList();
    inputWord = [];
    position = 0;
    previousPosition = 0;
    indexSelection = 0;
    lettersInput = level.letters.split("")..shuffle();
    victory = false;
    letterInputSelected = lettersInput.map((e) => false).toList();

    super.initState();
  }

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
                          'Nivel ${level.id}',
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
                          LevelImage(id: level.id, index: 1),
                          LevelImage(id: level.id, index: 2),
                          LevelImage(id: level.id, index: 4),
                          LevelImage(id: level.id, index: 3),
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
                            children: input
                                .asMap()
                                .entries
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      print('sacate Prro');
                                      setState(() {
                                        input[e.key] =
                                            LetterResolveItem(letter: "");
                                        letterInputSelected[
                                            idletterSelected[e.key]] = false;
                                        idletterSelected[e.key] = "-";
                                        position = e.key;
                                      });
                                    },
                                    child: e.value,
                                  ),
                                )
                                .toList(),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                flag = "-";
                                position = 0;
                                previousPosition = 0;
                                print(position.toString());
                                inputWord = [];
                                input = level.word
                                    .split("")
                                    .map((e) => LetterResolveItem(letter: ""))
                                    .toList();
                                print(inputWord);
                                letterInputSelected = level.letters
                                    .split("")
                                    .map((e) => false)
                                    .toList();
                                idletterSelected = [];
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
                        children: lettersInput.asMap().entries.map((e) {
                          return InkWell(
                            onTap: (inputWord.length == level.word.length ||
                                    letterInputSelected[e.key])
                                ? () {
                                    setState(() {
                                      for (var i = 0;
                                          i < idletterSelected.length;
                                          i++) {
                                        if (idletterSelected[i] == "-") {
                                          flag = i;
                                          break;
                                        }
                                        if (i == idletterSelected.length - 1) {
                                          flag = "-";
                                        }
                                      }
                                      position = (flag == "-")
                                          ? idletterSelected.length
                                          : flag;
                                      if (previousPosition >= position) {
                                        print('Caso espacial');
                                        input[position] =
                                            LetterResolveItem(letter: e.value);
                                        letterInputSelected[e.key] = true;
                                        idletterSelected[position] = e.key;
                                        inputWord[position] = e.value;
                                        print(inputWord);
                                        print(position.toString());
                                      }
                                      if (inputWord.length ==
                                          level.word.length) {
                                        var result = inputWord.reduce(
                                            (value, element) =>
                                                value + '' + element);
                                        if (result == level.word) {
                                          victory = true;
                                        }
                                      }
                                    });
                                  }
                                : () {
                                    setState(() {
                                      letterSelected = e.value;
                                      print(letterSelected);
                                      if (idletterSelected.length != 0) {
                                        print('Entramos primera');
                                        for (var i = 0;
                                            i < idletterSelected.length;
                                            i++) {
                                          if (idletterSelected[i] == "-") {
                                            flag = i;
                                            break;
                                          }
                                          if (i ==
                                              idletterSelected.length - 1) {
                                            flag = "-";
                                          }
                                        }
                                        position = (flag == "-")
                                            ? idletterSelected.length
                                            : flag;
                                        if (previousPosition > position) {
                                          print('Caso espacial');
                                          input[position] = LetterResolveItem(
                                              letter: e.value);
                                          letterInputSelected[e.key] = true;
                                          idletterSelected[position] = e.key;
                                        } else {
                                          inputWord.add(e.value);
                                          print(input[position].toString());
                                          input[position] = LetterResolveItem(
                                              letter: e.value);
                                          idletterSelected.add(e.key);
                                          previousPosition = position;
                                          position = idletterSelected.length;
                                          print(inputWord);
                                          print(position.toString());
                                          letterInputSelected[e.key] = true;
                                        }
                                      } else {
                                        inputWord.add(e.value);
                                        print(input[position].toString());
                                        input[position] =
                                            LetterResolveItem(letter: e.value);
                                        idletterSelected.add(e.key);
                                        previousPosition = position;
                                        position = idletterSelected.length;
                                        print(inputWord);
                                        print(position.toString());
                                        letterInputSelected[e.key] = true;
                                      }
                                      if (inputWord.length ==
                                          level.word.length) {
                                        var result = inputWord.reduce(
                                            (value, element) =>
                                                value + '' + element);
                                        if (result == level.word) {
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
                                      level.message,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'SweetPurple'),
                                    ),
                                  ),
                                ),
                                (level.id != widget.levels.length)
                                    ? RaisedButton(
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
                                            level = widget.levels[level.id++];
                                            flag = "-";
                                            idletterSelected = [];
                                            input = level.word
                                                .split("")
                                                .map((e) => LetterResolveItem(
                                                    letter: ""))
                                                .toList();
                                            inputWord = [];
                                            position = 0;
                                            previousPosition = 0;
                                            indexSelection = 0;
                                            lettersInput = level.letters
                                                .split("")
                                                  ..shuffle();
                                            victory = false;
                                            letterInputSelected = lettersInput
                                                .map((e) => false)
                                                .toList();
                                            victory = false;
                                            print(victory);
                                          });
                                        },
                                      )
                                    : RaisedButton(
                                        child: Text(
                                          'Volver Al Menu',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                        color: Colors.green,
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).pop();
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

// ignore: must_be_immutable
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
