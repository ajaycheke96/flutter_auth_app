import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EmployeeProfileModel {
  int? id;
  String? name;
  String? uniqueIdentificationNumber;
  String? contactNumber;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? motherTongue;
  String? presentAddress;
  String? permanentAddress;
  String? photo;
  String? fatherName;
  String? motherName;
  String? spouseName;
  String? maritalStatus;
  String? dateOfAnniversary;
  List<EmployeeDesignationModel>? employeeDesignations;
  List<SubjectTeacherModel>? subjectTeachers;

  EmployeeProfileModel({
    this.id,
    this.name,
    this.uniqueIdentificationNumber,
    this.contactNumber,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.motherTongue,
    this.presentAddress,
    this.permanentAddress,
    this.photo,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.maritalStatus,
    this.dateOfAnniversary,
    this.employeeDesignations,
    this.subjectTeachers,
  });

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeProfileModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EmployeeDesignationModel {
  int? id;
  String? createdAt;
  String? dateEffective;
  String? dateEnd;
  String? options;
  String? remarks;
  String? updatedAt;
  String? uploadToken;
  DepartmentModel? department;
  DesignationModel? designation;

  EmployeeDesignationModel(
      {this.id,
      this.createdAt,
      this.dateEffective,
      this.dateEnd,
      this.options,
      this.remarks,
      this.updatedAt,
      this.uploadToken,
      this.department,
      this.designation});

  factory EmployeeDesignationModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDesignationModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeDesignationModelToJson(this);
}

@JsonSerializable()
class DepartmentModel {
  int? id;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  DepartmentModel(
      {this.id,
      this.createdAt,
      this.description,
      this.name,
      this.options,
      this.updatedAt});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DesignationModel {
  int? id;
  String? createdAt;
  String? description;
  int? isTeachingEmployee;
  String? name;
  String? options;
  String? updatedAt;
  DepartmentModel? employeeCategory;

  DesignationModel(
      {this.id,
      this.createdAt,
      this.description,
      this.isTeachingEmployee,
      this.name,
      this.options,
      this.updatedAt,
      this.employeeCategory});

  factory DesignationModel.fromJson(Map<String, dynamic> json) =>
      _$DesignationModelFromJson(json);
  Map<String, dynamic> toJson() => _$DesignationModelToJson(this);
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
