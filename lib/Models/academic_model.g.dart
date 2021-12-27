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

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) => BatchModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      position: json['position'] as int?,
      updatedAt: json['updatedAt'] as String?,
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      examGrade: json['examGrade'] == null
          ? null
          : ExamGradeModel.fromJson(json['examGrade'] as Map<String, dynamic>),
      examObservation: json['examObservation'] == null
          ? null
          : ExamObservationModel.fromJson(
              json['examObservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BatchModelToJson(BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'position': instance.position,
      'updatedAt': instance.updatedAt,
      'course': instance.course?.toJson(),
      'examGrade': instance.examGrade?.toJson(),
      'examObservation': instance.examObservation?.toJson(),
    };

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      position: json['position'] as int?,
      updatedAt: json['updatedAt'] as String?,
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
      courseGroup: json['courseGroup'] == null
          ? null
          : CourseGroupModel.fromJson(
              json['courseGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'position': instance.position,
      'updatedAt': instance.updatedAt,
      'academicSession': instance.academicSession?.toJson(),
      'courseGroup': instance.courseGroup?.toJson(),
    };

CourseGroupModel _$CourseGroupModelFromJson(Map<String, dynamic> json) =>
    CourseGroupModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      position: json['position'] as int?,
      updatedAt: json['updatedAt'] as String?,
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseGroupModelToJson(CourseGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'position': instance.position,
      'updatedAt': instance.updatedAt,
      'academicSession': instance.academicSession?.toJson(),
    };

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) => SubjectModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      hasNoExam: json['hasNoExam'] as int?,
      isElective: json['isElective'] as int?,
      maxClassPerWeek: json['maxClassPerWeek'] as int?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      position: json['position'] as int?,
      shortcode: json['shortcode'] as String?,
      updatedAt: json['updatedAt'] as String?,
      batch: json['batch'] == null
          ? null
          : BatchModel.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'hasNoExam': instance.hasNoExam,
      'isElective': instance.isElective,
      'maxClassPerWeek': instance.maxClassPerWeek,
      'name': instance.name,
      'options': instance.options,
      'position': instance.position,
      'shortcode': instance.shortcode,
      'updatedAt': instance.updatedAt,
      'batch': instance.batch?.toJson(),
    };

SubjectTeacherModel _$SubjectTeacherModelFromJson(Map<String, dynamic> json) =>
    SubjectTeacherModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      dateEffective: json['dateEffective'] as String?,
      description: json['description'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectTeacherModelToJson(
        SubjectTeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'dateEffective': instance.dateEffective,
      'description': instance.description,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
      'subject': instance.subject?.toJson(),
    };
