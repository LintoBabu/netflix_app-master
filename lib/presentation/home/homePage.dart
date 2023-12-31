import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/homePage/home_bloc.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/home/widgets/backgroundCard.dart';
import 'package:netflix_app/presentation/home/widgets/NumberTitlecard.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text("there is no Data Available"),
                      );
                    }
                    // release
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$appendImage${m.posterPath}';
                    }).toList();
                    // trending
                    final _trendingz = state.trendingMovieList.map((m) {
                      return '$appendImage${m.posterPath}';
                    }).toList();
                    //tense
                    final _tenzeDramz = state.tenseDramasMovieList.map((m) {
                      return '$appendImage${m.posterPath}';
                    }).toList();

                    //south

                    final _southIndiz = state.southIndianMovieList.map((m) {
                      return '$appendImage${m.posterPath}';
                    }).toList();
                    _southIndiz.shuffle();

                    //top 10 tv Showws

                    final _TvSHoz = state.trendingTvList.map((e) {
                      return '$appendImage${e.posterPath}';
                    }).toList();
                    _TvSHoz.shuffle();
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        mainTitlleCards(
                          title: "Released In the past year",
                          posterList: _releasedPastYear,
                        ),
                        kheight,
                        mainTitlleCards(
                          title: "Trending Now",
                          posterList: _trendingz,
                        ),
                        kheight,
                        NumberTitleCard(
                          posterList: _TvSHoz,
                        ),
                        kheight,
                        mainTitlleCards(
                          posterList: _tenzeDramz,
                          title: "Tense Dramas",
                        ),
                        kheight,
                        mainTitlleCards(
                          posterList: _southIndiz,
                          title: "South Indian Cinemas",
                        ),
                      ],
                    );
                  },
                ),
                ScrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
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
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Image.network(
                                    "https://cdn-images-1.medium.com/v2/resize:fit:1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                    width: 60,
                                    height: 60,
                                  ),
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
