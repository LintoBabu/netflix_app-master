import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domains/Hotz/hot_and_new_resp/Model/hot_and_new_resp.dart';
import 'package:netflix_app/domains/Hotz/hot_and_new_resp/service.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';

import '../../domains/core/api_endpoints.dart';

@LazySingleton(as: HotandNewService)
class HotAndNewImplementation implements HotandNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left((MainFailure.clientFailure()));
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left((MainFailure.clientFailure()));
    }
  }
}
