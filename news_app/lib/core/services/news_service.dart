import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/features/models/source_response_model.dart';

class NewsService {
  static Future<SourceResponseModel> getSources() async {
    final json = await ApiManager.getSources();
    return SourceResponseModel.fromJson(json);
  }
}
