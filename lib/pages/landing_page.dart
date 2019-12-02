import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 33, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Review'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffAEAEAE),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Let\'s '),
                                  TextSpan(
                                      text: 'plant & learn',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(241, 148, 68, 1))),
                                  TextSpan(text: ' your collected wordbuds'),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Take a '),
                                  TextSpan(
                                      text: 'short quiz',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          ' to learn the wordbuds you collected! You’ll be tested on: '),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 320,
                  left: 33,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _questions.length.toString(),
                          style: TextStyle(
                              color: Color(0xff5B5B5B),
                              fontWeight: FontWeight.w900,
                              fontSize: 30),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'new wordbuds',
                          style: TextStyle(
                              color: Color(0xff5B5B5B),
                              fontWeight: FontWeight.bold,
                              fontSize: 13.8095),
                        ),
                      ],
                    ),
                    width: 128,
                    height: 108,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.2857),
                      color: Color(0xffEBEBEB),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffC4C4C4),
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QuizPage(_questions))),
            child: Container(
              width: 380,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Begin'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffE1E1E1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], offset: Offset(0, 5))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
