import 'dart:convert';

import 'package:flutter_auth_app/Models/Timetable/meeting_model.dart';
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

  Future<List<BatchModel>> getBatchesByTeacherUser() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore userStore = await _authService.getUserData();
      var payload = {"id": userStore.userId};
      var res = await http.post(
        Uri.parse(MasterApi.getBatchesByTeacherUser),
        headers: headers,
        body: jsonEncode(payload),
      );
      var decode = jsonDecode(res.body);
      print(decode);
      return BatchModel().parseJsonToList(decode['data']);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }

  Future<List<SubjectModel>> getSubjectByUser() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore userStore = await _authService.getUserData();
      var payload = {"id": userStore.userId};
      var res = await http.post(
        Uri.parse(MasterApi.getSubjectsByUser),
        headers: headers,
        body: jsonEncode(payload),
      );
      var decode = jsonDecode(res.body);
      print(decode['data']);
      return SubjectModel().parseJsonToList(decode['data']);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }

  Future<List<MeetingModel>> getAllEventsByUser() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore userStore = await _authService.getUserData();
      var payload = {"id": userStore.userId};
      var res = await http.post(
        Uri.parse(MasterApi.getAllEventsAndTimetableRecords),
        headers: headers,
        body: jsonEncode(payload),
      );
      var decode = jsonDecode(res.body);
      print("decode['data']");
      print(decode['data']);
      return MeetingModel().parseJsonToList(decode['data']);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }
}
