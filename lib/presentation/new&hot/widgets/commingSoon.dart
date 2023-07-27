import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../home/widgets/CustomButtonWidget.dart';
import '../../widgets/videoWidget.dart';

class ComminSoonWidget extends StatelessWidget {
  final String id;
  final String description;
  final String day;
  final String month;
  final String posterPath;
  final String movieName;

  const ComminSoonWidget(
      {super.key,
      required this.id,
      required this.description,
      required this.day,
      required this.month,
      required this.posterPath,
      required this.movieName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            children: [
              Text(
                "FEB ",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                "11 ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        letterSpacing: -2),
                  ),
                  Spacer(),
                  CustomButton(
                    icon: Icons.notifications_active,
                    title: "Remind me",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kwidth,
                  CustomButton(
                    icon: Icons.info,
                    title: "info",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kwidth
                ],
              ),
              kheight,
              Text("Comming on Friday"),
              kheight,
              Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              kheight,
              Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence — and her relationship — into a tailspin.",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
