import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/model/top_headlines_response.dart';
import 'package:news_app/features/home/model/top_headlines_body.dart';
import 'package:news_app/features/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final homeServices = HomeServices();

  HomeCubit() : super(HomeCubitInitial());
  Future<void> getBreakingNews() async {
    emit(TopHeadlinesLoading());
    try {
      final body = TopHeadLinesBody(category: "business", page: 1, pageSize: 6);
      final response = await homeServices.getTopheadlines(body);
      emit(TopHeadlinesLoaded(response.articles));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
    }
  }

  Future<void> getRecommendedNews() async {
    emit(RecommendedNewsLoading());
    try {
      final body = TopHeadLinesBody(page: 1, pageSize: 20);
      final response = await homeServices.getTopheadlines(body);
      emit(RecommendedNewsLoaded(response.articles));
    } catch (e) {
      emit(RecommendedNewsError(e.toString()));
    }
  }
}
