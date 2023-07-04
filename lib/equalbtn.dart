import 'package:flutter/material.dart';

class EqualBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const EqualBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 162,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            child: const Text(
              "=",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
