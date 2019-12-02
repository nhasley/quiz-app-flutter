import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final bool _answer0;
  final bool _answer1;
  final bool _answer2;
  final bool _answer3;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._answer0, this._answer1,
      this._answer2, this._answer3, this._onTap);

  @override
  State createState() => CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(0, 0, 0, 0),
      // color: Colors.black54,
      child: InkWell(
          onTap: () => widget._onTap(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 190,),
              Container(
                padding: EdgeInsets.all(40),
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1),
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle
                            ),
                        child: widget._answer0 == false
                            ? Container()
                            : Icon(
                                widget._isCorrect == true
                                    ? Icons.done
                                    : Icons.clear,
                                size: 150.0,
                                color: widget._isCorrect == true
                                    ? Color.fromRGBO(0, 400, 0, .5)
                                    : Color.fromRGBO(400, 0, 0, .5)),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle
                            ),
                        child: widget._answer1 == false
                            ? Container()
                            : Icon(
                                widget._isCorrect == true
                                    ? Icons.done
                                    : Icons.clear,
                                size: 150.0,
                                color: widget._isCorrect == true
                                    ? Color.fromRGBO(0, 400, 0, .5)
                                    : Color.fromRGBO(400, 0, 0, .5)),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle
                            ),
                        child: widget._answer2 == false
                            ? Container()
                            : Icon(
                                widget._isCorrect == true
                                    ? Icons.done
                                    : Icons.clear,
                                size: 150.0,
                                color: widget._isCorrect == true
                                    ? Color.fromRGBO(0, 400, 0, .5)
                                    : Color.fromRGBO(400, 0, 0, .5)),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            // shape: BoxShape.circle
                            ),
                        child: widget._answer3 == false
                            ? Container()
                            : Icon(
                                widget._isCorrect == true
                                    ? Icons.done
                                    : Icons.clear,
                                size: 150.0,
                                color: widget._isCorrect == true
                                    ? Color.fromRGBO(0, 400, 0, .5)
                                    : Color.fromRGBO(400, 0, 0, .5)),
                      ),
                    ]),
              ),
            ],
          )),
    );
  }
}
