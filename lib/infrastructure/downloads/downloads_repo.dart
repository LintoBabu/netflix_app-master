import 'package:dartz/dartz.dart';
import 'package:netflix_app/domains/core/api_endpoints.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';
import 'package:netflix_app/domains/downloads/Models/downloads.dart';
import 'package:netflix_app/domains/downloads/i_downloads.dart';
import 'package:dio/dio.dart';

class DownloadRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloads() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left((MainFailure.clientFailure()));
    }
  }
}
