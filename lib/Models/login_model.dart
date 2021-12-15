import 'dart:convert';

import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Models/user_model.dart';

class LoginResponseModel {
  String authToken;
  UserModel user;
  AcademicSessionModel academicSession;

  LoginResponseModel(
    this.authToken,
    this.user,
    this.academicSession,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "authToken": this.authToken.trim(),
      "user": jsonEncode(user),
      "academicSession": jsonEncode(academicSession),
    };

    return map;
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel(
    this.username,
    this.password,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "username": username.trim(),
      "password": password.trim()
    };

    return map;
  }
}
