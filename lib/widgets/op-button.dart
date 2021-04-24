import 'package:flutter/material.dart';

class OpButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Function onLongPressed;

  OpButton({@required this.text,this.onLongPressed, @required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Text(text),
    );
  }
}
