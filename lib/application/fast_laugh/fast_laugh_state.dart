part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videoList,
    required bool isloading,
    required bool isError,
  }) = _Initial;

  factory FastLaughState.initial() =>
      FastLaughState(videoList: [], isloading: true, isError: false);
}
