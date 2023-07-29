import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:netflix_app/application/HotAndNew/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/constants.dart';

import 'package:netflix_app/presentation/new&hot/widgets/commingSoon.dart';
import 'package:netflix_app/presentation/new&hot/widgets/everyoneWatching.dart';

class newhotPage extends StatelessWidget {
  const newhotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.transparent,
            actions: [
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
              )
            ],
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: [
                Tab(
                  text: "🍿 Comming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          ComminSoonList(
            key: Key('coming_soon'),
          ),
          EveryonesWatchingz(
            key: Key('everyone_is_watching'),
          )
        ]),
      ),
    );
  }
}

class ComminSoonList extends StatelessWidget {
  ComminSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataCommingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(LoadDataCommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return Center(child: Text('Data is not available'));
          } else if (state.commingSoonList.isEmpty) {
            return Center(child: Text('Data is Empty'));
          } else {
            return ListView.builder(
                itemCount: state.commingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.commingSoonList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  log(movie.releaseDate.toString());
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    log(formatedDate.toString());
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }
                  return ComminSoonWidget(
                      id: movie.id.toString(),
                      description: movie.overview ?? "No Movie Overview",
                      day: date,
                      month: month,
                      posterPath: '$appendImage${movie.posterPath}',
                      movieName: movie.originalTitle ?? "No Title");
                });
          }
        },
      ),
    );
  }
}

class EveryonesWatchingz extends StatelessWidget {
  EveryonesWatchingz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataEveryoneWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(LoadDataEveryoneWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return Center(child: Text('Data is not available'));
          } else if (state.EveryOneIsWatchingList.isEmpty) {
            return Center(child: Text('Data is Empty'));
          } else {
            return ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: state.EveryOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.EveryOneIsWatchingList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  final tv = state.EveryOneIsWatchingList[index];
                  return EveryonesWatchingWidget(
                      posterPath: '$appendImage${tv.posterPath}',
                      description: tv.overview ?? 'nothing',
                      movieName: tv.originalName ?? "oke");
                });
          }
        },
      ),
    );
  }
}
