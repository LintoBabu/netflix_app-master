import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';
import 'mainCard.dart';
import 'mainTitle.dart';

class mainTitlleCards extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const mainTitlleCards({
    required this.title,
    super.key,
    required this.posterList,
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
              posterList.length,
              (index) => mainCarder(
                imageUrl: posterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
