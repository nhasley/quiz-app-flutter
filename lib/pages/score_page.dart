import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(score.toString() + " / " + totalQuestions.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0)),
          Text("correct", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LandingPage()), (Route route) => route == null)
          )
        ],
      )
    );
  }
}