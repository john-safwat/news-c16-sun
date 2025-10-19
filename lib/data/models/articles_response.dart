import 'package:json_annotation/json_annotation.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "totalResults")
  final int? totalResults;
  @JsonKey(name: "articles")
  final List<ArticleDTO>? articles;

  ArticlesResponse ({
    this.status,
    this.totalResults,
    this.articles,
    this.message
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return _$ArticlesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticlesResponseToJson(this);
  }
}

@JsonSerializable()
class ArticleDTO {
  @JsonKey(name: "source")
  final Source? source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final String? publishedAt;
  @JsonKey(name: "content")
  final String? content;

  ArticleDTO ({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleDTO.fromJson(Map<String, dynamic> json) {
    return _$ArticlesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticlesToJson(this);
  }
}

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  Source ({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return _$SourceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceToJson(this);
  }
}


