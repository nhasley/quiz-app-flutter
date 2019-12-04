import 'package:flutter/material.dart';
import '../pages/landing_page.dart';

class ExitButton extends StatefulWidget {
  final Color colorButton;

  ExitButton(this.colorButton);

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
                    title: Text('Do you wish to exit the quiz?'),
                    content: Text("Your progress will be lost"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LandingPage()));
                        },
                        child: Text(
                          'End Quiz',
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
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
          color: widget.colorButton,
        ),
      ),
    );
  }
}
