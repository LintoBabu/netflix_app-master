import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domains/downloads/Models/downloads.dart';
import '../../domains/downloads/i_downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
];

ValueNotifier<Set<int>> likeVideosNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        const FastLaughState(
          videosList: [],
          isloading: true,
          isError: false,
        ),
      );
      final result = await downloadService.getDownloads();
      final state = result.fold(
        (l) {
          return const FastLaughState(
            videosList: [],
            isloading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videosList: resp,
          isloading: false,
          isError: false,
        ),
      );
      emit(state);
    });

    on<LikeVideos>((event, emit) async {
      likeVideosNotifier.value.add(event.id);
    });

    on<UnLikeVideos>((event, emit) async {
      likeVideosNotifier.value.remove(event.id);
    });
  }
}
