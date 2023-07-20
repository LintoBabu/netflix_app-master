import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Search/bloc/search_bloc.dart';
import 'package:netflix_app/presentation/search/widgets/searchIdle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

import '../../core/colors/constants.dart';

class searchPage extends StatelessWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(Initialize());
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              style: TextStyle(color: Colors.white),
            ),
            kheight,
            // Expanded(
            //   child: screenSearch(),
            // )
            Expanded(
              child: SearchIdle(),
            )
          ],
        ),
      ),
    );
  }
}
