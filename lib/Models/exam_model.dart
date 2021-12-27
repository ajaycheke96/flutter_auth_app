import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamGradeModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;
  List<ExamGradeDetailModel>? examGradeDetails;
  AcademicSessionModel? academicSession;

  ExamGradeModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.updatedAt,
      this.examGradeDetails,
      this.academicSession});

  factory ExamGradeModel.fromJson(Map<String, dynamic> json) =>
      _$ExamGradeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamGradeModelToJson(this);
}

@JsonSerializable()
class ExamGradeDetailModel {
  int? id;
  String? createdAt;
  String? description;
  int? maxPercentage;
  int? minPercentage;
  String? name;
  String? options;
  String? updatedAt;

  ExamGradeDetailModel(
      {this.id,
      this.createdAt,
      this.description,
      this.maxPercentage,
      this.minPercentage,
      this.name,
      this.options,
      this.updatedAt});

  factory ExamGradeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ExamGradeDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamGradeDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExamObservationModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;
  List<ExamObservationDetailModel>? examObservationDetails;
  AcademicSessionModel? academicSession;

  ExamObservationModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.updatedAt,
      this.examObservationDetails,
      this.academicSession});

  factory ExamObservationModel.fromJson(Map<String, dynamic> json) =>
      _$ExamObservationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamObservationModelToJson(this);
}

@JsonSerializable()
class ExamObservationDetailModel {
  int? id;
  String? createdAt;
  String? description;
  int? maxMark;
  String? name;
  String? options;
  int? position;
  String? updatedAt;

  ExamObservationDetailModel(
      {this.id,
      this.createdAt,
      this.description,
      this.maxMark,
      this.name,
      this.options,
      this.position,
      this.updatedAt});

  factory ExamObservationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ExamObservationDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamObservationDetailModelToJson(this);
}
