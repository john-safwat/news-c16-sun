import 'package:json_annotation/json_annotation.dart';

part 'sources_response.g.dart';

@JsonSerializable()
class SourcesResponse {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "sources")
  final List<SourceDTO>? sources;

  const SourcesResponse ({
    this.status,
    this.sources,
    this.message
  });

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return _$SourcesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourcesResponseToJson(this);
  }
}

@JsonSerializable()
class SourceDTO {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "country")
  final String? country;

  SourceDTO ({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory SourceDTO.fromJson(Map<String, dynamic> json) {
    return _$SourcesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourcesToJson(this);
  }
}


