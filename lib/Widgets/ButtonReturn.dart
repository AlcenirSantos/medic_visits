import 'package:flutter/material.dart';

class ButtonReturn extends StatelessWidget {
  final String titleButton;
  const ButtonReturn({required this.titleButton, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            SizedBox(width: 10),
            ImageIcon(
              AssetImage('assets/Icons/arrow-left.png'),
              color: Color.fromRGBO(28, 58, 85, 1),
            ),
            SizedBox(width: 10),
            Text(
              titleButton,
              style: TextStyle(
                color: Color.fromRGBO(28, 58, 85, 1),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
