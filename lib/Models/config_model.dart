import 'package:json_annotation/json_annotation.dart';

part 'config_model.g.dart';

@JsonSerializable()
class BloodGroupModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  BloodGroupModel({
    this.id,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory BloodGroupModel.fromJson(Map<String, dynamic> json) =>
      _$BloodGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$BloodGroupModelToJson(this);
}

@JsonSerializable()
class ReligionModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  ReligionModel({
    this.id,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory ReligionModel.fromJson(Map<String, dynamic> json) =>
      _$ReligionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReligionModelToJson(this);
}

@JsonSerializable()
class CategoryModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  CategoryModel({
    this.id,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CasteModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  CasteModel({
    this.id,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory CasteModel.fromJson(Map<String, dynamic> json) =>
      _$CasteModelFromJson(json);
  Map<String, dynamic> toJson() => _$CasteModelToJson(this);
}

@JsonSerializable()
class StudentDocumentTypeModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  StudentDocumentTypeModel({
    this.id,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory StudentDocumentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$StudentDocumentTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentDocumentTypeModelToJson(this);
}
