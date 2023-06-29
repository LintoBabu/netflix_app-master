import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

const imagerurl =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5DNRr2juXdwtvktwXxwuk9Usk8O.jpg";

class screenSearch extends StatelessWidget {
  const screenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: "Movies & TV"),
        kheight,
        Expanded(
          child: GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(20, (index) => mainCard())),
        )
      ],
    );
  }
}

class mainCard extends StatelessWidget {
  const mainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imagerurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
