import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_day_screen.dart';
import 'package:flutter_auth_app/Services/student_service.dart';

class StudentAttendanceListScreen extends StatefulWidget {
  static const String routeName = "/student-attendance-list";
  const StudentAttendanceListScreen({Key? key}) : super(key: key);

  @override
  _StudentAttendanceListScreenState createState() =>
      _StudentAttendanceListScreenState();
}

class _StudentAttendanceListScreenState
    extends State<StudentAttendanceListScreen> {
  final StudentService _studentService = StudentService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudentAttendanceModel>>(
      future: _studentService.getStudentAttendanceByMonthYearBatchANDSubject(
          1, 1, "JUNE", 2021),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<StudentAttendanceModel> list = snapshot.data!;
          print(list);
          List<TableRow> rows = [];

          TableRow header = _buildTableHeader();
          rows.add(header);

          List<TableRow> contentRows = _buildTableBody(list);
          rows.addAll(contentRows);

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Table(
                  children: rows,
                ),
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
        decoration: BoxDecoration(color: Colors.blueAccent),
        children: [
          _buildTableHeaderCell("Date"),
          _buildTableHeaderCell("Attendance"),
          _buildTableHeaderCell("Options"),
        ]);
  }

  TableCell _buildTableHeaderCell(title) {
    return TableCell(
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  List<TableRow> _buildTableBody(List<StudentAttendanceModel> list) {
    List<TableRow> rows = [];
    list.forEach((element) {
      // if (element.isDefault == "YES") {
      TableRow row = TableRow(children: [
        _buildTableContentCell(element.dateOfAttendance),
        _buildTableContentCell(element.attendance),
        TableCell(
            child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            print('${element.dateOfAttendance} has pressed!');
            Navigator.of(context).pushNamed(
                StudentAttendanceDayScreen.routeName,
                arguments: element.toJson());
          },
        ))
      ]);
      rows.add(row);
    }
        // }
        );
    return rows;
  }

  TableCell _buildTableContentCell(title) {
    return TableCell(
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
  // _filterStudentAttendances(String value) {
  //   setState(() {
  //     if (value != '') {
  //       filteredStudentAttendanceList = studentAttendanceList
  //           .where((attendance) => attendance.dateOfAttendance
  //               .toString()
  //               .toLowerCase()
  //               .contains(value.toLowerCase()))
  //           .toList();
  //     } else {
  //       filteredStudentAttendanceList = studentAttendanceList;
  //     }
  //   });
  // }
}
