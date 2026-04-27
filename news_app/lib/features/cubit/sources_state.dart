part of 'sources_cubit.dart';


abstract class SourcesState {
}

final class SourcesInitial extends SourcesState {}
class SourcesLoading extends SourcesState {}
class SourcesSuccess extends SourcesState {
  final SourcesResponse data;

  SourcesSuccess(this.data);
}
class SourcesError extends SourcesState {
  final String message;

  SourcesError(this.message);
}
