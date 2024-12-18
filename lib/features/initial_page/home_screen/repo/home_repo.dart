import 'package:dartz/dartz.dart';
import 'package:movies_app/core/exception/failures.dart';
import 'package:movies_app/core/exception/handling_exception_manager.dart';
import 'package:movies_app/features/initial_page/home_screen/data/home_data_source/data_source.dart';
import 'package:movies_app/features/initial_page/home_screen/data/model/genres_response_model.dart';
import 'package:movies_app/features/initial_page/home_screen/data/model/top_rated_response_model.dart';

import '../../details_screen/data/details_data_source/details_data_source.dart';
import '../../details_screen/data/model/credits_response_model.dart';
import '../../details_screen/data/model/movie_details_response_model.dart';
import '../../details_screen/data/model/review_response_model.dart';

class HomeRepo with HandlingExceptionManager {

  Future<Either<Failure, GenresResponseModel>> getGenre() async {
    return await wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource.getGenre();
        return Right(result);
      },
    );
  }

  Future<Either<Failure, TopRatedResponseModel>> getTopRated() async {
    return await wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource.getTopRated();
        return Right(result);
      },
    );
  }

  Future<Either<Failure, TopRatedResponseModel>> getMovie(
      String? genreId) async {
    return await wrapHandling(
      tryCall: () async {
        final result = await HomeDataSource.getDiscoverMovies(genreId);
        return Right(result);
      },
    );
  }
  Future<Either<Failure, MovieDetailsResponseModel>> getMovieDetails(
      String movieId) async {
    return await wrapHandling(
      tryCall: () async {
        final result = await DetailsDataSource().getMovieDetails(movieId);
        return Right(result);
      },
    );
  }
  Future<Either<Failure, ReviewResponseModel>> getReview(
      String movieId) async {
    return await wrapHandling(
      tryCall: () async {
        final result = await DetailsDataSource().getReview(movieId);
        return Right(result);
      },
    );
  }
  Future<Either<Failure, CreditsResponseModel>> getCredits(
      String movieId) async {
    return await wrapHandling(
      tryCall: () async {
        final result = await DetailsDataSource().getCast(movieId);
        return Right(result);
      },
    );
  }
}
