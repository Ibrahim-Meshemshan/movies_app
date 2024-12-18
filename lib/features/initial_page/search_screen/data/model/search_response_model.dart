// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchResponseModel searchModelFromJson(String str) => SearchResponseModel.fromJson(json.decode(str));

String searchModelToJson(SearchResponseModel data) => json.encode(data.toJson());

class SearchResponseModel {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  SearchResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
    page: json["page"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalLanguage {
  EN,
  ES,
  FR
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
