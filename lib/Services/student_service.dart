import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Services/academic_service.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:http/http.dart' as http;

class StudentService {
  final AuthService _authService = AuthService();
  final AcademicService academicService = AcademicService();

  Future<StudentModel> getStudentByUser() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore store = await _authService.getUserData();
      Map<String, int> user = {'id': store.userId!};

      Uri uri = Uri.parse(MasterApi.getStudentByUser);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(user),
      );
      print(res.body);
      var decode = jsonDecode(res.body);
      StudentModel student = StudentModel();
      if (decode['data'] != null) {
        student = StudentModel.fromJson(decode['data']);
      }
      return student;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    } finally {}
  }

  /**
   * For Image getting from server
   */
  Future getImageFromServer(String image) async {
    try {
      if (image.isNotEmpty) {
        String token = '';
        String tenantName = '';
        int userId;
        Map<String, int> user = Map();
        await _authService.getUserData().then((value) => {
              tenantName = value.tenantName.toString(),
              token = value.token.toString(),
              user = {'id': value.userId!}
            });

        List<String> fileArr = image.split('.');
        var filename = fileArr[0];
        var fileType = fileArr[1];

        Map<String, String> headerMap = {
          HttpHeaders.contentTypeHeader: 'image/*',
          HttpHeaders.authorizationHeader: token,
          "X-Tenant": tenantName
        };
        // headerMap.remove(HttpHeaders.acceptHeader);
        // headerMap
        //     .addEntries([const MapEntry(HttpHeaders.acceptHeader, 'blob')]);

        print(headerMap);

        Uri uri =
            Uri.parse(MasterApi.getImageFromServer + fileType + "/" + filename);

        var res = await http.get(
          uri,
          headers: headerMap,
        );
        print(res.headers);
        return res;
      }
    } catch (e, s) {
      print(e);
      print(s);
      throw new Exception(e);
    }

    // transform(url: string) {
    //     if(url){
    //         return new Observable<string>(observer => {
    //             const token = this.data.user.token; //this line gets the jwt token

    //             const headers=new HttpHeaders({ "X-Tenant": this.data.user.tenantId, "Authorization": `Bearer ${this.data.user.token}`})

    //             const { next, error } = observer;

    //             const fileData: String[]=url.split(".");
    //             const filename=fileData[0];
    //             const fileType=fileData[1];

    //             console.log(filename);

    //             return this.http.get(tenantUserApiUrl.getImage+fileType+"/"+filename, { headers, responseType: 'blob' }).subscribe(response => {
    //                 const reader = new FileReader();
    //                 const result=reader;
    //                 console.log(response);

    //                 reader.readAsDataURL(response);
    //                 console.log(result);
    //                 reader.onloadend = function() {
    //                     observer.next(reader.result as string);
    //                 };
    //             });
    //         });
    //     }
    // }
  }

  // Future getStudentRecordByStudent(StudentModel studentModel) async {
  //   AcademicSessionModel academicSessionModel = AcademicSessionModel();
  //   var studentRecord;
  //   await academicService.getDefaultAcademicSession().then((value) {
  //     // print("Academic Session" + value.id.toString());
  //     academicSessionModel = value;
  //     // print(academicSessionModel);
  //   });
  //   await getStudentRecordByStudentAndAcademicSession(
  //           studentModel, academicSessionModel)
  //       .then((value2) {
  //     // print(value2);
  //     // return value2;
  //     studentRecord = value2;
  //   });
  //   return studentRecord;
  // }

  Future<StudentProfile> getStudentProfileRecord() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore store = await _authService.getUserData();
      print(store);
      Map<String, int> user = {'id': store.userId!};

      Uri uri = Uri.parse(MasterApi.getStudentProfileRecordByUser);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(user),
      );
      var decode = jsonDecode(res.body);
      StudentProfile studentProfile = StudentProfile();
      if (decode['data'] != null) {
        studentProfile = StudentProfile.fromJson(decode['data']);
      }
      return studentProfile;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }

  // Future getStudentRecordByStudentAndAcademicSession(StudentModel studentModel,
  //     AcademicSessionModel academicSessionModel) async {
  //   UserStore store = await _authService.getUserData();
  //   print(store);
  //   Map<String, String> headers = {
  //     HttpHeaders.contentTypeHeader: 'application/json',
  //     HttpHeaders.acceptHeader: 'application/json',
  //     HttpHeaders.authorizationHeader: store.token.toString(),
  //     "X-Tenant": store.tenantName.toString()
  //   };

  //   final payload = jsonEncode({
  //     "academicSession": {"id": academicSessionModel.id},
  //     "student": {"id": studentModel.id}
  //   });

  //   var response = await http.post(
  //     Uri.parse(MasterApi.getStudentRecordByStudentAndAcademicSession),
  //     body: payload,
  //     headers: headers,
  //   );

  //   if (response.body != null) {
  //     return jsonDecode(response.body)['data'];
  //   }
  // }

  Future<ParentProfileModel> getStudentParentProfileRecord() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();
      UserStore store = await _authService.getUserData();
      print(store);
      Map<String, int> user = {'id': store.userId!};

      Uri uri = Uri.parse(MasterApi.getParentProfileRecordByUser);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(user),
      );
      print(res.body);
      var decode = jsonDecode(res.body);
      ParentProfileModel parentProfileModel = ParentProfileModel();
      if (decode['data'] != null) {
        parentProfileModel = ParentProfileModel.fromJson(decode['data']);
      }
      return parentProfileModel;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }

  Future<List<StudentAttendanceModel>>
      getStudentAttendanceByMonthYearBatchANDSubject(
          int subjectId, int batchId, String month, int year) async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();

      var payload = {
        'subjectId': subjectId,
        'batchId': batchId,
        'month': month,
        'year': year
      };

      Uri uri = Uri.parse(MasterApi.getStudentAttendenceByMonthYear);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(payload),
      );
      // print(res.body);
      var decode = jsonDecode(res.body);
      List<StudentAttendanceModel> studentAttendanceList = [];
      if (decode['data'] != null) {
        studentAttendanceList =
            StudentAttendanceModel.parseJsonToList(decode['data']);
      }
      return studentAttendanceList;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }

  Future<List<StudentRecordModel>> getStudentRecordsByBatch(int batchId) async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();

      var payload = {'batchId': batchId};

      Uri uri = Uri.parse(MasterApi.getStudentRecordByBatch);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(payload),
      );
      // print(res.body);
      var decode = jsonDecode(res.body);
      List<StudentRecordModel> studentList = [];
      if (decode['data'] != null) {
        studentList = StudentRecordModel.parseJsonToList(decode['data']);
      }
      return studentList;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }

  Future<List<StudentAttendanceModel>> getAllStudentAttendance() async {
    try {
      Map<String, String> headers = await _authService.buildHeaders();

      Uri uri = Uri.parse(MasterApi.getAllStudentAttendance);
      print(uri);
      var res = await http.get(
        uri,
        headers: headers,
      );
      // print(res.body);
      var decode = jsonDecode(res.body);
      List<StudentAttendanceModel> studentAttendanceList = [];
      if (decode['data'] != null) {
        studentAttendanceList =
            StudentAttendanceModel.parseJsonToList(decode['data']);
      }
      return studentAttendanceList;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }

  Future saveStudentAttendance(StudentAttendanceModel studentAttendanceModel) async{
    try {
      Map<String, String> headers = await _authService.buildHeaders();

      Uri uri = Uri.parse(MasterApi.saveStudentAttendance);
      print(uri);
      var res = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(studentAttendanceModel.toJson()),
      );
      // print(res.body);
      var decode = jsonDecode(res.body);
      String message= '';
      if (decode['data'] != null) {
        if(decode['status']==200){
          message=decode['message'];
        }
      }
      return message;
    } catch (e, s) {
      print(s);
      throw new Exception(e);
    }
  }
}
