import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final bool bold;
  TitleText( this.text, this.bold );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: bold? FontWeight.w500:FontWeight.normal
      ),
    );
  }
}