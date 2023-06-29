import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fastLaughs/widgets/videoFiles.dart';

class fastLaughs extends StatelessWidget {
  const fastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) {
              return videoFiles(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
