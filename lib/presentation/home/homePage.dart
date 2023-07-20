import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/home/widgets/backgroundCard.dart';
import 'package:netflix_app/presentation/home/widgets/CustomButtonWidget.dart';
import 'package:netflix_app/presentation/home/widgets/numberCard.dart';
import 'package:netflix_app/presentation/home/widgets/NumberTitlecard.dart';
import 'package:netflix_app/presentation/widgets/mainCard.dart';
import 'package:netflix_app/presentation/widgets/mainTitle.dart';

import '../search/widgets/search_result.dart';
import '../widgets/maintitleCards.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: ScrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                ScrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                ScrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(),
                    const mainTitlleCards(title: "Released In the past year"),
                    kheight,
                    const mainTitlleCards(title: "Trending Now"),
                    kheight,
                    const NumberTitleCard(),
                    kheight,
                    const mainTitlleCards(title: "Tense Dramas"),
                    kheight,
                    const mainTitlleCards(title: "South Indian Cinemas"),
                  ],
                ),
                ScrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://cdn-images-1.medium.com/v2/resize:fit:1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                  width: 60,
                                  height: 60,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                ),
                                kwidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: khomeTextstyle,
                                ),
                                Text(
                                  "Movies",
                                  style: khomeTextstyle,
                                ),
                                Text(
                                  "Categories",
                                  style: khomeTextstyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
