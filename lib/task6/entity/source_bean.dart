import 'package:json_annotation/json_annotation.dart';

part 'source_bean.g.dart';

@JsonSerializable()
class SourceBean {
  SourceBean({required this.id, required this.name});

  factory SourceBean.fromJson(Map<String, dynamic> json) =>
      _$SourceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SourceBeanToJson(this);

  late String? id;
  late String name;
}
