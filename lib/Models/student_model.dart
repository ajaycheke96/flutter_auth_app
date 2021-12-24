import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Models/employee_model.dart';
import 'package:flutter_auth_app/Models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentModel {
  int? id;
  String? birthPlace;
  String? contactNumber;
  String? createdAt;
  String? dateOfBirth;
  String? email;
  String? emergencyContactName;
  String? emergencyContactNumber;
  String? firstName;
  String? gender;
  String? lastName;
  String? middleName;
  String? motherTongue;
  String? nationality;
  String? options;
  String? permanentAddressLine1;
  String? permanentAddressLine2;
  String? permanentCity;
  String? permanentCountry;
  String? permanentState;
  String? permanentZipcode;
  String? presentAddressLine1;
  String? presentAddressLine2;
  String? presentCity;
  String? presentCountry;
  String? presentState;
  String? presentZipcode;
  int? sameAsPresentAddress;
  String? studentPhoto;
  String? uniqueIdentificationNumber;
  String? updatedAt;
  String? uuid;
  List<StudentAccountModel>? studentAccounts;
  List<StudentDocumentModel>? studentDocuments;
  List<StudentQualificationModel>? studentQualifications;
  List<StudentSiblingModel>? studentSiblings2;
  BloodGroupModel? bloodGroup;
  CasteModel? caste;
  CategoryModel? category;
  ReligionModel? religion;
  StudentParentModel? studentParent;
  UserModel? user;

  StudentModel({
    this.id,
    this.birthPlace,
    this.contactNumber,
    this.createdAt,
    this.dateOfBirth,
    this.email,
    this.emergencyContactName,
    this.emergencyContactNumber,
    this.firstName,
    this.gender,
    this.lastName,
    this.middleName,
    this.motherTongue,
    this.nationality,
    this.options,
    this.permanentAddressLine1,
    this.permanentAddressLine2,
    this.permanentCity,
    this.permanentCountry,
    this.permanentState,
    this.permanentZipcode,
    this.presentAddressLine1,
    this.presentAddressLine2,
    this.presentCity,
    this.presentCountry,
    this.presentState,
    this.presentZipcode,
    this.sameAsPresentAddress,
    this.studentPhoto,
    this.uniqueIdentificationNumber,
    this.updatedAt,
    this.uuid,
    this.studentAccounts,
    this.studentDocuments,
    this.studentQualifications,
    this.studentSiblings2,
    this.bloodGroup,
    this.caste,
    this.category,
    this.religion,
    this.studentParent,
    this.user,
  });

  StudentModel.empty();

  static List<StudentModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
      .toList();

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
  // static StudentModel empty()=> StudentModel(0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', [], [], [], [], bloodGroup, caste, category, religion, studentParent, user);
}

@JsonSerializable()
class StudentAccountModel {
  int? id;
  String? accountNumber;
  String? bankIdentificationCode;
  String? bankName;
  String? branchName;
  String? createdAt;
  String? description;
  String? name;
  String? options;
  String? updatedAt;

  StudentAccountModel({
    this.id,
    this.accountNumber,
    this.bankIdentificationCode,
    this.bankName,
    this.branchName,
    this.createdAt,
    this.description,
    this.name,
    this.options,
    this.updatedAt,
  });

