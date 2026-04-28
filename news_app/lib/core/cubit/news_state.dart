part of 'news_cubit.dart';

sealed class NewsState {}

final class HomeCubitInitial extends NewsState {}

final class TopHeadlinesLoading extends NewsState {}

final class TopHeadlinesLoaded extends NewsState {
  final List<Article>? articlesResponse;

  TopHeadlinesLoaded(this.articlesResponse);
}

final class TopHeadlinesError extends NewsState {
  final String message;

  TopHeadlinesError(this.message);
}

final class RecommendedNewsLoading extends NewsState {}

final class RecommendedNewsLoaded extends NewsState {
  final List<Article>? articlesResponse;

  RecommendedNewsLoaded(this.articlesResponse);
}

final class RecommendedNewsError extends NewsState {
  final String message;

  RecommendedNewsError(this.message);
}

