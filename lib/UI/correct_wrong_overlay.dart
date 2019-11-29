import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Color.fromRGBO(0, 0, 0, .1),
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: 80.0, color: widget._isCorrect == true ? Colors.green : Colors.red),
            ),
           Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
           Text(widget._isCorrect == true ? "Correct!" : "Wrong!", style: TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}