import 'package:flutter/cupertino.dart';

class SearchTitle extends StatelessWidget {
  final String title;
  const SearchTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
