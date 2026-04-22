import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/api/AppConstants.dart' ;
import 'package:news_app/core/api/end_points.dart';

class ApiManager {
  static Future<Map<String, dynamic>> getSources() async {
    Uri url = Uri.https(AppConstants.baseUrl, EndPoints.topHeadlinesEndpoint, {
      "apiKey": AppConstants.apiKey,
      "country": "us",
    });
    final response = await http.get(url);
    return jsonDecode(response.body);
  }
}
