import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_readme.freezed.dart';
part 'repository_readme.g.dart';

@freezed
class RepositoryReadme with _$RepositoryReadme {
  const factory RepositoryReadme({
    required String name,
    required String path,
    required String sha,
    required int size,
    required String url,
    required String htmlUrl,
    required String gitUrl,
    required String downloadUrl,
    required String type,
    required String content,
    required String encoding,
  }) = _RepositoryReadme;

  factory RepositoryReadme.fromJson(Map<String, dynamic> json) =>
      _$RepositoryReadmeFromJson(json);
}
