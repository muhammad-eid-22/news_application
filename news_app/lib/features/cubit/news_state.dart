part of 'news_cubit.dart';

abstract class NewsState {}

final class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final SourceResponseModel data;

  NewsSuccess(this.data);
}

class NewsError  extends NewsState {
  final String message;

  NewsError(this.message);
}

class Empty extends NewsState {}
