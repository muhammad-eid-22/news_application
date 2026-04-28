import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/features/search/models/search_request.dart';
import 'package:news_app/features/search/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final searchServices = SearchServices();
  Future<void> search(String keyWord) async {
    emit(SearchLoading());
    try {
      final body = SearchRequest(
        q: keyWord,
        searchIn: "title",
        page: 1,
        pageSize: 20,
      );
      final response = await searchServices.search(body);
      emit(SearchLoaded(response.articles));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
