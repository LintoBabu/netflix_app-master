import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';
import 'package:netflix_app/domains/downloads/Models/downloads.dart';

import '../../../domains/downloads/i_downloads.dart';
import '../../../domains/search/Models/search_resp/searchServices.dart';
import '../../../domains/search/Models/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            seachResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        SearchState(
          seachResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result = await _downloadService.getDownloads();
      final _state = _result.fold(
        (MainFailure f) {
          return SearchState(
            seachResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            seachResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
    on<SearchMovies>((event, emit) async {
      emit(
        SearchState(
          seachResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result =
          await _searchService.SearchMovies(MovieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return SearchState(
          seachResultList: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (SearchResp r) {
        return SearchState(
          seachResultList: r.results,
          idleList: [],
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
    });
  }
}
