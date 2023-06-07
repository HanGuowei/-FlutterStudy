import 'package:json_annotation/json_annotation.dart';

part 'source_bean.g.dart';

@JsonSerializable()
class SourceBean {
  SourceBean({required this.id, required this.name});

  factory SourceBean.fromJson(Map<String, dynamic> json) =>
      _$SourceBeanFromJson(json);

  late String? id;
  late String name;
}
