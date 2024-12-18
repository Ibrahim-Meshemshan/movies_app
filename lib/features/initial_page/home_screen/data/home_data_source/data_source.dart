import 'package:http/http.dart';
import 'package:movies_app/core/exception/api_variable.dart';
import 'package:movies_app/core/exception/get_api.dart';
import 'package:movies_app/features/initial_page/home_screen/data/model/genres_response_model.dart';

import '../model/top_rated_response_model.dart';

class HomeDataSource {
  static Future<TopRatedResponseModel> getTopRated()async{
    //https://api.themoviedb.org/3/movie/top_rated
    final result = await get(Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '/3/movie/top_rated',
        queryParameters: {
          'api_key': 'edac796678edf5c515b5cd21edee2aaa'
        }
    ));

    if(result.statusCode == 200){
      return topRatedResponseModelFromJson(result.body);
    }
    throw (e) {
      e.toString();
    };
  }

  static Future<GenresResponseModel> getGenre()async{
    final result = await get(Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '/3/genre/movie/list',
        queryParameters: {
          'api_key': 'edac796678edf5c515b5cd21edee2aaa',
        }
    ));

    if(result.statusCode == 200){
      return genresResponseModelFromJson(result.body);
    }
    throw (e) {
      e.toString();
    };
  }

  static Future<TopRatedResponseModel> getDiscoverMovies(String ?genreId)async{
    //https://api.themoviedb.org/3/discover/movie?with_genres=27
    final result = await get(Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '/3/discover/movie',
        queryParameters: {
          'api_key': 'edac796678edf5c515b5cd21edee2aaa',
          if(genreId!=null)
            'with_genres': genreId
        }
    ));

    if(result.statusCode == 200){
      return topRatedResponseModelFromJson(result.body);
    }
    throw (e) {
      e.toString();
    };
  }
}
