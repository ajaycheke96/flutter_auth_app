import 'package:flutter/material.dart';
import 'package:flutter_auth_app/constants.dart';

class MasterApi{
  static const authorizationUrl='$baseUrl/rest/api/authenticate';

  // Image
  static const getImageFromServer='$baseUrl/sessionVideo/getImage/';

  // Academic
  static const getDefaultAcademicSession= '$baseUrl/academicSession/defaultAcademicSession';
  static const getAllAcademicSession='$baseUrl/academicSession/listAllAcademicSessions';

  static const getBatchesByTeacherUser='$baseUrl/batch/get-batch-by-teacher-user';
  static const getSubjectsByUser='$baseUrl/subject/getSubjectAsPerUser';
  static const getAllEventsAndTimetableRecords='$baseUrl/timetable/get-smart-event-timetable';

  // Student
  static const getStudentProfileRecordByUser= '$baseUrl/student/get-student-profile-record';
  static const getStudentByUser='$baseUrl/student/get-student-by-user';
  static const getStudentRecordByBatch='$baseUrl/studentRecord/get-student-record-by-batch';

  static const getStudentRecordByStudentAndAcademicSession= '$baseUrl/studentRecord/getStudentRecordByStudent';
  static const getParentProfileRecordByUser= '$baseUrl/studentParent/get-parent-profile-record';

  static const getStudentAttendenceByMonthYear= '$baseUrl/studentAttendance/getStudentAttendanceByMonth';
  static const getAllStudentAttendance= '$baseUrl/studentAttendance/listAllStudentAttendance';
  static const saveStudentAttendance= '$baseUrl/studentAttendance/saveStudentAttendance';

  static const getInvoiceReceiptsByUser='$baseUrl/invoice-cum-receipt/getInvoiceReceiptsByUser';

  // Employee
  static const getEmployeeProfileRecordByUser= '$baseUrl/employee/get-employee-profile-record';

  // Communications
  static const getNoticeByRoleName= '$baseUrl/notice/';
}