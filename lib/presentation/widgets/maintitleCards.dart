import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';
import 'mainCard.dart';
import 'mainTitle.dart';

class mainTitlleCards extends StatelessWidget {
  final String title;
  const mainTitlleCards({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => mainCarder(),
            ),
          ),
        )
      ],
    );
  }
}
