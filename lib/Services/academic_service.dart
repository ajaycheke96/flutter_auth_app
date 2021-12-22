import 'dart:convert';

import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:http/http.dart' as http;

class AcademicService {
  final AuthService _authService = AuthService();

  Future<AcademicSessionModel> getDefaultAcademicSession() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      var res = await http.get(
        Uri.parse(MasterApi.getDefaultAcademicSession),
        headers: headers,
      );
      var decode = jsonDecode(res.body);
      return AcademicSessionModel.fromJson(decode['data']);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }
}
