import 'dart:convert';

import 'package:flutter_auth_app/Models/employee_model.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  final AuthService _authService = AuthService();

  Future<EmployeeProfileModel> getEmployeeProfileRecord() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore store = await _authService.getUserData();
      Map<String, int> user = {'id': store.userId!};

      Uri uri = Uri.parse(MasterApi.getEmployeeProfileRecordByUser);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(user),
      );
      var decode = jsonDecode(res.body);
      EmployeeProfileModel employeeProfileModel = EmployeeProfileModel();
      if (decode['data'] != null) {
        employeeProfileModel = EmployeeProfileModel.fromJson(decode['data']);
      }
      return employeeProfileModel;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }
}
