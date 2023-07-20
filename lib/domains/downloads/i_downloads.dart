import 'package:dartz/dartz.dart';
import 'package:netflix_app/domains/core/failures/main_failure.dart';
import 'package:netflix_app/domains/downloads/Models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloads();
}
