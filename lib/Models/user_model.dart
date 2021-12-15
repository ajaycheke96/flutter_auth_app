import 'package:flutter_auth_app/Models/academic_model.dart';

class UserModel {
  final int id;
  final String username;
  final String password;
  final String email;
  final List<RoleModel> roles;
  final String createdAt;
  final int enabled;
  final String rememberToken;
  final String status;
  final String updatedAt;
  final String uuid;
  final String activationToken;
  // backups: BackupElement[];
  // postalRecords: PostalRecordElement[];
  // uploads: UploadElement[];
  final List<UserPreferenceModel> userPreferences;
  // userPushTokens: UserPushTokenElement[];

  UserModel(
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
      this.userPreferences);
}

// class BackupModel {
//     id: number;
//     String createdAt;
//     String file;
//     String options;
//     String updatedAt;
// }

// class PostalRecordElement {
//     id: number;
//     String createdAt;
//     String date;
//     String description;
//     isConfidential: number;
//     String options;
//     String receiverAddress;
//     String receiverTitle;
//     String referenceNumber;
//     String senderAddress;
//     String senderTitle;
//     String type;
//     String updatedAt;
//     String uploadToken;
//     String uuid;
// }

// class UploadElement {
//     id: number;
//     String createdAt;
//     String filename;
//     isTempDelete: number;
//     String module;
//     moduleId: number;
//     String options;
//     status: number;
//     String updatedAt;
//     String uploadToken;
//     String userFilename;
//     String uuid;
// }

class UserPreferenceModel {
  final int id;
  final String colorTheme;
  final String createdAt;
  final String direction;
  final String locale;
  final String options;
  final String sidebar;
  final String updatedAt;
  final AcademicSessionModel academicSession;

  UserPreferenceModel(
    this.id,
    this.colorTheme,
    this.createdAt,
    this.direction,
    this.locale,
    this.options,
    this.sidebar,
    this.updatedAt,
    this.academicSession,
  );
}

// class UserPushTokenElement {
//     int id;
//     String createdAt;
//     String deviceName;
//     String options;
//     String token;
//     String updatedAt;
// }

class RoleModel {
  final int id;
  final String name;
  final String createdAt;
  final String guardName;
  final String updatedAt;

  RoleModel(
    this.id,
    this.name,
    this.createdAt,
    this.guardName,
    this.updatedAt,
  );
}
