import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Search/bloc/search_bloc.dart';
import 'package:netflix_app/domains/core/debouncer/debounce.dart';
import 'package:netflix_app/presentation/search/widgets/searchIdle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

import '../../core/colors/constants.dart';

class searchPage extends StatelessWidget {
  searchPage({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

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
              onChanged: (value) {
                if (value.isEmpty){
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovies(movieQuery: value));
                });
              },
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
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.seachResultList.isEmpty) {
                    return SearchIdle();
                  } else {
                    return screenSearch();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
