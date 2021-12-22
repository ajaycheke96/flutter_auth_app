import 'package:json_annotation/json_annotation.dart';

part 'academic_model.g.dart';

@JsonSerializable()
class AcademicSessionModel {
  AcademicSessionModel({
    this.id,
    this.createdAt,
    this.description,
    this.endDate,
    this.isDefault,
    this.name,
    this.options,
    this.startDate,
    this.updatedAt,
  });

  int? id;
  String? createdAt;
  String? description;
  String? endDate;
  dynamic isDefault;
  String? name;
  String? options;
  String? startDate;
  String? updatedAt;

  factory AcademicSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AcademicSessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AcademicSessionModelToJson(this);

  List<AcademicSessionModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => AcademicSessionModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
