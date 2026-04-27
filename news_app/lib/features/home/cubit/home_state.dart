part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeCubitInitial extends HomeState {}

final class TopHeadlinesLoading extends HomeState {}

final class TopHeadlinesLoaded extends HomeState {
  final List<Article>? articlesResponse;

  TopHeadlinesLoaded(this.articlesResponse);
}

final class TopHeadlinesError extends HomeState {
  final String message;

  TopHeadlinesError(this.message);
}

final class RecommendedNewsLoading extends HomeState {}

final class RecommendedNewsLoaded extends HomeState {
  final List<Article>? articlesResponse;

  RecommendedNewsLoaded(this.articlesResponse);
}

final class RecommendedNewsError extends HomeState {
  final String message;

  RecommendedNewsError(this.message);
}

final class AllNewsLoaded extends HomeState {
  final List<TopHeadlinesResponse> articlesResponse;

  AllNewsLoaded(this.articlesResponse);
}

final class AllNewsError extends HomeState {
  final String message;
  AllNewsError(this.message);
}
