import 'package:flutter/material.dart';

@immutable
class PasswordInput extends StatelessWidget {
  final String name;
  final void Function(String) changed;

  const PasswordInput(this.changed, {this.name = 'Password', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: changed,
        obscureText: true,
        decoration: InputDecoration(labelText: name, helperText: ''),
      ),
    );
  }
}
