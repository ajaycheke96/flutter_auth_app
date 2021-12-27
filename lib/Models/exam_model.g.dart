// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamGradeModel _$ExamGradeModelFromJson(Map<String, dynamic> json) =>
    ExamGradeModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
      examGradeDetails: (json['examGradeDetails'] as List<dynamic>?)
          ?.map((e) => ExamGradeDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamGradeModelToJson(ExamGradeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
      'examGradeDetails':
          instance.examGradeDetails?.map((e) => e.toJson()).toList(),
      'academicSession': instance.academicSession?.toJson(),
    };

ExamGradeDetailModel _$ExamGradeDetailModelFromJson(
        Map<String, dynamic> json) =>
    ExamGradeDetailModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      maxPercentage: json['maxPercentage'] as int?,
      minPercentage: json['minPercentage'] as int?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ExamGradeDetailModelToJson(
        ExamGradeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'maxPercentage': instance.maxPercentage,
      'minPercentage': instance.minPercentage,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
    };

ExamObservationModel _$ExamObservationModelFromJson(
        Map<String, dynamic> json) =>
    ExamObservationModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
      examObservationDetails: (json['examObservationDetails'] as List<dynamic>?)
          ?.map((e) =>
              ExamObservationDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamObservationModelToJson(
        ExamObservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
      'examObservationDetails':
          instance.examObservationDetails?.map((e) => e.toJson()).toList(),
      'academicSession': instance.academicSession?.toJson(),
    };

ExamObservationDetailModel _$ExamObservationDetailModelFromJson(
        Map<String, dynamic> json) =>
    ExamObservationDetailModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      maxMark: json['maxMark'] as int?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      position: json['position'] as int?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ExamObservationDetailModelToJson(
        ExamObservationDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'maxMark': instance.maxMark,
      'name': instance.name,
      'options': instance.options,
      'position': instance.position,
      'updatedAt': instance.updatedAt,
    };
