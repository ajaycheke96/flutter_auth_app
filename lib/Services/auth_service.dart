import 'dart:convert';
import 'dart:html';
import 'dart:io';

// import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // ignore: non_constant_identifier_names
  // static final SESSION = FlutterSession();

  // Future<dynamic> register(String email, String password) async {
  //   List<String> arr=email.split("@");
  //   String username=arr.first;
  //   String tenantName=arr.elementAt(1).split(".").first;
  //   try {
  //     Uri uri= Uri(host: '$baseUrl', port: 4000,path: '/auth/register');
  //     var res = await http.post(uri, body: {
  //       'email': email,
  //       'password': password,
  //     },
  //     headers: {
  //       'X-Tenant':
  //     });

  //     return res?.body;
  //   } finally {
  //     // done you can do something here
  //   }
  // }
  Future checkService() async {
    String token = '';
    String tenantName = '';
    await getUserData().then((value) => {
          tenantName = value.tenantName.toString(),
          token = value.token.toString(),
        });

    final response = await http.get(Uri.parse(MasterApi.getAllAcademicSession),
        headers: {
          "X-Tenant": tenantName.toString(),
          HttpHeaders.authorizationHeader: token
        });
    print(response.body);
    var decode = jsonDecode(response.body);
    if (decode['status'] == 200) {
      return true;
    }
    return false;
  }

  setAuthToken(String token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('auth_token', token);
  }

  setUserData(int userId, String username, int roleId, String roleName,
      String tenantName) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt('userId', userId);
    prefs.setString('username', username);
    prefs.setInt('roleId', roleId);
    prefs.setString('roleName', roleName);
    prefs.setString("tenant_name", tenantName);
  }

  Future<UserStore> getUserData() async {
    SharedPreferences prefs = await _prefs;
    return UserStore(
        prefs.getInt('userId'),
        prefs.getString('username'),
        prefs.getInt('roleId'),
        prefs.getString('roleName'),
        prefs.getString('auth_token'),
        prefs.getString('tenant_name'));
  }

  getAuthToken() async {
    SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('auth_token');
    print('getting $token token.');
    // await prefs.setInt('counter', token);
    return token;
  }

  removeAllLoginRecords() async {
    SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  Future<dynamic> login(String email, String password) async {
    try {
      String username, tenantName;
      if (email.contains("@") && email.contains(".")) {
        List<String> arr = email.split("@");
        username = arr.first;
        tenantName = arr.elementAt(1).split(".").first;

        LoginReq loginReq = LoginReq(username, password);

        Uri uri = Uri.parse(MasterApi.authorizationUrl);
        var res = await http.post(uri, body: json.encode(loginReq), headers: {
          "X-Tenant": tenantName,
          "Content-Type": "application/json; charset=UTF-8",
        });
        if (json.decode(res.body)['status'] == 200) {
          dynamic data = json.decode(res.body)['data'];
          String token = "Bearer " + data['authToken'];
          dynamic userData = data['user'];
          print(token);
          setAuthToken(token);
          setUserData(
              userData['id'],
              userData['username'],
              userData['roles']?[0]?['id'],
              userData['roles']?[0]?['name'],
              tenantName);
        }else{
          throw new Exception("Failed to load data!");
        }
        return getUserData();
      }
    } finally {
      // you can do somethig here
    }
  }

  // static setToken(String token, String refreshToken) async {
  //   _AuthData data = _AuthData(token, refreshToken);
  //   await SESSION.set('tokens', data);
  // }

  // static Future<Map<String, dynamic>> getToken() async {
  //   return await SESSION.get('tokens');
  // }

  // static removeToken() async {
  //   await SESSION.prefs.clear();
  // }
}

class _AuthData {
  String token, refreshToken;
  _AuthData(this.token, this.refreshToken);

  // toJson
  // required by Session lib
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    // data['clientId'] = clientId;
    return data;
  }
}

class LoginReq {
  String username, password;
  LoginReq(this.username, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

class UserStore {
  final int? userId;
  final String? username;
  final int? roleId;
  final String? roleName;
  final String? token;
  final String? tenantName;

  UserStore(this.userId, this.username, this.roleId, this.roleName, this.token,
      this.tenantName);
}
