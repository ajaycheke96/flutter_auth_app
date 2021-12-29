import 'package:json_annotation/json_annotation.dart';

part 'meeting_model.g.dart';

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
@JsonSerializable()
class MeetingModel {
  /// Creates a meeting class with required details.
  MeetingModel({
    this.eventName,
    this.notes,
    this.subject,
    this.from,
    this.to,
    this.background,
    this.isAllDay = false,
  });

  String? eventName;

  String? notes;

  String? subject;

  DateTime? from;

  DateTime? to;

  String? background;

  bool? isAllDay;

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingModelToJson(this);

  List<MeetingModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => MeetingModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
