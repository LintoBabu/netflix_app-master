import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../home/widgets/CustomButtonWidget.dart';

class ComminSoonWidget extends StatelessWidget {
  const ComminSoonWidget({
    super.key,
  });

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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      temporaryImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
