import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final Color color;
  final int flex;
  final Function onTap;

  const OptionButton({
    Key key,
    this.text,
    this.color,
    this.flex = 1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: MaterialButton(
          textColor: Colors.white,
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
