import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../home/widgets/CustomButtonWidget.dart';
import '../../widgets/videoWidget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String description;
  final String movieName;

  const EveryonesWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.description,
      required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          "Friends",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        kheight,
        Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.",
          style: TextStyle(color: Colors.grey),
        ),
        kheight50,
        VideoWidget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth
          ],
        )
      ],
    );
  }
}
