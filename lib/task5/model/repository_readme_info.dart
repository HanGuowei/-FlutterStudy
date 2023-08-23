import 'package:json_annotation/json_annotation.dart';
part 'repository_readme_info.g.dart';

@JsonSerializable()
class RepositoryReadmeInfo {

  RepositoryReadmeInfo({
    this.name,
    this.content,
  });

  factory RepositoryReadmeInfo.fromJson(Map<String, dynamic> json)
  => _$RepositoryReadmeInfoFromJson(json);

  final String? name;
  final String? content;

  Map<String, dynamic> toJson() => _$RepositoryReadmeInfoToJson(this);
}
