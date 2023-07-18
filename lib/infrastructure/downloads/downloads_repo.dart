import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domains/core/api_endpoints.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';
import 'package:netflix_app/domains/downloads/Models/downloads.dart';
import 'package:netflix_app/domains/downloads/i_downloads.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloads() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left((MainFailure.clientFailure()));
    }
  }
}
