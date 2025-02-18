part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class GetTopRatedEvent extends HomeEvent {}
class GetCategoriesEvent extends HomeEvent {}
class GetMoviesEvent extends HomeEvent {
  final String? genreId;
  GetMoviesEvent({this.genreId});
}

class GetDetailsEvent extends HomeEvent {
  final String movieId;
  GetDetailsEvent({required this.movieId});
}

class GetReviewEvent extends HomeEvent {
  final String movieId;
  GetReviewEvent({required this.movieId});
}
class GetCreditsEvent extends HomeEvent {
  final String movieId;
  GetCreditsEvent({required this.movieId});
}