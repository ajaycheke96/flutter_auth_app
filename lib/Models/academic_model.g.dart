// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicSessionModel _$AcademicSessionModelFromJson(
        Map<String, dynamic> json) =>
    AcademicSessionModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      endDate: json['endDate'] as String?,
      isDefault: json['isDefault'],
      name: json['name'] as String?,
      options: json['options'] as String?,
      startDate: json['startDate'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$AcademicSessionModelToJson(
        AcademicSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'endDate': instance.endDate,
      'isDefault': instance.isDefault,
      'name': instance.name,
      'options': instance.options,
      'startDate': instance.startDate,
      'updatedAt': instance.updatedAt,
    };
