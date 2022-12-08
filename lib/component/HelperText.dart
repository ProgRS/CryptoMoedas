// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HelperText extends StatelessWidget {
  final String text;
  const HelperText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
