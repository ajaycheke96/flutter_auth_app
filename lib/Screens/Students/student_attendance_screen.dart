import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/Shared/master_api.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:http/http.dart' as http;

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({Key? key}) : super(key: key);

  @override
  _StudentAttendanceScreenState createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  final StudentService _studentService = StudentService();

  int subjectId = 1;
  int batchId = 1;
  int year = 2021;
  String month = "JUNE";
  List<StudentAttendanceModel> studentAttendanceList = [];
  List<StudentRecordModel> studentRecordModelList = [];

  @override
  void initState() async {
    super.initState();
    studentAttendanceList =
        await _studentService.getStudentAttendanceByMonthYearBatchANDSubject(
            subjectId, batchId, month, year);
    studentRecordModelList =
        await _studentService.getStudentRecordsByBatch(batchId);
  }

  @override
  Widget build(BuildContext context) {
    List<TableRow> rows = [];
    rows.add(_buildTableHeader(studentAttendanceList));
    rows.addAll(_buildTableRows(studentAttendanceList));
    return Container(
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: rows,
      ),
    );
  }

  List<TableRow> _buildTableRows(
      List<StudentAttendanceModel> studentAttendanceList) {
    List<TableRow> rows = [];

    for (int stu = 0; stu < studentRecordModelList.length; stu++) {
      StudentRecordModel recordModel = studentRecordModelList.elementAt(stu);
      List<TableCell> columns = [];
      columns.add(TableCell(
        child: Text(recordModel.student!.firstName.toString()),
      ));

      for (int i = 0; i < studentAttendanceList.length; i++) {
        StudentAttendanceModel attendance = studentAttendanceList.elementAt(i);
        if (attendance.isDefault == 'YES') {
          columns.add(const TableCell(
            child: Text("X"),
          ));
        } else {
          for (int j = 0;
              j < attendance.studentAttendanceDetails!.length;
              j++) {
            StudentAttendanceDetailModel detail1 =
                attendance.studentAttendanceDetails!.elementAt(j);
            if (detail1.studentRecord!.id == recordModel.id) {
              if (detail1.status == 'PRESENT') {
                columns.add(const TableCell(
                  child: Text("P"),
                ));
              } else if (detail1.status == 'ABSENT') {
                columns.add(const TableCell(
                  child: Text("A"),
                ));
              } else {
                columns.add(const TableCell(
                  child: Text("--"),
                ));
              }
            }
          }
        }
      }
      print(columns);
      // rows.add(TableRow(children: columns));
    }

    return rows;
  }

  TableRow _buildTableHeader(studentAttendanceList) {
    List<TableCell> headerCells = [];
    headerCells.add(TableCell(child: Text("")));
    studentAttendanceList.forEach((element) {
      headerCells.add(TableCell(child: Text('${element.dateOfAttendance}')));
    });
    return TableRow(children: headerCells);
  }
  // @override
  // Widget build(BuildContext context) {
//     var _currentDate = DateTime.now();
//     var _markedDateMap;
//     final double statusBarHeight = MediaQuery.of(context).padding.top;

//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//       statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
//     ));

//     return Padding(
//       padding: EdgeInsets.only(top: statusBarHeight),
//       child: Column(
//         children: <Widget>[
//           Expanded(
//             child: CalendarCarousel<Event>(
//               // height: MediaQuery.of(context).size.height * 0.5,
//               weekDayPadding: EdgeInsets.zero,
//               onDayPressed: (DateTime date, List<Event> events) {
//                 this.setState(() => _currentDate = date);
//               },
//               onCalendarChanged: (DateTime date) {
//                 setState(() {
//                   attendances =
//                       getAllStudentAttendance(id, date.month, date.year, token);
//                 });
//               },
//               weekendTextStyle: Theme.of(context).textTheme.headline6,
//               thisMonthDayBorderColor: Colors.grey,
//               daysTextStyle: Theme.of(context).textTheme.headline4,
//               showOnlyCurrentMonthDate: false,
//               headerTextStyle: Theme.of(context).textTheme.headline6,
//               weekdayTextStyle: Theme.of(context).textTheme.headline4,
//               customDayBuilder: (
//                 /// you can provide your own build function to make custom day containers
//                 bool isSelectable,
//                 int index,
//                 bool isSelectedDay,
//                 bool isToday,
//                 bool isPrevMonthDay,
//                 TextStyle textStyle,
//                 bool isNextMonthDay,
//                 bool isThisMonthDay,
//                 DateTime day,
//               ) {
//                 return FutureBuilder<StudentAttendanceList>(
//                   future: attendances,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       //Utils.showToast(getAttendanceStatus(day.day, snapshot.data.attendances));

//                       String status = getAttendanceStatus(
//                           day.day, snapshot.data!.attendances);

