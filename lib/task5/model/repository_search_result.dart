import 'package:json_annotation/json_annotation.dart';
part 'repository_search_result.g.dart';

@JsonSerializable()
class RepositorySearchResult {

  RepositorySearchResult({
    required this.items,
  });

  factory RepositorySearchResult.fromJson(Map<String, dynamic> json)
    => _$RepositorySearchResultFromJson(json);

  final List<RepositoryInfo> items;

  Map<String, dynamic> toJson() => _$RepositorySearchResultToJson(this);
}

@JsonSerializable()
class RepositoryInfo {

  RepositoryInfo({
    this.id,
    this.name,
    this.fullName,
    this.description,
  });

  factory RepositoryInfo.fromJson(Map<String, dynamic> json)
  => _$RepositoryInfoFromJson(json);

  final int? id;
  final String? name;
  final String? fullName;
  final String? description;

  Map<String, dynamic> toJson() => _$RepositoryInfoToJson(this);
}
