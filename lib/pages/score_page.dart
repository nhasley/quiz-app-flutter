import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;
import './placement_test_start.dart';
import '../UI/progress_bar.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage>
    with SingleTickerProviderStateMixin {
  var goodResult =
      (['Nicely done!', 'Good job!', 'Amazing!', 'Terrific!']..shuffle()).first;
  var badResult =
      (['Nice Try!', 'You\'re getting there!', 'Keep Practicing!']..shuffle()).first;//TODO badResults not in code

  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(animController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Test Results'.toUpperCase(),
              style: TextStyle(
                  color: Color(0xffAEAEAE),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: 50,
            )
          ],
          leading: IconButton(
              icon: Icon(Icons.clear),
              color: Color(0xffAEAEAE),
              iconSize: 25.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => PlacementTestStart()),
                  (Route route) => route == null)),
          elevation: 0,
          backgroundColor: Color(0xffE5E5E5),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              /*1st swipe*/ Container(
                height: MediaQuery.of(context).size.height - 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/trophy.png',
                                  height: 77.8, width: 67),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                goodResult.toString(),
                                style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 260,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Transform.rotate(
                                  angle: -90 * math.pi / 180,
                                  child: CircularPercentIndicator(
                                    radius: 220.0,
                                    lineWidth: 13.0,
                                    percent: 0.5,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Color(0xFFC4C4C4),
                                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -90 * math.pi / 180,
                                  child: CircularPercentIndicator(
                                    radius: 220.0,
                                    lineWidth: 13.0,
                                    animation: true,
                                    percent:
                                        (widget.score / widget.totalQuestions) /
                                            2,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.black,
                                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                                  ),
                                ),
                                Positioned.fill(
                                  top: 85,
                                  child: Container(
                                    height: 63,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                            widget.score.toString() +
                                                " / " +
                                                widget.totalQuestions
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0)),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "correct",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ProgressBar(size: size, percent: .4),
                      Column(
                        children: <Widget>[
                          Container(
                              width: 70,
                              height: 40,
                              child: Text(
                                'Scroll for stats'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12.3003,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            height: 31,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: animation.value,
                                ),
                                Transform.rotate(
                                  angle: 90 * math.pi / 180,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              /*2nd swipe*/ Container(
                height: MediaQuery.of(context).size.height - 100,
                child: Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
