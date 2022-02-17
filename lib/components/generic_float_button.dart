import 'package:flutter/material.dart';

class GenericFloatButton extends StatelessWidget {
  const GenericFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: null, child: Icon(Icons.add));
  }
}
