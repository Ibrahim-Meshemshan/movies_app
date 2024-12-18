import 'package:http/http.dart' as http;
import 'package:movies_app/features/initial_page/search_screen/data/model/search_response_model.dart';

class SearchDataSource {
  static const String apiKey = 'edac796678edf5c515b5cd21edee2aaa';
  static const String baseUrl = 'api.themoviedb.org';

  static Future<SearchResponseModel> getSearch(String? query) async {
    if (query == null || query.trim().isEmpty) {
      throw Exception("Query parameter cannot be empty");
    }

    try {
      final result = await http.get(
        Uri(
          scheme: 'https',
          host: baseUrl,
          path: '/3/search/movie',
          queryParameters: {
            'query': query,
            'api_key': apiKey,
          },
        ),
      );

      if (result.statusCode == 200) {
        return searchModelFromJson(result.body);
      } else {
        throw Exception(
            "Failed to fetch search results. Status code: ${result.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred while fetching search results: $e");
    }
  }
}
