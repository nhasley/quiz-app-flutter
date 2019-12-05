import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../utils/question.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './score_page.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

class QuizPage extends StatefulWidget {
  final List<Map<String, Object>> questions;

  QuizPage(this.questions);
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  var _totalScore = 0;
  List<bool> isSelected;
  bool overlayShouldBeVisible = false;
  bool isCorrect;
  bool answer0;
  bool answer1;
  bool answer2;
  bool answer3;
  int timer = 20;
  String showtimer = "20";
  bool canceltimer = false;

  @override
  void initState() {
    isSelected = [false, false, false, false];
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 20;
    starttimer();
    // Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        if (_questionIndex == (widget.questions.length - 1)) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ScorePage(_totalScore, widget.questions.length)),
              (Route route) => route == null);
          return;
        }
        this.setState(() {
          isSelected[0] = false;
          isSelected[1] = false;
          isSelected[2] = false;
          isSelected[3] = false;
          _questionIndex = _questionIndex + 1;
        });
      });
    // });
  }

  _answerQuestion(int score, String id, int index) {
    isCorrect = (score == 1);
    answer0 = (id == 'A');
    answer1 = (id == 'B');
    answer2 = (id == 'C');
    answer3 = (id == 'D');
    setState(() {
      canceltimer = true;
    });
    Timer(Duration(seconds: 1), nextquestion);

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
              },
          });
    }
    if (isCorrect) {
      _totalScore = _totalScore + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  //question counter
                  top: -730,
                  child: LinearPercentIndicator(
                    lineHeight: 15,
                    percent: _questionIndex / widget.questions.length,
                    progressColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).primaryColorLight,
                  ),
                ),
                Positioned.fill(
                  top: 105,
                  bottom: 63,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                          Container(
                            alignment: Alignment.topRight,
                            child: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: timer / 20,
                              animateFromLastPercent: true,
                              center: Text(
                                showtimer,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Theme.of(context).primaryColor,
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                            ),
                          ),
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
                          Question(
                              widget.questions[_questionIndex]['questionText']),
                          GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 1),
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              children: <Widget>[
                                ...(widget.questions[_questionIndex]['answers']
                                        as List<Map<String, Object>>)
                                    .map((answer) {
                                  return Answer(() {
                                    _answerQuestion(answer['score'],
                                        answer['id'], answer['index']);
                                    return overlayShouldBeVisible == false;
                                  }, answer['text'], answer['id'],
                                      answer['index'], isSelected);
                                }).toList(),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
