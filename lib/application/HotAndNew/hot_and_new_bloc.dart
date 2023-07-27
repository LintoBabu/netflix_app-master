import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domains/Hotz/hot_and_new_resp/service.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';

import '../../domains/Hotz/hot_and_new_resp/Model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotandNewService _HotandNewService;
  HotAndNewBloc(this._HotandNewService) : super(HotAndNewState.initial()) {
    on<LoadDataCommingSoon>((event, emit) async {
      final _result = await _HotandNewService.getHotAndMovieData();
      _result.fold((MainFailure failure) {
        return HotAndNewState(
          commingSoonList: [],
          EveryOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {});
    });

    on<LoadDataEveryoneWatching>((event, emit) {});
  }
}
