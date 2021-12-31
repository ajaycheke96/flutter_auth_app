import 'package:json_annotation/json_annotation.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel {
  int? id;
  String? createdAt;
  String? description;
  String? options;
  String? title;
  String? type;
  String? updatedAt;
  String? uploadToken;
  String? targetRoles;

  NoticeModel(
      {this.id,
      this.createdAt,
      this.description,
      this.options,
      this.title,
      this.type,
      this.updatedAt,
      this.uploadToken,
      this.targetRoles});

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);

  List<NoticeModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => NoticeModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
