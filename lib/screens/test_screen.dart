import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final numberOfQuestions;

  TestScreen({this.numberOfQuestions});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int numberOfRemaining = 0;
  int numberOfCorrect = 0;
  int correctRate = 0;
  int questionLeft = 0;
  int questionRight = 0;
  String operator = "";
  String answerString = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              //スコア表示部分
              _scorePart(),
              //問題表示部分
              _questionPart(),
              //電卓ボタン部分
              _calcButtons(),
              //答え合わせボタン
              _answerCheckButton(),
              //戻るボタン
              _backButton(),
            ],
          ),
          //○×画像
          _correctIncorrectImage(),
          //テスト終了メッセージ
          _endMessage(),
        ],
      ),
    ));
  }

  Widget _scorePart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Table(
        children: [
          TableRow(children: [
            Center(
              child: Text(
                "のこり問題数",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                "正解数",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                "正答率",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ]),
          TableRow(children: [
            Center(
              child: Text(
                numberOfRemaining.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                numberOfCorrect.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Center(
              child: Text(
                correctRate.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget _questionPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                questionLeft.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                operator,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                questionRight.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "=",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                answerString,
                style: TextStyle(fontSize: 60.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _calcButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50.0),
        child: Table(
          children: [
            TableRow(children: [
              _calcButton("7"),
              _calcButton("8"),
              _calcButton("9"),
            ]),
            TableRow(children: [
              _calcButton("4"),
              _calcButton("5"),
              _calcButton("6"),
            ]),
            TableRow(children: [
              _calcButton("1"),
              _calcButton("2"),
              _calcButton("3"),
            ]),
            TableRow(children: [
              _calcButton("0"),
              _calcButton("-"),
              _calcButton("C"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(String numString) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.brown,
        ),
        onPressed: () => print(numString),
        child: Text(
          numString,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  Widget _answerCheckButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.brown,
            ),
            onPressed: null,
            child: Text(
              "こたえあわせ",
              style: TextStyle(fontSize: 14.0),
            )),
      ),
    );
  }

  Widget _backButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.brown,
            ),
            onPressed: null,
            child: Text(
              "もどる",
              style: TextStyle(fontSize: 14.0),
            )),
      ),
    );
  }

  Widget _correctIncorrectImage() {
    return Center(child: Image.asset("assets/images/pic_correct.png"));
  }

  Widget _endMessage() {
    return Center(child: Text("テスト終了", style: TextStyle(fontSize: 80.0)));
  }
}
