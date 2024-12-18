// To parse this JSON data, do
//
//     final movieReviewResponseModel = movieReviewResponseModelFromJson(jsonString);

import 'dart:convert';

ReviewResponseModel movieReviewResponseModelFromJson(String str) => ReviewResponseModel.fromJson(json.decode(str));

String movieReviewResponseModelToJson(ReviewResponseModel data) => json.encode(data.toJson());

class ReviewResponseModel {
  final int? id;
  final int? page;
  final List<ReviewModel>? results;
  final int? totalPages;
  final int? totalResults;

  ReviewResponseModel({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) => ReviewResponseModel(
    id: json["id"],
    page: json["page"],
    results: json["results"] == null ? [] : List<ReviewModel>.from(json["results"]!.map((x) => ReviewModel.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class ReviewModel {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  ReviewModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    author: json["author"],
    authorDetails: json["author_details"] == null ? null : AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails?.toJson(),
    "content": content,
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
  };
}

class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final int? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}
