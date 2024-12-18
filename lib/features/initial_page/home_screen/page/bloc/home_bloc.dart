import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/initial_page/home_screen/data/model/genres_response_model.dart';
import 'package:movies_app/features/initial_page/home_screen/repo/home_repo.dart';

import '../../../../../core/exception/status.dart';
import '../../../details_screen/data/model/credits_response_model.dart';
import '../../../details_screen/data/model/movie_details_response_model.dart';
import '../../../details_screen/data/model/review_response_model.dart';
import '../../data/model/top_rated_response_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetTopRatedEvent>(
      (event, emit) async {
        emit(state.copyWith(topRatedStatus: Status.loading));
        final result = await HomeRepo().getTopRated();
        result.fold(
          (left) => emit(state.copyWith(topRatedStatus: Status.failed)),
          (right) => emit(state.copyWith(
              topRatedStatus: Status.success, topRated: right.results)),
        );
      },
    );

    on<GetCategoriesEvent>(
      (event, emit) async {
        emit(state.copyWith(categoriesStatus: Status.loading));
        final result = await HomeRepo().getGenre();
        result.fold(
          (left) => emit(state.copyWith(categoriesStatus: Status.failed)),
          (right) => emit(state.copyWith(
              categoriesStatus: Status.success, genres: right.genres)),
        );
      },
    );

    on<GetMoviesEvent>(
      (event, emit) async {
        emit(state.copyWith(movieStatus: Status.loading));
        final result = await HomeRepo().getMovie(event.genreId);
        result.fold(
          (left) => emit(state.copyWith(movieStatus: Status.failed)),
          (right) => emit(state.copyWith(
              movieStatus: Status.success, movie: right.results)),
        );
      },
    );

    on<GetDetailsEvent>(
          (event, emit) async {
        emit(state.copyWith(detailsStatus: Status.loading));
        final result = await HomeRepo().getMovieDetails(event.movieId);
        result.fold(
              (left) => emit(state.copyWith(detailsStatus: Status.failed)),
              (right) => emit(state.copyWith(
                  detailsStatus: Status.success, moviesDetails: right)),
        );
      },
    );


    on<GetReviewEvent>(
          (event, emit) async {
        emit(state.copyWith(reviewStatus: Status.loading));
        final result = await HomeRepo().getReview(event.movieId);
        result.fold(
              (left) => emit(state.copyWith(reviewStatus: Status.failed)),
              (right) => emit(state.copyWith(
                  reviewStatus: Status.success, review: right.results)),
        );
        // add(GetReviewEvent(movieId: event.movieId));
        // add(GetCreditsEvent(movieId: event.movieId));
      },
    );

    on<GetCreditsEvent>(
          (event, emit) async {
        emit(state.copyWith(creditsStatus: Status.loading));
        final result = await HomeRepo().getCredits(event.movieId);
        result.fold(
              (left) => emit(state.copyWith(creditsStatus: Status.failed)),
              (right) => emit(state.copyWith(
                  creditsStatus: Status.success, cast: right.cast)),
        );
      },
    );
  }
}
