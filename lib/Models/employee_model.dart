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