import 'package:bloc/bloc.dart';
import 'package:news_app/features/models/source_response_model.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit() : super(SourcesInitial());
 
}
