import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final String answerId;

  Answer(this.selectHandler, this.answerText, this.answerId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectHandler,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  top: 5,
                  left: 9,
                  child: Text(
                    answerId,
                    style: TextStyle(
                        color: Color(0xffEEEEEE),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      answerText,
                      style:
                          TextStyle(fontSize: 24.0, color: Color(0xff5B5B5B)),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffEEEEEE), width: 3.45999)),
          ),
        ],
      ),
    );
  }
}
