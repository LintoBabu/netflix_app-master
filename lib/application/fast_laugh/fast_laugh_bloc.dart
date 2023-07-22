import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';

import '../../domains/downloads/Models/downloads.dart';
import '../../domains/downloads/i_downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final _videoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        FastLaughState(
          videoList: [],
          isloading: true,
          isError: false,
        ),
      );
      final _result = await _downloadService.getDownloads();
      final _state = _result.fold(
        (l) {
          return FastLaughState(
            videoList: [],
            isloading: false,
            isError: true,
          );
        },
        (res) => FastLaughState(
          videoList: [],
          isloading: false,
          isError: false,
        ),
      );
      emit(_state);
    });
  }
}
