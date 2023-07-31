import 'package:flutter/material.dart';

class mainTitle extends StatelessWidget {
  String title;
  mainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
