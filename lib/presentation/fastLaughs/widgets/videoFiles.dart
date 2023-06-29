import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class videoFiles extends StatelessWidget {
  final int index;
  const videoFiles({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5DNRr2juXdwtvktwXxwuk9Usk8O.jpg"),
                      ),
                    ),
                    videoAction(title: "LOL", icons: Icons.emoji_emotions),
                    videoAction(title: "My List", icons: Icons.add),
                    videoAction(title: "Share", icons: Icons.share),
                    videoAction(title: "PLAY", icons: Icons.play_circle),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class videoAction extends StatelessWidget {
  final IconData icons;
  final String title;
  const videoAction({super.key, required this.title, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            icons,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
