import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

final imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/13E5L5SjHETFajvVcQtwERFIYEO.jpg";

class SearchIdle extends StatefulWidget {
  const SearchIdle({super.key});

  @override
  State<SearchIdle> createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(
          title: "Top Search",
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kheight20,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageUrl)))),
        Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 27,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