  factory StudentAccountModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAccountModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StudentDocumentModel {
  int? id;
  String? createdAt;
  String? description;
  String? options;
  String? title;
  String? updatedAt;
  String? uploadToken;
  StudentDocumentTypeModel? studentDocumentType;

  StudentDocumentModel({
    this.id,
    this.createdAt,
    this.description,
    this.options,
    this.title,
    this.updatedAt,
    this.uploadToken,
    this.studentDocumentType,
  });

  factory StudentDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentDocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentDocumentModelToJson(this);
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

@JsonSerializable()
class StudentQualificationModel {
  int? id;
  String? boardName;
  String? createdAt;
  String? description;
  String? endPeriod;
  String? instituteName;
  String? options;
  String? result;
  String? standard;
  String? startPeriod;
  String? updatedAt;
  String? uploadToken;

  StudentQualificationModel({
    this.id,
    this.boardName,
    this.createdAt,
    this.description,
    this.endPeriod,
    this.instituteName,
    this.options,
    this.result,
    this.standard,
    this.startPeriod,
    this.updatedAt,
    this.uploadToken,
  });

  factory StudentQualificationModel.fromJson(Map<String, dynamic> json) =>
      _$StudentQualificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentQualificationModelToJson(this);
}

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

@JsonSerializable(explicitToJson: true)
class StudentParentModel {
  int? id;
  String? createdAt;
  String? firstGuardianAnnualIncome;
  String? firstGuardianContactNumber1;
  String? firstGuardianContactNumber2;
  String? firstGuardianDateOfBirth;
  String? firstGuardianEmail;
  String? firstGuardianName;
  String? firstGuardianOccupation;
  String? firstGuardianPhoto;
  String? firstGuardianQualification;
  String? firstGuardianRelation;
  String? firstGuardianUniqueIdentificationNumber;
  String? options;
  String? secondGuardianAnnualIncome;
  String? secondGuardianContactNumber1;
  String? secondGuardianContactNumber2;
  String? secondGuardianDateOfBirth;
  String? secondGuardianEmail;
  String? secondGuardianName;
  String? secondGuardianOccupation;
  String? secondGuardianPhoto;
  String? secondGuardianQualification;
  String? secondGuardianRelation;
  String? secondGuardianUniqueIdentificationNumber;
  String? thirdGuardianName;
  String? thirdGuardianRelation;
  String? updatedAt;
  UserModel? user;

  StudentParentModel({
    this.id,
    this.createdAt,
    this.firstGuardianAnnualIncome,
    this.firstGuardianContactNumber1,
    this.firstGuardianContactNumber2,
    this.firstGuardianDateOfBirth,
    this.firstGuardianEmail,
    this.firstGuardianName,
    this.firstGuardianOccupation,
    this.firstGuardianPhoto,
    this.firstGuardianQualification,
    this.firstGuardianRelation,
    this.firstGuardianUniqueIdentificationNumber,
    this.options,
    this.secondGuardianAnnualIncome,
    this.secondGuardianContactNumber1,
    this.secondGuardianContactNumber2,
    this.secondGuardianDateOfBirth,
    this.secondGuardianEmail,
    this.secondGuardianName,
    this.secondGuardianOccupation,
    this.secondGuardianPhoto,
    this.secondGuardianQualification,
    this.secondGuardianRelation,
    this.secondGuardianUniqueIdentificationNumber,
    this.thirdGuardianName,
    this.thirdGuardianRelation,
    this.updatedAt,
    this.user,
  });

  factory StudentParentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentParentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentParentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StudentSiblingModel {
  int? id;
  String? createdAt;
  String? options;
  String? updatedAt;
  StudentModel? student1;

  StudentSiblingModel({
    this.id,
    this.createdAt,
    this.options,
    this.updatedAt,
    this.student1,
  });

  factory StudentSiblingModel.fromJson(Map<String, dynamic> json) =>
      _$StudentSiblingModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentSiblingModelToJson(this);
}

// Student Profile Model
@JsonSerializable()
class StudentProfile {
  int? studentId;
  String? studentName;
  String? uniqueIdentificationNumber;
  String? contactNumber;
  String? emailId;
  String? dateOfBirth;
  String? gender;
  String? motherTongue;
  String? presentAddress;
  String? permanentAddress;
  String? studentPhoto;
  int? studentParentId;
  String? firstGuardianName;
  String? firstGuardianContact;
  String? firstGuardianEmail;
  String? firstGuardianRelation;
  String? secondGuardianName;
  String? secondGuardianContact;
  String? secondGuardianEmail;
  String? secondGuardianRelation;
  int? batchId;
  String? batchName;
  int? courseId;
  String? courseName;

  StudentProfile({
    this.studentId,
    this.studentName,
    this.uniqueIdentificationNumber,
    this.contactNumber,
    this.emailId,
    this.dateOfBirth,
    this.gender,
    this.motherTongue,
    this.presentAddress,
    this.permanentAddress,
    this.studentPhoto,
    this.studentParentId,
    this.firstGuardianName,
    this.firstGuardianContact,
    this.firstGuardianEmail,
    this.firstGuardianRelation,
    this.secondGuardianName,
    this.secondGuardianContact,
    this.secondGuardianEmail,
    this.secondGuardianRelation,
    this.batchId,
    this.batchName,
    this.courseId,
    this.courseName,
  });

  factory StudentProfile.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileFromJson(json);
  Map<String, dynamic> toJson() => _$StudentProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ParentProfileModel {
  StudentParentModel? studentParent;
  List<StudentProfile>? students;

  ParentProfileModel({this.studentParent, this.students});

  factory ParentProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ParentProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentProfileModelToJson(this);
}

// Student Attendance
@JsonSerializable(explicitToJson: true)
class StudentAttendanceModel {
  int? id;
  String? attendance;
  String? createdAt;
  String? dateOfAttendance;
  String? isDefault;
  String? options;
  String? session;
  String? updatedAt;
  BatchModel? batch;
  SubjectModel? subject;
  List<StudentAttendanceDetailModel>? studentAttendanceDetails;

  StudentAttendanceModel(
      {this.id,
      this.attendance,
      this.createdAt,
      this.dateOfAttendance,
      this.isDefault,
      this.options,
      this.session,
      this.updatedAt,
      this.batch,
      this.subject,
      this.studentAttendanceDetails});

  static List<StudentAttendanceModel> parseJsonToList(List<dynamic> json) =>
      (json)
          .map(
              (e) => StudentAttendanceModel.fromJson(e as Map<String, dynamic>))
          .toList();

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAttendanceModelToJson(this);
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
}

@JsonSerializable(explicitToJson: true)
class StudentAttendanceDetailModel {
  int? id;
  String? createdAt;
  String? status;
  String? updatedAt;
  StudentRecordModel? studentRecord;

  StudentAttendanceDetailModel(
      {this.id,
      this.createdAt,
      this.status,
      this.updatedAt,
      this.studentRecord});

  factory StudentAttendanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAttendanceDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StudentRecordModel {
  int? id;
  String? createdAt;
  String? dateOfEntry;
  String? dateOfExit;
  String? entryRemarks;
  String? exitRemarks;
  int? isPromoted;
  String? options;
  String? rollNumber;
  String? terminationReason;
  String? updatedAt;
  String? uploadToken;
  AcademicSessionModel? academicSession;
  BatchModel? batch;
  StudentModel? student;

  StudentRecordModel(
      {this.id,
      this.createdAt,
      this.dateOfEntry,
      this.dateOfExit,
      this.entryRemarks,
      this.exitRemarks,
      this.isPromoted,
      this.options,
      this.rollNumber,
      this.terminationReason,
      this.updatedAt,
      this.uploadToken,
      this.academicSession,
      this.batch,
      this.student});

  static List<StudentRecordModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => StudentRecordModel.fromJson(e as Map<String, dynamic>))
      .toList();

  factory StudentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$StudentRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentRecordModelToJson(this);
}
