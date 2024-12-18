part of 'home_bloc.dart';

class HomeState {
  final Status topRatedStatus;
  final Status categoriesStatus;
  final Status movieStatus;

  final Status creditsStatus;
  final Status reviewStatus;
  final Status detailsStatus;

  final MovieDetailsResponseModel? moviesDetails;
  final List<ReviewModel>? review;
  final List<Cast>? cast;

  final List<MovieModel>? topRated;
  final List<MovieModel>? movie;
  final List<GenreModel>? genres;

  const HomeState({
     this.topRatedStatus = Status.initial,
     this.categoriesStatus = Status.initial,
     this.movieStatus = Status.initial,
     this.creditsStatus = Status.initial,
     this.reviewStatus = Status.initial,
     this.detailsStatus = Status.initial,
    this.moviesDetails,
    this.review = const [],
    this.cast = const [],
    this.topRated = const [],
    this.movie = const [],
    this.genres = const [],
  });

  HomeState copyWith({
    Status? topRatedStatus,
    Status? categoriesStatus,
    Status? movieStatus,
    Status? creditsStatus,
    Status? reviewStatus,
    Status? detailsStatus,
    MovieDetailsResponseModel? moviesDetails,
    List<ReviewModel>? review,
    List<Cast>? cast,
    List<MovieModel>? topRated,
    List<MovieModel>? movie,
    List<GenreModel>? genres,
  }) {
    return HomeState(
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      movieStatus: movieStatus ?? this.movieStatus,
      creditsStatus: creditsStatus ?? this.creditsStatus,
      reviewStatus: reviewStatus ?? this.reviewStatus,
      detailsStatus: detailsStatus ?? this.detailsStatus,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      review: review ?? this.review,
      cast: cast ?? this.cast,
      topRated: topRated ?? this.topRated,
      movie: movie ?? this.movie,
      genres: genres ?? this.genres,
    );
  }
}


