import 'package:netflix_app/core/colors/strings.dart';
import 'package:netflix_app/infrastructure/api.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/movie/now_playing?api_key=$apiKey";
}
