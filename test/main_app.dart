
import 'package:flutter/material.dart';

class TestAppWidget extends StatelessWidget {
  final Widget body;
  const TestAppWidget({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
