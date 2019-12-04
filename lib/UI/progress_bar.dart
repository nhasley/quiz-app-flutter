import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final Size size;
  final double percent;

  ProgressBar({
    @required this.size,
    @required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      width: size.width * .85,
      lineHeight: 22.14,
      percent: percent,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            // To-Do: refactor with localized string
            'Level 7',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            // To-Do: refactor with localized string
            'Level 8',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // trailing: Icon(Icons.mood),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Color(0xFFC4C4C4),
      progressColor: Color(0xff979797),
    );
  }
}
