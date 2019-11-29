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
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Word 1", false),
    Question("Word 2", false),
    Question("Word 3", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
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
                                  QuestionText(questionText),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AnswerButton(true,
                                      () => handleAnswer(true)), //true button
                                  AnswerButton(
                                      false,
                                      () => handleAnswer(false)), // false button
                                ],
                              )))),
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
                                (questionNumber).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '/ ${quiz.length}',
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
                          )),
                    ),
                  ),
                ],
              ),
            ),
            overlayShouldBeVisible == true
                ? CorrectWrongOverlay(isCorrect, () {
                    if (quiz.length == questionNumber) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ScorePage(quiz.score, quiz.length)),
                          (Route route) => route == null);
                      return;
                    }
                    currentQuestion = quiz.nextQuestion;
                    this.setState(() {
                      overlayShouldBeVisible = false;
                      questionText = currentQuestion.question;
                      questionNumber = quiz.questionNumber;
                    });
                  })
                : Container()
          ],
        ));
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
                    title:
                        Text('Do you wish to exit the quiz?'),
                    content: Text("Your progress will be lost"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LandingPage()));
                        },
                        child: Text(
                          'End Quiz',
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context,
                                  rootNavigator: true)
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
