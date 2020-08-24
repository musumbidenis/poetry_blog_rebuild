import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const Input({Key key, this.labelText, this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Field cannot be blank";
        }
      },
    );
  }
}
