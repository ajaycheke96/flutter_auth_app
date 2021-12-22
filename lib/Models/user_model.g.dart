// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      enabled: json['enabled'],
      rememberToken: json['rememberToken'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uuid: json['uuid'] as String?,
      activationToken: json['activationToken'] as String?,
      backups: (json['backups'] as List<dynamic>?)
          ?.map((e) => BackupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      postalRecords: (json['postalRecords'] as List<dynamic>?)
          ?.map((e) => PostalRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploads: (json['uploads'] as List<dynamic>?)
          ?.map((e) => UploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userPreferences: (json['userPreferences'] as List<dynamic>?)
          ?.map((e) => UserPreferenceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userPushTokens: (json['userPushTokens'] as List<dynamic>?)
          ?.map((e) => UserPushTokenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
      'enabled': instance.enabled,
      'rememberToken': instance.rememberToken,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'uuid': instance.uuid,
      'activationToken': instance.activationToken,
      'backups': instance.backups?.map((e) => e.toJson()).toList(),
      'postalRecords': instance.postalRecords?.map((e) => e.toJson()).toList(),
      'uploads': instance.uploads?.map((e) => e.toJson()).toList(),
      'userPreferences':
          instance.userPreferences?.map((e) => e.toJson()).toList(),
      'userPushTokens':
          instance.userPushTokens?.map((e) => e.toJson()).toList(),
    };

BackupModel _$BackupModelFromJson(Map<String, dynamic> json) => BackupModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      file: json['file'] as String?,
      options: json['options'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BackupModelToJson(BackupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'file': instance.file,
      'options': instance.options,
      'updatedAt': instance.updatedAt,
    };

PostalRecordModel _$PostalRecordModelFromJson(Map<String, dynamic> json) =>
    PostalRecordModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      isConfidential: json['isConfidential'] as int?,
      options: json['options'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      receiverTitle: json['receiverTitle'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      senderAddress: json['senderAddress'] as String?,
      senderTitle: json['senderTitle'] as String?,
      type: json['type'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$PostalRecordModelToJson(PostalRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'date': instance.date,
      'description': instance.description,
      'isConfidential': instance.isConfidential,
      'options': instance.options,
      'receiverAddress': instance.receiverAddress,
      'receiverTitle': instance.receiverTitle,
      'referenceNumber': instance.referenceNumber,
      'senderAddress': instance.senderAddress,
      'senderTitle': instance.senderTitle,
      'type': instance.type,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'uuid': instance.uuid,
    };

UploadModel _$UploadModelFromJson(Map<String, dynamic> json) => UploadModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      filename: json['filename'] as String?,
      isTempDelete: json['isTempDelete'] as int?,
      module: json['module'] as String?,
      moduleId: json['moduleId'] as int?,
      options: json['options'] as String?,
      status: json['status'] as int?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      userFilename: json['userFilename'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$UploadModelToJson(UploadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'filename': instance.filename,
      'isTempDelete': instance.isTempDelete,
      'module': instance.module,
      'moduleId': instance.moduleId,
      'options': instance.options,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'userFilename': instance.userFilename,
      'uuid': instance.uuid,
    };

UserPreferenceModel _$UserPreferenceModelFromJson(Map<String, dynamic> json) =>
    UserPreferenceModel(
      id: json['id'] as int?,
      colorTheme: json['colorTheme'] as String?,
      createdAt: json['createdAt'] as String?,
      direction: json['direction'] as String?,
      locale: json['locale'] as String?,
      options: json['options'] as String?,
      sidebar: json['sidebar'] as String?,
      updatedAt: json['updatedAt'] as String?,
      academicSession: json['academicSession'] == null
          ? null
          : AcademicSessionModel.fromJson(
              json['academicSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPreferenceModelToJson(
        UserPreferenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colorTheme': instance.colorTheme,
      'createdAt': instance.createdAt,
      'direction': instance.direction,
      'locale': instance.locale,
      'options': instance.options,
      'sidebar': instance.sidebar,
      'updatedAt': instance.updatedAt,
      'academicSession': instance.academicSession?.toJson(),
    };

UserPushTokenModel _$UserPushTokenModelFromJson(Map<String, dynamic> json) =>
    UserPushTokenModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      deviceName: json['deviceName'] as String?,
      options: json['options'] as String?,
      token: json['token'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserPushTokenModelToJson(UserPushTokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deviceName': instance.deviceName,
      'options': instance.options,
      'token': instance.token,
      'updatedAt': instance.updatedAt,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      guardName: json['guardName'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'guardName': instance.guardName,
      'updatedAt': instance.updatedAt,
    };
