import 'dart:convert';

import 'package:flutter_auth_app/Models/Communication/notice_model.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:http/http.dart' as http;

class CommunicationService {
  final AuthService _authService = AuthService();

  Future<List<NoticeModel>> fetchAllNoticeForUser() async {
    List<NoticeModel> notices = <NoticeModel>[];
    try {
      UserStore store = await _authService.getUserData();

      List<NoticeModel> list = await fetchNoticeAsPerRole("ALL");
      if (list.isNotEmpty) {
        notices.addAll(list);
      }

      String role = store.roleName.toString();
      if (store.roleName != null) {
        print(store.roleName);
        String exactRole = role.substring("ROLE_".length);
        print(exactRole);
        List<NoticeModel> list2 = await fetchNoticeAsPerRole(exactRole);
        if (list2.isNotEmpty) {
          notices.addAll(list2);
        }

        notices.sort(
            (a, b) => b.createdAt.toString().compareTo(a.createdAt.toString()));
      }
      return notices;
    } catch (e) {
      notices = [];
      print(e.toString());
    }
    return notices;
  }

  Future<List<NoticeModel>> fetchNoticeAsPerRole(String roleName) async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();

      Uri uri = Uri.parse(MasterApi.getNoticeByRoleName + roleName);
      var res = await http.get(
        uri,
        headers: headers,
      );
      var decode = jsonDecode(res.body);
      List<NoticeModel> noticeModels = [];
      if (decode['data'] != null) {
        noticeModels = NoticeModel().parseJsonToList(decode['data']);
      }
      return noticeModels;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }
}
