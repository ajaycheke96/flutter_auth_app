import 'package:flutter/material.dart';
import 'package:flutter_auth_app/constants.dart';

class MasterApi{
  static const authorizationUrl='$baseUrl/rest/api/authenticate';

  // Image
  static const getImageFromServer='$baseUrl/sessionVideo/getImage/';

  // Academic
  static const getDefaultAcademicSession= '$baseUrl/academicSession/defaultAcademicSession';
  static const getAllAcademicSession='$baseUrl/academicSession/listAllAcademicSessions';

  // Student
  static const getStudentProfileRecordByUser= '$baseUrl/student/get-student-profile-record';
  static const getStudentByUser='$baseUrl/student/get-student-by-user';

  static const getStudentRecordByStudentAndAcademicSession= '$baseUrl/studentRecord/getStudentRecordByStudent';
  static const getParentProfileRecordByUser= '$baseUrl/studentParent/get-parent-profile-record';

  // Employee
  static const getEmployeeProfileRecordByUser= '$baseUrl/employee/get-employee-profile-record';

}