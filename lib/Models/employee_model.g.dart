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
