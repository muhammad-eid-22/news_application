import 'package:dio/dio.dart';
import 'package:news_app/core/api/AppConstants.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/models/top_headlines_request.dart';

class HomeServices {
  final aDio = Dio();
  Future<NewsApiResponse> getTopheadlines(TopHeadLinesRequest body) async {
    try {
      final headers = {"Authorization": "Bearer ${AppConstants.apiKey}"};
      final respons = await aDio.get(
        '${AppConstants.baseUrl}${EndPoints.topHeadlinesEndpoint}',
        queryParameters: body.toMap(),
        options: Options(headers: headers),
      );
      if (respons.statusCode == 200) {
        return NewsApiResponse.fromJson(respons.data);
      } else {
        throw Exception('Failed to load articles');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
