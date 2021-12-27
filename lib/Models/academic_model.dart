import 'package:flutter_auth_app/Models/exam_model.dart';
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

@JsonSerializable(explicitToJson: true)
class BatchModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  int? position;
  String? updatedAt;
  CourseModel? course;
  ExamGradeModel? examGrade;
  ExamObservationModel? examObservation;

  BatchModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.position,
      this.updatedAt,
      this.course,
      this.examGrade,
      this.examObservation});

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$BatchModelToJson(this);

  List<BatchModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => BatchModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

@JsonSerializable(explicitToJson: true)
class CourseModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  int? position;
  String? updatedAt;
  AcademicSessionModel? academicSession;
  CourseGroupModel? courseGroup;

  CourseModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.position,
      this.updatedAt,
      this.academicSession,
      this.courseGroup});

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CourseGroupModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  int? position;
  String? updatedAt;
  AcademicSessionModel? academicSession;

  CourseGroupModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.position,
      this.updatedAt,
      this.academicSession});

  factory CourseGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CourseGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseGroupModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubjectModel {
  int? id;
  String? code;
  String? createdAt;
  String? description;
  int? hasNoExam;
  int? isElective;
  int? maxClassPerWeek;
  String? name;
  String? options;
  int? position;
  String? shortcode;
  String? updatedAt;
  BatchModel? batch;

  SubjectModel(
      {this.id,
      this.code,
      this.createdAt,
      this.description,
      this.hasNoExam,
      this.isElective,
      this.maxClassPerWeek,
      this.name,
      this.options,
      this.position,
      this.shortcode,
      this.updatedAt,
      this.batch});

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

  List<SubjectModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

@JsonSerializable(explicitToJson: true)
class SubjectTeacherModel {
  int? id;
  String? createdAt;
  String? dateEffective;
  String? description;
  String? options;
  String? updatedAt;
  SubjectModel? subject;

  SubjectTeacherModel(
      {this.id,
      this.createdAt,
      this.dateEffective,
      this.description,
      this.options,
      this.updatedAt,
      this.subject});

  factory SubjectTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectTeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectTeacherModelToJson(this);
}
