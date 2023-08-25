import 'package:json_annotation/json_annotation.dart';

part 'source_info.g.dart';

@JsonSerializable()
class SourceInfo {
  SourceInfo({
    this.id,
    this.name,
  });

  factory SourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SourceInfoToJson(this);

  final String? id;
  final String? name;
}
