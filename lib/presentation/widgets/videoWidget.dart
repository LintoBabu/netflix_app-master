import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(
                child: Icon(
                  Icons.wifi,
                  color: Colors.white,
                ),
              );
            },
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
    );
  }
}
