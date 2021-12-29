// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingModel _$MeetingModelFromJson(Map<String, dynamic> json) => MeetingModel(
      eventName: json['eventName'] as String?,
      notes: json['notes'] as String?,
      subject: json['subject'] as String?,
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      background: json['background'] as String?,
      isAllDay: json['isAllDay'] as bool? ?? false,
    );

Map<String, dynamic> _$MeetingModelToJson(MeetingModel instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'notes': instance.notes,
      'subject': instance.subject,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'background': instance.background,
      'isAllDay': instance.isAllDay,
    };
