import 'package:http/http.dart';
import 'package:movies_app/features/initial_page/details_screen/data/model/movie_details_response_model.dart';

import '../model/credits_response_model.dart';
import '../model/review_response_model.dart';

class DetailsDataSource {

  Future<MovieDetailsResponseModel> getMovieDetails(String movieId) async {
    // https://api.themoviedb.org/3/movie/:movie_id
    final result = await get(Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '/3/movie/$movieId',
      queryParameters: {
        'api_key': 'edac796678edf5c515b5cd21edee2aaa',
      },
    ));
    print(result.statusCode);
    if (result.statusCode == 200) {
      return movieDetailsResponseModelFromJson(result.body);
    }
    throw Exception('Failed to load movie details: ${result.statusCode}');
  }
  Future<ReviewResponseModel> getReview(String movieId) async {
    //https://api.themoviedb.org/3/movie/:movie_id/reviews?api_key=in fugiat
    final result = await get(Uri(
        scheme:'https',
        host:'api.themoviedb.org',
        path:'/3/movie/$movieId/reviews',
        queryParameters: {
          'api_key': 'edac796678edf5c515b5cd21edee2aaa'
        }
    ));
    print(result.statusCode);
    print('reveiwStatus');
    if(result.statusCode == 200){
      return movieReviewResponseModelFromJson(result.body);
    }
    throw (e) {
      e.toString();
    };
  }

  Future<CreditsResponseModel> getCast(String movieId) async {
    //https://api.themoviedb.org/3/movie/:movie_id/reviews?api_key=in fugiat
    final result = await get(Uri(
        scheme:'https',
        host:'api.themoviedb.org',
        path:'/3/movie/$movieId/reviews',
        queryParameters: {
          'api_key': 'edac796678edf5c515b5cd21edee2aaa'
        }
    ));
    print(result.statusCode);
    if(result.statusCode == 200){
      return creditsReviewResponseModelFromJson(result.body);
    }
    throw (e) {
      e.toString();
    };
  }

}