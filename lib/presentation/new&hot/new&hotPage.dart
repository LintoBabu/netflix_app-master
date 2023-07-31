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
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.transparent,
            actions: [
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
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
              )
            ],
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              indicatorColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: const [
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
        body: const TabBarView(children: [
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
  const ComminSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataCommingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataCommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Data is not available'));
          } else if (state.commingSoonList.isEmpty) {
            return const Center(child: Text('Data is Empty'));
          } else {
            return ListView.builder(
                itemCount: state.commingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.commingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
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
  const EveryonesWatchingz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataEveryoneWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataEveryoneWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Data is not available'));
          } else if (state.EveryOneIsWatchingList.isEmpty) {
            return const Center(child: Text('Data is Empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: state.EveryOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.EveryOneIsWatchingList[index];
                  if (movie.id == null) {
                    return const SizedBox();
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
