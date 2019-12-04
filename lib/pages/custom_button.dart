import 'package:flutter/material.dart';

// the custom button has slightly rounded corners with a drop shdow
// the flutter raised button doesn't seem capable of making a button
// with the shape and shadow of this design

class CustomButton extends StatelessWidget {
  final String content;
  final Function action;
  final Image icon;
  final double fontSize;
  final Color color;
  final double width;
  final double height;

  CustomButton({
    @required this.content,
    @required this.action,
    this.icon,
    this.fontSize,
    this.color,
    this.width = 180.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey[300],
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                            constraints: BoxConstraints(maxHeight: height - 20),
                            child: icon),
                      ),
                      Text(
                        content,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  )
                : Text(
                    content,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
