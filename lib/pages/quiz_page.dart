import 'package:flutter/material.dart';
import 'package:flutter_quiz_true_false/pages/landing_page.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final _questions = const [
    {
      'questionText': 'Word 1',
      'answers': [
        {'index': 0, 'id': 'A', 'text': 'Right', 'score': 1},
        {'index': 1, 'id': 'B', 'text': 'Wrong', 'score': 0},
        {'index': 2, 'id': 'C', 'text': 'Wrong', 'score': 0},
        {'index': 3, 'id': 'D', 'text': 'Wrong', 'score': 0}
      ],
    },
    {
      'questionText': 'Word 2',
      'answers': [
        {'index': 0, 'id': 'A', 'text': 'Right', 'score': 1},
        {'index': 1, 'id': 'B', 'text': 'Wrong', 'score': 0},
        {'index': 2, 'id': 'C', 'text': 'Wrong', 'score': 0},
        {'index': 3, 'id': 'D', 'text': 'Wrong', 'score': 0}
      ],
    },
    {
      'questionText': 'Word 3',
      'answers': [
        {'index': 0, 'id': 'A', 'text': 'Right', 'score': 1},
        {'index': 1, 'id': 'B', 'text': 'Wrong', 'score': 0},
        {'index': 2, 'id': 'C', 'text': 'Wrong', 'score': 0},
        {'index': 3, 'id': 'D', 'text': 'Wrong', 'score': 0}
      ],
    },
  ];

  int _questionIndex = 0;
  var _totalScore = 0;
  List<bool> isSelected;
  bool overlayShouldBeVisible = false;
  bool isCorrect;
  bool answer0;
  bool answer1;
  bool answer2;
  bool answer3;

  @override
  void initState() {
    isSelected = [false, false, false, false];
    super.initState();
  }

  _answerQuestion(int score, String id, int index) {
    isCorrect = (score == 1);
    answer0 = (id == 'A');
    answer1 = (id == 'B');
    answer2 = (id == 'C');
    answer3 = (id == 'D');

    if (score == 1) {
      _totalScore = _totalScore + score;
    }

    if (index == 0) {
      setState(() => {
            if (isSelected[1] || isSelected[2] || isSelected[3])
              {
                isSelected[1] = false,
                isSelected[2] = false,
                isSelected[3] = false,
                isSelected[0] = !isSelected[0],
              }
            else
              {
                isSelected[0] = !isSelected[0],
                if (score == 1) {_totalScore = _totalScore - score}
              },
          });
    }
    if (index == 1) {
      setState(() => {
            if (isSelected[0] || isSelected[2] || isSelected[3])
              {
                isSelected[0] = false,
                isSelected[2] = false,
                isSelected[3] = false,
                isSelected[1] = !isSelected[1],
              }
            else
              {
                isSelected[1] = !isSelected[1],
                if (score == 1) {_totalScore = _totalScore - score}
              },
          });
    }
    if (index == 2) {
      setState(() => {
            if (isSelected[1] || isSelected[0] || isSelected[3])
              {
                isSelected[1] = false,
                isSelected[0] = false,
                isSelected[3] = false,
                isSelected[2] = !isSelected[2],
              }
            else
              {
                isSelected[2] = !isSelected[2],
                if (score == 1) {_totalScore = _totalScore - score}
              },
          });
    }
    if (index == 3) {
      setState(() => {
            if (isSelected[1] || isSelected[2] || isSelected[0])
              {
                isSelected[1] = false,
                isSelected[2] = false,
                isSelected[0] = false,
                isSelected[3] = !isSelected[3],
              }
            else
              {
                isSelected[3] = !isSelected[3],
                if (score == 1) {_totalScore = _totalScore - score}
              },
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    var check =
        (isSelected[0] || isSelected[1] || isSelected[2] || isSelected[3]);
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  //popup exit menu
                  top: 15,
                  left: -15,
                  child: ExitButton(),
                ),
                Positioned.fill(
                  top: 66,
                  bottom: 500,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(28.778)),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 85,
                  bottom: 400,
                  left: 15,
                  right: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius:
                            BorderRadius.all(Radius.circular(29.435))),
                  ),
                ),
                Positioned.fill(
                  top: 105,
                  bottom: 63,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 20),
                            color: Colors.grey[400],
                            blurRadius: 40.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text('Translate this wordbud',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5B5B5B))),
                          SizedBox(
                            height: 5,
                          ),
                          QuestionText(
                              _questions[_questionIndex]['questionText']),
                          GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 1),
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              children: <Widget>[
                                ...(_questions[_questionIndex]['answers']
                                        as List<Map<String, Object>>)
                                    .map((answer) {
                                  return Answer(() {
                                    _answerQuestion(answer['score'],
                                        answer['id'], answer['index']);
                                    return overlayShouldBeVisible == false;
                                  }, answer['text'], answer['id'], answer['index'], isSelected);
                                }).toList(),
                              ]),
                          GestureDetector(
                            onTap: check
                                ? () => setState(() {
                                      overlayShouldBeVisible = true;
                                    })
                                : null,
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Check',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: check
                                            ? Colors.white
                                            : Color.fromRGBO(0, 0, 0, .2),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: check
                                      ? Color(0xff979797)
                                      : Color(0xffE1E1E1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: check
                                            ? Color.fromRGBO(105, 105, 105, 1)
                                            : Colors.grey[400],
                                        offset: Offset(0, 5))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  //question counter
                  top: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (_questionIndex).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 22),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '/ ${_questions.length}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      height: 37,
                      width: 73,
                      decoration: BoxDecoration(
                        color: Color(0xff949494),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.black26,
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          overlayShouldBeVisible == true
              ? CorrectWrongOverlay(
                  isCorrect, answer0, answer1, answer2, answer3, () {
                  if (_questionIndex == (_questions.length - 1)) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ScorePage(_totalScore, _questions.length)),
                        (Route route) => route == null);
                    return;
                  }
                  this.setState(() {
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    isSelected[3] = false;
                    overlayShouldBeVisible = false;
                    _questionIndex = _questionIndex + 1;
                  });
                })
              : Container()
        ],
      ),
    );
  }
}

class ExitButton extends StatefulWidget {
  const ExitButton({
    Key key,
  }) : super(key: key);

  @override
  _ExitButtonState createState() => _ExitButtonState();
}

class _ExitButtonState extends State<ExitButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () => setState(() {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Do you wish to exit the quiz?'),
                    content: Text("Your progress will be lost"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()));
                        },
                        child: Text(
                          'End Quiz',
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                        child: Text(
                          'Continue Quiz',
                        ),
                      ),
                    ],
                  ));
        }),
        icon: Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
    );
  }
}