//                       // print('DAY : ${day.day} STATUS : $status');
//                       // print('STATUS : $status');
//                       if (isThisMonthDay) {
//                         if (isToday) {
//                           return Center(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 2,
//                                       blurRadius: 5,
//                                       offset: Offset(0, 3),
//                                     ),
//                                   ]),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     day.day.toString(),
//                                     style:
//                                         Theme.of(context).textTheme.headline4,
//                                   ),
//                                   SizedBox(
//                                     width: 1.5,
//                                   ),
//                                   Container(
//                                     width: 8.0,
//                                     height: 8.0,
//                                     decoration: BoxDecoration(
//                                       color: getStatusColor(status),
//                                       borderRadius: BorderRadius.circular(5.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Center(
//                             child: Container(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     day.day.toString(),
//                                     style:
//                                         Theme.of(context).textTheme.headline4,
//                                   ),
//                                   SizedBox(
//                                     width: 1.5,
//                                   ),
//                                   Container(
//                                     width: 8.0,
//                                     height: 8.0,
//                                     decoration: BoxDecoration(
//                                       color: getStatusColor(status),
//                                       borderRadius: BorderRadius.circular(5.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }
//                       } else {
//                         return Center(
//                           child: Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   day.day.toString(),
//                                   style: Theme.of(context).textTheme.headline4,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }
//                     } else {
//                       return Center(
//                         child: Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Text(
//                                 day.day.toString(),
//                                 style: Theme.of(context).textTheme.headline4,
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 );
//               },
//               weekFormat: false,
//               markedDatesMap: _markedDateMap,
//               selectedDateTime: _currentDate,
//               // daysHaveCircularBorder: true,
//               todayButtonColor: Colors.transparent,
//               todayBorderColor: Colors.transparent,
//               todayTextStyle: Theme.of(context).textTheme.headline4,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//             child: Column(
//               // physics: NeverScrollableScrollPhysics(),
//               children: <Widget>[
//                 bottomDesign('Present', 'P', Colors.green),
//                 bottomDesign('Absent', 'A', Colors.red),
//                 bottomDesign('Late', 'L', Color(0xFFEDD200)),
//                 bottomDesign('Halfday', 'H', Colors.purpleAccent),
//                 bottomDesign('Holiday', 'F', Colors.deepPurpleAccent),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget bottomDesign(String title, String titleVal, Color color) {
//     return FutureBuilder<StudentAttendanceList>(
//         future: attendances,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Center(
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 5.0),
//                     height: 20.0,
//                     width: 50.0,
//                     decoration: BoxDecoration(
//                       color: color,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: Theme.of(context).textTheme.headline5,
//                     ),
//                   ),
//                   Text(getStatusCount(titleVal, snapshot.data!.attendances),
//                       style: Theme.of(context).textTheme.headline5),
//                 ],
//               ),
//             );
//           } else {
//             return Container();
//           }
//         });
//   }

//   Future<StudentAttendanceList> getAllStudentAttendance(
//       var id, int month, int year, String token) async {
//         Map<String, String> headers= await AuthService().buildHeaders();
//         var payload={
//           'id': id,
//           'month': month,
//           'year': year
//         };
//     final response = await http.post(
//         Uri.parse(MasterApi.getStudentAttendence),
//         body: jsonEncode(payload),
//         headers: headers);

//     debugPrint(MasterApi.getStudentAttendence);
//     print(response.statusCode);

//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);

//       print("JSON: $jsonData");

//       return StudentAttendanceList.fromJson(jsonData['data']['attendances']);
//     } else {
//       throw Exception('Failed to load');
//     }

//   }

//   String getAttendanceStatus(int date, List<StudentAttendance> attendances) {
//     // print("ATTENTDENCE LEN : ${attendances.length}");
//     return getStatus(0, attendances.length - 1, attendances, date);
//   }

//   String getStatus(
//       int i, int j, List<StudentAttendance> attendances, int date) {
//     String? status;
//     for (int a = i; a <= j; a++) {
//       if (int.parse(AppFunction.getDay(attendances[a].date.toString())) == date) {
//         status = attendances[a].type.toString();
//         // print(AppFunction.getDay(attendances[a].date).substring(1));
//         // print(date.toString());
//         // break;
//       }
//     }
//     return status.toString();
//   }

//   getStatusColor(String status) {
//     switch (status) {
//       case 'P':
//         return Colors.green;
//         break;
//       case 'A':
//         return Colors.red;
//         break;
//       case 'L':
//         return Color(0xFFEDD200);
//         break;
//       case 'H':
//         return Colors.purpleAccent;
//         break;
//       case 'F':
//         return Colors.deepPurple;
//         break;
//       default:
//         return Colors.transparent;
//         break;
//     }
//   }

//   String getStatusCount(String titleVal, List<StudentAttendance> attendances) {
//     int count = 0;
//     for (int i = 0; i < attendances.length; i++) {
//       if (attendances[i].type == titleVal) {
//         count = count + 1;
//       }
//     }
//     //debugPrint('count $count');
//     return '$count days';
//   }
// }

// class StudentAttendance {
//   String? type;
//   String? date;

//   StudentAttendance({this.type, this.date});

//   factory StudentAttendance.fromJson(Map<String, dynamic> json) {
//     return StudentAttendance(
//       type: json['attendance_type'],
//       date: json['attendance_date'],
//     );
//   }
// }

// class StudentAttendanceList {
//   List<StudentAttendance> attendances;

//   StudentAttendanceList(this.attendances);

//   factory StudentAttendanceList.fromJson(List<dynamic> json) {
//     List<StudentAttendance> studentAttendanceList = [];

//     studentAttendanceList =
//         json.map((i) => StudentAttendance.fromJson(i)).toList();

//     return StudentAttendanceList(studentAttendanceList);
//   }
// }

// class AppFunction{
//   static String getDay(String date) {
//     var parts = date.split("-");
//     return parts[parts.length - 1];
//   }
}
