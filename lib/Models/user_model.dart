import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  int? id;
  String? username;
  String? password;
  String? email;
  List<RoleModel>? roles;
  String? createdAt;
  dynamic? enabled;
  String? rememberToken;
  String? status;
  String? updatedAt;
  String? uuid;
  String? activationToken;
  List<BackupModel>? backups;
  List<PostalRecordModel>? postalRecords;
  List<UploadModel>? uploads;
  List<UserPreferenceModel>? userPreferences;
  List<UserPushTokenModel>? userPushTokens;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.email,
    this.roles,
    this.createdAt,
    this.enabled,
    this.rememberToken,
    this.status,
    this.updatedAt,
    this.uuid,
    this.activationToken,
    this.backups,
    this.postalRecords,
    this.uploads,
    this.userPreferences,
    this.userPushTokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // static UserModel empty() {
  //   return UserModel(0, '', '', '', [], '', '0', '', '', '', '', '', [],[],[],[],[]);
  // }
}

@JsonSerializable()
class BackupModel {
  int? id;
  String? createdAt;
  String? file;
  String? options;
  String? updatedAt;

  BackupModel({
    this.id,
    this.createdAt,
    this.file,
    this.options,
    this.updatedAt,
  });
  factory BackupModel.fromJson(Map<String, dynamic> json) =>
      _$BackupModelFromJson(json);
  Map<String, dynamic> toJson() => _$BackupModelToJson(this);
}

@JsonSerializable()
class PostalRecordModel {
  int? id;
  String? createdAt;
  String? date;
  String? description;
  int? isConfidential;
  String? options;
  String? receiverAddress;
  String? receiverTitle;
  String? referenceNumber;
  String? senderAddress;
  String? senderTitle;
  String? type;
  String? updatedAt;
  String? uploadToken;
  String? uuid;

  PostalRecordModel({
    this.id,
    this.createdAt,
    this.date,
    this.description,
    this.isConfidential,
    this.options,
    this.receiverAddress,
    this.receiverTitle,
    this.referenceNumber,
    this.senderAddress,
    this.senderTitle,
    this.type,
    this.updatedAt,
    this.uploadToken,
    this.uuid,
  });

  factory PostalRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PostalRecordModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostalRecordModelToJson(this);
}

@JsonSerializable()
class UploadModel {
  int? id;
  String? createdAt;
  String? filename;
  int? isTempDelete;
  String? module;
  int? moduleId;
  String? options;
  int? status;
  String? updatedAt;
  String? uploadToken;
  String? userFilename;
  String? uuid;

  UploadModel({
    this.id,
    this.createdAt,
    this.filename,
    this.isTempDelete,
    this.module,
    this.moduleId,
    this.options,
    this.status,
    this.updatedAt,
    this.uploadToken,
    this.userFilename,
    this.uuid,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) =>
      _$UploadModelFromJson(json);
  Map<String, dynamic> toJson() => _$UploadModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserPreferenceModel {
  int? id;
  String? colorTheme;
  String? createdAt;
  String? direction;
  String? locale;
  String? options;
  String? sidebar;
  String? updatedAt;
  AcademicSessionModel? academicSession;

  UserPreferenceModel({
    this.id,
    this.colorTheme,
    this.createdAt,
    this.direction,
    this.locale,
    this.options,
    this.sidebar,
    this.updatedAt,
    this.academicSession,
  });

  factory UserPreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferenceModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserPreferenceModelToJson(this);
}

@JsonSerializable()
class UserPushTokenModel {
  int? id;
  String? createdAt;
  String? deviceName;
  String? options;
  String? token;
  String? updatedAt;

  UserPushTokenModel({
    this.id,
    this.createdAt,
    this.deviceName,
    this.options,
    this.token,
    this.updatedAt,
  });

  factory UserPushTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserPushTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserPushTokenModelToJson(this);
}

@JsonSerializable()
class RoleModel {
  int? id;
  String? name;
  String? createdAt;
  String? guardName;
  String? updatedAt;

  RoleModel({
    this.id,
    this.name,
    this.createdAt,
    this.guardName,
    this.updatedAt,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
