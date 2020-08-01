class Level {
  bool passed;
  String word, message;
  String letters;
  int id;

  Level({
    this.id,
    this.passed,
    this.word,
    this.letters,
    this.message
  });

  factory Level.fromJSON(Map<String, dynamic> json) {
    return Level(
      id: json["id"],
      word: json["word"],
      message: json["message"],
      passed: json["passed"],
      letters: json["letters"],
    );
  }
}
