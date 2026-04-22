import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/news_service.dart';
import 'package:news_app/features/models/source_response_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  void getSources() async {
    try {
      emit(NewsLoading());

      final response = await NewsService.getSources();

      emit(NewsSuccess(response));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
