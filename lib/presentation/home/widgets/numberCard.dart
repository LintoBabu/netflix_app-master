import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/oftZNfyTVNU7IfOqoGLoT8MGvNs.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 150,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
