class ApiVariable {

  final String _scheme = 'https';
  final String _host = 'api.themoviedb.org/3';
  final port = 8000;

  Uri _mainUri(String path, {Map<String, String>? params}) {
    return Uri(
        host: _host,scheme: _scheme,path: path, queryParameters: params
    );
  }
  Uri getPopular() => _mainUri('/movie/top_rated');
  Uri getCategories() => _mainUri('genre/movie/list');
  Uri getMovie(Map<String,String> ? params  ) => _mainUri('discover/movie',params: params);

}