// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: json['id'] as int?,
      birthPlace: json['birthPlace'] as String?,
      contactNumber: json['contactNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      email: json['email'] as String?,
      emergencyContactName: json['emergencyContactName'] as String?,
      emergencyContactNumber: json['emergencyContactNumber'] as String?,
      firstName: json['firstName'] as String?,
      gender: json['gender'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      motherTongue: json['motherTongue'] as String?,
      nationality: json['nationality'] as String?,
      options: json['options'] as String?,
      permanentAddressLine1: json['permanentAddressLine1'] as String?,
      permanentAddressLine2: json['permanentAddressLine2'] as String?,
      permanentCity: json['permanentCity'] as String?,
      permanentCountry: json['permanentCountry'] as String?,
      permanentState: json['permanentState'] as String?,
      permanentZipcode: json['permanentZipcode'] as String?,
      presentAddressLine1: json['presentAddressLine1'] as String?,
      presentAddressLine2: json['presentAddressLine2'] as String?,
      presentCity: json['presentCity'] as String?,
      presentCountry: json['presentCountry'] as String?,
      presentState: json['presentState'] as String?,
      presentZipcode: json['presentZipcode'] as String?,
      sameAsPresentAddress: json['sameAsPresentAddress'] as int?,
      studentPhoto: json['studentPhoto'] as String?,
      uniqueIdentificationNumber: json['uniqueIdentificationNumber'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uuid: json['uuid'] as String?,
      studentAccounts: (json['studentAccounts'] as List<dynamic>?)
          ?.map((e) => StudentAccountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentDocuments: (json['studentDocuments'] as List<dynamic>?)
          ?.map((e) => StudentDocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentQualifications: (json['studentQualifications'] as List<dynamic>?)
          ?.map((e) =>
              StudentQualificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentSiblings2: (json['studentSiblings2'] as List<dynamic>?)
          ?.map((e) => StudentSiblingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloodGroup: json['bloodGroup'] == null
          ? null
          : BloodGroupModel.fromJson(
              json['bloodGroup'] as Map<String, dynamic>),
      caste: json['caste'] == null
          ? null
          : CasteModel.fromJson(json['caste'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      religion: json['religion'] == null
          ? null
          : ReligionModel.fromJson(json['religion'] as Map<String, dynamic>),
      studentParent: json['studentParent'] == null
          ? null
          : StudentParentModel.fromJson(
              json['studentParent'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'birthPlace': instance.birthPlace,
      'contactNumber': instance.contactNumber,
      'createdAt': instance.createdAt,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactNumber': instance.emergencyContactNumber,
      'firstName': instance.firstName,
      'gender': instance.gender,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'motherTongue': instance.motherTongue,
      'nationality': instance.nationality,
      'options': instance.options,
      'permanentAddressLine1': instance.permanentAddressLine1,
      'permanentAddressLine2': instance.permanentAddressLine2,
      'permanentCity': instance.permanentCity,
      'permanentCountry': instance.permanentCountry,
      'permanentState': instance.permanentState,
      'permanentZipcode': instance.permanentZipcode,
      'presentAddressLine1': instance.presentAddressLine1,
      'presentAddressLine2': instance.presentAddressLine2,
      'presentCity': instance.presentCity,
      'presentCountry': instance.presentCountry,
      'presentState': instance.presentState,
      'presentZipcode': instance.presentZipcode,
      'sameAsPresentAddress': instance.sameAsPresentAddress,
      'studentPhoto': instance.studentPhoto,
      'uniqueIdentificationNumber': instance.uniqueIdentificationNumber,
      'updatedAt': instance.updatedAt,
      'uuid': instance.uuid,
      'studentAccounts':
          instance.studentAccounts?.map((e) => e.toJson()).toList(),
      'studentDocuments':
          instance.studentDocuments?.map((e) => e.toJson()).toList(),
      'studentQualifications':
          instance.studentQualifications?.map((e) => e.toJson()).toList(),
      'studentSiblings2':
          instance.studentSiblings2?.map((e) => e.toJson()).toList(),
      'bloodGroup': instance.bloodGroup?.toJson(),
      'caste': instance.caste?.toJson(),
      'category': instance.category?.toJson(),
      'religion': instance.religion?.toJson(),
      'studentParent': instance.studentParent?.toJson(),
      'user': instance.user?.toJson(),
    };

StudentAccountModel _$StudentAccountModelFromJson(Map<String, dynamic> json) =>
    StudentAccountModel(
      id: json['id'] as int?,
      accountNumber: json['accountNumber'] as String?,
      bankIdentificationCode: json['bankIdentificationCode'] as String?,
      bankName: json['bankName'] as String?,
      branchName: json['branchName'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$StudentAccountModelToJson(
        StudentAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNumber': instance.accountNumber,
      'bankIdentificationCode': instance.bankIdentificationCode,
      'bankName': instance.bankName,
      'branchName': instance.branchName,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'name': instance.name,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
    };

StudentDocumentModel _$StudentDocumentModelFromJson(
        Map<String, dynamic> json) =>
    StudentDocumentModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      options: json['options'] as String?,
      title: json['title'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      studentDocumentType: json['studentDocumentType'] == null
          ? null
          : StudentDocumentTypeModel.fromJson(
              json['studentDocumentType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentDocumentModelToJson(
        StudentDocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'options': instance.options,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'studentDocumentType': instance.studentDocumentType?.toJson(),
    };

StudentQualificationModel _$StudentQualificationModelFromJson(
        Map<String, dynamic> json) =>
    StudentQualificationModel(
      id: json['id'] as int?,
      boardName: json['boardName'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      endPeriod: json['endPeriod'] as String?,
      instituteName: json['instituteName'] as String?,
      options: json['options'] as String?,
      result: json['result'] as String?,
      standard: json['standard'] as String?,
      startPeriod: json['startPeriod'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
    );

Map<String, dynamic> _$StudentQualificationModelToJson(
        StudentQualificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boardName': instance.boardName,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'endPeriod': instance.endPeriod,
      'instituteName': instance.instituteName,
      'options': instance.options,
      'result': instance.result,
      'standard': instance.standard,
      'startPeriod': instance.startPeriod,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
    };

StudentParentModel _$StudentParentModelFromJson(Map<String, dynamic> json) =>
    StudentParentModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      firstGuardianAnnualIncome: json['firstGuardianAnnualIncome'] as String?,
      firstGuardianContactNumber1:
          json['firstGuardianContactNumber1'] as String?,
      firstGuardianContactNumber2:
          json['firstGuardianContactNumber2'] as String?,
      firstGuardianDateOfBirth: json['firstGuardianDateOfBirth'] as String?,
      firstGuardianEmail: json['firstGuardianEmail'] as String?,
      firstGuardianName: json['firstGuardianName'] as String?,
      firstGuardianOccupation: json['firstGuardianOccupation'] as String?,
      firstGuardianPhoto: json['firstGuardianPhoto'] as String?,
      firstGuardianQualification: json['firstGuardianQualification'] as String?,
      firstGuardianRelation: json['firstGuardianRelation'] as String?,
      firstGuardianUniqueIdentificationNumber:
          json['firstGuardianUniqueIdentificationNumber'] as String?,
      options: json['options'] as String?,
      secondGuardianAnnualIncome: json['secondGuardianAnnualIncome'] as String?,
      secondGuardianContactNumber1:
          json['secondGuardianContactNumber1'] as String?,
      secondGuardianContactNumber2:
          json['secondGuardianContactNumber2'] as String?,
      secondGuardianDateOfBirth: json['secondGuardianDateOfBirth'] as String?,
      secondGuardianEmail: json['secondGuardianEmail'] as String?,
      secondGuardianName: json['secondGuardianName'] as String?,
      secondGuardianOccupation: json['secondGuardianOccupation'] as String?,
      secondGuardianPhoto: json['secondGuardianPhoto'] as String?,
      secondGuardianQualification:
          json['secondGuardianQualification'] as String?,
      secondGuardianRelation: json['secondGuardianRelation'] as String?,
      secondGuardianUniqueIdentificationNumber:
          json['secondGuardianUniqueIdentificationNumber'] as String?,
      thirdGuardianName: json['thirdGuardianName'] as String?,
      thirdGuardianRelation: json['thirdGuardianRelation'] as String?,
      updatedAt: json['updatedAt'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentParentModelToJson(StudentParentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'firstGuardianAnnualIncome': instance.firstGuardianAnnualIncome,
      'firstGuardianContactNumber1': instance.firstGuardianContactNumber1,
      'firstGuardianContactNumber2': instance.firstGuardianContactNumber2,
      'firstGuardianDateOfBirth': instance.firstGuardianDateOfBirth,
      'firstGuardianEmail': instance.firstGuardianEmail,
      'firstGuardianName': instance.firstGuardianName,
      'firstGuardianOccupation': instance.firstGuardianOccupation,
      'firstGuardianPhoto': instance.firstGuardianPhoto,
      'firstGuardianQualification': instance.firstGuardianQualification,
      'firstGuardianRelation': instance.firstGuardianRelation,
      'firstGuardianUniqueIdentificationNumber':
          instance.firstGuardianUniqueIdentificationNumber,
      'options': instance.options,
      'secondGuardianAnnualIncome': instance.secondGuardianAnnualIncome,
      'secondGuardianContactNumber1': instance.secondGuardianContactNumber1,
      'secondGuardianContactNumber2': instance.secondGuardianContactNumber2,
      'secondGuardianDateOfBirth': instance.secondGuardianDateOfBirth,
      'secondGuardianEmail': instance.secondGuardianEmail,
      'secondGuardianName': instance.secondGuardianName,
      'secondGuardianOccupation': instance.secondGuardianOccupation,
      'secondGuardianPhoto': instance.secondGuardianPhoto,
      'secondGuardianQualification': instance.secondGuardianQualification,
      'secondGuardianRelation': instance.secondGuardianRelation,
      'secondGuardianUniqueIdentificationNumber':
          instance.secondGuardianUniqueIdentificationNumber,
      'thirdGuardianName': instance.thirdGuardianName,
      'thirdGuardianRelation': instance.thirdGuardianRelation,
      'updatedAt': instance.updatedAt,
      'user': instance.user?.toJson(),
    };

StudentSiblingModel _$StudentSiblingModelFromJson(Map<String, dynamic> json) =>
    StudentSiblingModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
      student1: json['student1'] == null
          ? null
          : StudentModel.fromJson(json['student1'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentSiblingModelToJson(
        StudentSiblingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
      'student1': instance.student1?.toJson(),
    };

StudentProfile _$StudentProfileFromJson(Map<String, dynamic> json) =>
    StudentProfile(
      studentId: json['studentId'] as int?,
      studentName: json['studentName'] as String?,
      uniqueIdentificationNumber: json['uniqueIdentificationNumber'] as String?,
      contactNumber: json['contactNumber'] as String?,
      emailId: json['emailId'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      motherTongue: json['motherTongue'] as String?,
      presentAddress: json['presentAddress'] as String?,
      permanentAddress: json['permanentAddress'] as String?,
      studentPhoto: json['studentPhoto'] as String?,
      studentParentId: json['studentParentId'] as int?,
      firstGuardianName: json['firstGuardianName'] as String?,
      firstGuardianContact: json['firstGuardianContact'] as String?,
      firstGuardianEmail: json['firstGuardianEmail'] as String?,
      firstGuardianRelation: json['firstGuardianRelation'] as String?,
      secondGuardianName: json['secondGuardianName'] as String?,
      secondGuardianContact: json['secondGuardianContact'] as String?,
      secondGuardianEmail: json['secondGuardianEmail'] as String?,
      secondGuardianRelation: json['secondGuardianRelation'] as String?,
      batchId: json['batchId'] as int?,
      batchName: json['batchName'] as String?,
      courseId: json['courseId'] as int?,
      courseName: json['courseName'] as String?,
    );

Map<String, dynamic> _$StudentProfileToJson(StudentProfile instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'uniqueIdentificationNumber': instance.uniqueIdentificationNumber,
      'contactNumber': instance.contactNumber,
      'emailId': instance.emailId,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'motherTongue': instance.motherTongue,
      'presentAddress': instance.presentAddress,
      'permanentAddress': instance.permanentAddress,
      'studentPhoto': instance.studentPhoto,
      'studentParentId': instance.studentParentId,
      'firstGuardianName': instance.firstGuardianName,
      'firstGuardianContact': instance.firstGuardianContact,
      'firstGuardianEmail': instance.firstGuardianEmail,
      'firstGuardianRelation': instance.firstGuardianRelation,
      'secondGuardianName': instance.secondGuardianName,
      'secondGuardianContact': instance.secondGuardianContact,
      'secondGuardianEmail': instance.secondGuardianEmail,
      'secondGuardianRelation': instance.secondGuardianRelation,
      'batchId': instance.batchId,
      'batchName': instance.batchName,
      'courseId': instance.courseId,
      'courseName': instance.courseName,
    };

ParentProfileModel _$ParentProfileModelFromJson(Map<String, dynamic> json) =>
    ParentProfileModel(
      studentParent: json['studentParent'] == null
          ? null
          : StudentParentModel.fromJson(
              json['studentParent'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParentProfileModelToJson(ParentProfileModel instance) =>
    <String, dynamic>{
      'studentParent': instance.studentParent?.toJson(),
      'students': instance.students?.map((e) => e.toJson()).toList(),
    };

StudentAttendanceModel _$StudentAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    StudentAttendanceModel(
      id: json['id'] as int?,
      attendance: json['attendance'] as String?,
      createdAt: json['createdAt'] as String?,
      dateOfAttendance: json['dateOfAttendance'] as String?,
      isDefault: json['isDefault'] as String?,
      options: json['options'] as String?,
      session: json['session'] as String?,
      updatedAt: json['updatedAt'] as String?,
      batch: json['batch'] == null
          ? null
          : BatchModel.fromJson(json['batch'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : SubjectModel.fromJson(json['subject'] as Map<String, dynamic>),
      studentAttendanceDetails: (json['studentAttendanceDetails']
              as List<dynamic>?)
          ?.map((e) =>
              StudentAttendanceDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentAttendanceModelToJson(
        StudentAttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendance': instance.attendance,
      'createdAt': instance.createdAt,
      'dateOfAttendance': instance.dateOfAttendance,
      'isDefault': instance.isDefault,
      'options': instance.options,
      'session': instance.session,
      'updatedAt': instance.updatedAt,
      'batch': instance.batch?.toJson(),
      'subject': instance.subject?.toJson(),
      'studentAttendanceDetails':
          instance.studentAttendanceDetails?.map((e) => e.toJson()).toList(),
    };

StudentAttendanceDetailModel _$StudentAttendanceDetailModelFromJson(
        Map<String, dynamic> json) =>
    StudentAttendanceDetailModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updatedAt'] as String?,
      studentRecord: json['studentRecord'] == null
          ? null
          : StudentRecordModel.fromJson(
              json['studentRecord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentAttendanceDetailModelToJson(
        StudentAttendanceDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'studentRecord': instance.studentRecord?.toJson(),
    };

StudentRecordModel _$StudentRecordModelFromJson(Map<String, dynamic> json) =>
    StudentRecordModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      dateOfEntry: json['dateOfEntry'] as String?,
      dateOfExit: json['dateOfExit'] as String?,
      entryRemarks: json['entryRemarks'] as String?,
      exitRemarks: json['exitRemarks'] as String?,
      isPromoted: json['isPromoted'] as int?,
      options: json['options'] as String?,
      rollNumber: json['rollNumber'] as String?,
      terminationReason: json['terminationReason'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
      batch: json['batch'] == null
          ? null
          : BatchModel.fromJson(json['batch'] as Map<String, dynamic>),
      student: json['student'] == null
          ? null
          : StudentModel.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentRecordModelToJson(StudentRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'dateOfEntry': instance.dateOfEntry,
      'dateOfExit': instance.dateOfExit,
      'entryRemarks': instance.entryRemarks,
      'exitRemarks': instance.exitRemarks,
      'isPromoted': instance.isPromoted,
      'options': instance.options,
      'rollNumber': instance.rollNumber,
      'terminationReason': instance.terminationReason,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'academicSession': instance.academicSession?.toJson(),
      'batch': instance.batch?.toJson(),
      'student': instance.student?.toJson(),
    };
