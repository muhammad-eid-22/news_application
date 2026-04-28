import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/models/top_headlines_request.dart';
import 'package:news_app/features/layout/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final homeServices = HomeServices();

  HomeCubit() : super(HomeCubitInitial());
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
}
