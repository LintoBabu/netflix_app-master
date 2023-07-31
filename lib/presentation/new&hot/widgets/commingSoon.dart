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
          height: 400,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 25,
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
              VideoWidget(
                url: posterPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const CustomButton(
                    icon: Icons.notifications_active,
                    title: "Remind me",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kwidth,
                  const CustomButton(
                    icon: Icons.info,
                    title: "info",
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kwidth,
                ],
              ),
              Text("Comming on $day $month"),
              kheight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              kheight,
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
