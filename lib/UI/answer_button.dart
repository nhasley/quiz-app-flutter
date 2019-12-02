import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectHandler,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                answerText,
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color:
                        Color(0xffEEEEEE),
                    width: 3.45999)),
          ),
        ],
      ),
    );
  }
}
