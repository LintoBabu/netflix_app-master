import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/fastLaughs/widgets/videoFiles.dart';

class FastLaughs extends StatelessWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
            builder: (context, state) {
          if (state.isloading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return Center(
              child: Text("Error While getting data"),
            );
            // } else if (state.videoList.isEmpty) {
            //   return Center(
            //     child: Text("There is No Video "),
            //   );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videosList.length, (index) {
                return VideoListItemInheritedWidget(
                    widget: VideoListItemz(
                        key: Key(index.toString()), index: index),
                    movieData: state.videosList[index]);
              }),
            );
          }
        }),
      ),
    );
  }
}
