import 'package:flutter/material.dart';

class ChartButtons extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const ChartButtons(
      {Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 235, 231, 231)),
            minimumSize: MaterialStateProperty.all(const Size(40, 40)),

            //maximumSize: MaterialStateProperty.all(const Size(36, 36)),
          ),
          onPressed: () {
            onPressed();
          },
          child: Text(buttonName)),
    );
  }
}
