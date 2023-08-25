import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_info.g.dart';

@JsonSerializable()
@immutable
class SourceInfo {
  const SourceInfo({
    this.id,
    this.name,
  });

  factory SourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SourceInfoToJson(this);

  final String? id;
  final String? name;
}
