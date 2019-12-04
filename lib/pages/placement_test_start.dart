import 'package:flutter/material.dart';
import './quiz_page.dart';

import './custom_button.dart';

class PlacementTestStart extends StatelessWidget {
  static const routeName = 'placement-test-start';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blueGrey),
      ),
      body: Container(
        height: size.height - AppBar().preferredSize.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            // container for mascot image/logo
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(122, 198, 120, 1),
                borderRadius: BorderRadius.circular(80),
              ),
              child: Image.asset(
                'assets/images/Mascot.png',
                height: size.height * 0.22,
                width: size.height * 0.22,
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            // container for name/logo
            Container(
              height: size.height * 0.13,
              // color: Colors.grey,
              child: Text(
                'Let\'s assess your\nEnglish!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              // color: Colors.amber,
              height: (size.height * 0.15),
              width: size.width * 0.8,
              child: Text(
                'It takes about 1-2 minutes and will help us personalize your learning.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomButton(
              color: Color.fromRGBO(122, 198, 120, 1),
              height: size.height * 0.08,
              width: size.width * 0.5,
              fontSize: 22,
              action: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QuizPage(_questions))),
              content: 'BEGIN',
            ),
          ],
        ),
      ),
    );
  }
}
