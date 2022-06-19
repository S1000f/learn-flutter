import 'package:flutter/material.dart';

@immutable
class EmailInput extends StatelessWidget {
  final void Function(String) changed;

  const EmailInput(this.changed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: changed,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(labelText: 'Email', helperText: ''),
      ),
    );
  }
}
