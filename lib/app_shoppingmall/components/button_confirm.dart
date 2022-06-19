import 'package:flutter/material.dart';

@immutable
class ConfirmButton extends StatelessWidget {
  final String name;
  final void Function() pressed;

  const ConfirmButton(this.name, this.pressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        onPressed: pressed,
        child: Text(name),
      ),
    );
  }
}
