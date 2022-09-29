import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  final String pageName;

  const MyAppBar({Key? key, required this.pageName}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (Text(
        widget.pageName,
        textAlign: TextAlign.right,
        style: const TextStyle(fontWeight: FontWeight.normal),
      )),
    );
  }
}