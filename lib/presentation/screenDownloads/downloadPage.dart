import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/widgets/appBarWidget.dart';

class downloadPage extends StatelessWidget {
  const downloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _widgetlist = [
      const _downloads(),
      const section2(),
      const Section4()
    ];
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: appBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (context, index) => _widgetlist[index],
        itemBuilder: (context, index) => const SizedBox(height: 25),
        itemCount: _widgetlist.length,
      ),
    );
  }
}

class _downloads extends StatelessWidget {
  const _downloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text("Smart Downloads")
      ],
    );
  }
}

class section2 extends StatelessWidget {
  const section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageList = [
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg',
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5DNRr2juXdwtvktwXxwuk9Usk8O.jpg',
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg'
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for You",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const Text(
          "To watch TV shows and movies offline at any time, download them from the Netflix app. Learn more about finding, downloading, and watching downloaded TV shows and movies below.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              ),
              downloadImage(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130, bottom: 50),
                angle: 20,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              downloadImage(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 130, bottom: 50),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              downloadImage(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.45, size.width * 0.65),
                radius: 5,
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kbuttonColorBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Set Up",
                  style: TextStyle(
                      fontSize: 19,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {}),
        ),
        MaterialButton(
            color: kbuttonColorWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {}),
      ],
    );
  }
}

class Section4 extends StatelessWidget {
  const Section4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.deepPurpleAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(
                    fontSize: 19,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {}),
        MaterialButton(
            color: kbuttonColorWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {}),
      ],
    );
  }
}

class downloadImage extends StatelessWidget {
  const downloadImage(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      this.radius = 10,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRect(
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}