import 'package:flutter/material.dart';

class MultiButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;

  const MultiButton({
    Key key,
    this.text,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 16.0,
      ),
      child: MaterialButton(
        textColor: Colors.white,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
