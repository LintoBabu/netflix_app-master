import 'package:dartz/dartz.dart';
import 'package:netflix_app/domains/Hotz/hot_and_new_resp/Model/hot_and_new_resp.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';

abstract class HotandNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndTvData();
}
