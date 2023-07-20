import 'package:flutter/cupertino.dart';

class mainCarder extends StatelessWidget {
  const mainCarder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/u7iHICDItwAoHZjwTwoBmPHql4G.jpg"),
        ),
      ),
    );
  }
}
