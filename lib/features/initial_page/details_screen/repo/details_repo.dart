import 'package:dartz/dartz.dart';
import 'package:movies_app/core/exception/failures.dart';
import 'package:movies_app/core/exception/handling_exception_manager.dart';
import 'package:movies_app/features/initial_page/details_screen/data/details_data_source/details_data_source.dart';
import 'package:movies_app/features/initial_page/details_screen/data/model/credits_response_model.dart';
import 'package:movies_app/features/initial_page/details_screen/data/model/review_response_model.dart';

import '../data/model/movie_details_response_model.dart';

class DetailsRepo with HandlingExceptionManager {


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
