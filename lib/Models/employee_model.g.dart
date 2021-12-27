// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeProfileModel _$EmployeeProfileModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeProfileModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      uniqueIdentificationNumber: json['uniqueIdentificationNumber'] as String?,
      contactNumber: json['contactNumber'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      motherTongue: json['motherTongue'] as String?,
      presentAddress: json['presentAddress'] as String?,
      permanentAddress: json['permanentAddress'] as String?,
      photo: json['photo'] as String?,
      fatherName: json['fatherName'] as String?,
      motherName: json['motherName'] as String?,
      spouseName: json['spouseName'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      dateOfAnniversary: json['dateOfAnniversary'] as String?,
      employeeDesignations: (json['employeeDesignations'] as List<dynamic>?)
          ?.map((e) =>
              EmployeeDesignationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjectTeachers: (json['subjectTeachers'] as List<dynamic>?)
          ?.map((e) => SubjectTeacherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeProfileModelToJson(
        EmployeeProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uniqueIdentificationNumber': instance.uniqueIdentificationNumber,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'motherTongue': instance.motherTongue,
      'presentAddress': instance.presentAddress,
      'permanentAddress': instance.permanentAddress,
      'photo': instance.photo,
      'fatherName': instance.fatherName,
      'motherName': instance.motherName,
      'spouseName': instance.spouseName,
      'maritalStatus': instance.maritalStatus,
      'dateOfAnniversary': instance.dateOfAnniversary,
      'employeeDesignations':
          instance.employeeDesignations?.map((e) => e.toJson()).toList(),
      'subjectTeachers':
          instance.subjectTeachers?.map((e) => e.toJson()).toList(),
    };

EmployeeDesignationModel _$EmployeeDesignationModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeDesignationModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      dateEffective: json['dateEffective'] as String?,
      dateEnd: json['dateEnd'] as String?,
      options: json['options'] as String?,
      remarks: json['remarks'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      department: json['department'] == null
          ? null
          : DepartmentModel.fromJson(
              json['department'] as Map<String, dynamic>),
      designation: json['designation'] == null
          ? null
          : DesignationModel.fromJson(
              json['designation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeDesignationModelToJson(
        EmployeeDesignationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'dateEffective': instance.dateEffective,
      'dateEnd': instance.dateEnd,
      'options': instance.options,
      'remarks': instance.remarks,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'department': instance.department?.toJson(),
      'designation': instance.designation?.toJson(),
    };

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
    };

DesignationModel _$DesignationModelFromJson(Map<String, dynamic> json) =>
    DesignationModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      isTeachingEmployee: json['isTeachingEmployee'] as int?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
      employeeCategory: json['employeeCategory'] == null
          ? null
          : DepartmentModel.fromJson(
              json['employeeCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DesignationModelToJson(DesignationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'isTeachingEmployee': instance.isTeachingEmployee,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
      'employeeCategory': instance.employeeCategory?.toJson(),
    };
