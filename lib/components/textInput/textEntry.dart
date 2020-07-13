import 'package:flutter/material.dart';

class TextEntry extends StatelessWidget {
  const TextEntry({
    Key key,
    @required this.width,
    this.type,
    @required this.hint,
    this.onChanged,
    this.obscure,
  }) : super(key: key);
  final double width;
  final TextInputType type;
  final String hint;
  final Function onChanged;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1, vertical: 10),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: type ?? TextInputType.emailAddress,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          fillColor: Colors.grey[200],
          hintText: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
