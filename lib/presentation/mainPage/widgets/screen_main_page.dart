import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/fastLaughs/FastLaugh.dart';
import 'package:netflix_app/presentation/home/homePage.dart';
import 'package:netflix_app/presentation/mainPage/widgets/bottom_navigation.dart';
import 'package:netflix_app/presentation/screenDownloads/downloadPage.dart';
import 'package:netflix_app/presentation/search/search.dart';

import '../../new&hot/new&hotPage.dart';

class screenMainpage extends StatelessWidget {
  screenMainpage({Key? key}) : super(key: key);
  final _pages = [
    homePage(),
    newhotPage(),
    FastLaughs(),
    searchPage(),
    downloadPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangenotfier,
            builder: (context, int value, _) {
              return _pages[value];
            }),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
