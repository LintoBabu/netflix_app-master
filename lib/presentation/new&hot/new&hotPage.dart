import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/home/widgets/CustomButtonWidget.dart';
import 'package:netflix_app/presentation/new&hot/widgets/commingSoon.dart';

import '../widgets/appBarWidget.dart';

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
          _buildCommingSoon(),
          _buildEveryoneWatching(),
        ]),
      ),
    );
  }

  _buildCommingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => ComminSoonWidget(),
    );
  }

  _buildEveryoneWatching() {
    return Center(
      child: Text("Hello"),
    );
  }
}
