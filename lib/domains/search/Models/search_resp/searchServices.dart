import 'package:dartz/dartz.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';
import 'package:netflix_app/domains/search/Models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> SearchMovies({
    required String MovieQuery,
  });
}
