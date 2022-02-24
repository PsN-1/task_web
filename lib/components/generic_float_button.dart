import 'package:flutter/material.dart';

class GenericFloatButton extends StatelessWidget {
  final Function onPressed;
  const GenericFloatButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          onPressed();
        },
        child: Icon(Icons.add));
  }
}
