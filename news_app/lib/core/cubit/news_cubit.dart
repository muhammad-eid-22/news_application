import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/models/top_headlines_request.dart';
import 'package:news_app/features/layout/home/services/home_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final homeServices = HomeServices();

  NewsCubit() : super(HomeCubitInitial());
  Future<void> getBreakingNews() async {
    emit(TopHeadlinesLoading());
    try {
      final body = TopHeadLinesRequest(
        category: "general",
        country: "us",
        page: 1,
        pageSize: 6,
      );
      final response = await homeServices.getTopheadlines(body);
      emit(TopHeadlinesLoaded(response.articles));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
    }
  }

  Future<void> getRecommendedNews() async {
    emit(RecommendedNewsLoading());
    try {
      final body = TopHeadLinesRequest(page: 1, pageSize: 20);
      final response = await homeServices.getTopheadlines(body);
      emit(RecommendedNewsLoaded(response.articles));
    } catch (e) {
      emit(RecommendedNewsError(e.toString()));
    }
  }

  Future<void> getNewsByCategory(String category, int pageSize) async {
    emit(TopHeadlinesLoading());
    try {
      final body = TopHeadLinesRequest(
        category: category,
        country: "us",
        page: 1,
        pageSize: pageSize,
      );
      final response = await homeServices.getTopheadlines(body);
      emit(TopHeadlinesLoaded(response.articles));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
    }
  }
}
