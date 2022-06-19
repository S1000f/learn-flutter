import 'package:flutter/material.dart';

@immutable
class SimpleTextButton extends StatelessWidget {
  final String name;
  final void Function() pressed;

  const SimpleTextButton(this.name, this.pressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
        onPressed: pressed,
        child: Text(
          name,
          style: TextStyle(color: theme.primaryColor),
        ));
  }
}
