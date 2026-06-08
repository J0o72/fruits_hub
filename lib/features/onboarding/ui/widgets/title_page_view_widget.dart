import 'package:flutter/material.dart';

class TitlePageViewWidget extends StatelessWidget {
  const TitlePageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'مرحبًا بك في',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Fruit',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'HUB',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
