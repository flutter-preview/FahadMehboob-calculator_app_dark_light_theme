import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback onPressed;

  const MyButton({
    required this.title,
    required this.isDarkMode,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color containerColor =
        isDarkMode ? const Color(0xff4E4E4E) : const Color(0xffF3F3F3);
    Color textColor = isDarkMode ? const Color(0xffFFFFFF) : Colors.black;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: SizedBox(
          height: 76,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: containerColor,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
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
