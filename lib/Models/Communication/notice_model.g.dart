// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      options: json['options'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      targetRoles: json['targetRoles'] as String?,
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'options': instance.options,
      'title': instance.title,
      'type': instance.type,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'targetRoles': instance.targetRoles,
    };
