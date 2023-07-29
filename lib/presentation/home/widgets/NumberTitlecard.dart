import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../widgets/mainTitle.dart';
import 'numberCard.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.posterList,
  });
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainTitle(title: "Top 10 TV Shows In India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => NumberCard(
                imageUrl: posterList[index],
                index: index,
              ),
            ),
          ),
        )
      ],
    );
  }
}
