import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Models/employee_model.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/components/list_view.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_day_screen.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/constants.dart';

class StudentAttendanceListScreen extends StatefulWidget {
  static const String routeName = "/student-attendance-list";
  const StudentAttendanceListScreen({
    Key? key,
    // this.batchId, this.subjectId, this.month, this.year
  }) : super(key: key);

  final int changeCount = 1;
  //

  @override
  _StudentAttendanceListScreenState createState() =>
      _StudentAttendanceListScreenState();
}

class _StudentAttendanceListScreenState
    extends State<StudentAttendanceListScreen> {
  final StudentService _studentService = StudentService();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapParams =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.03),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Student Attendance List",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<StudentAttendanceModel>>(
          future: // _studentService.getAllStudentAttendance(),
              _studentService.getStudentAttendanceByMonthYearBatchANDSubject(
            mapParams['subjectId'],
            mapParams['batchId'],
            mapParams['month'],
            mapParams['year'],
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  Text('YOu have some error : ${snapshot.hasError.toString()}');
                } else if (snapshot.data != null) {
                  List<StudentAttendanceModel> list = snapshot.data!;
                  return SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Attendance')),
                        DataColumn(label: Text('Option')),
                      ],
                      rows: list
                          .map(
                            ((studentAttendanceModel) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        '${studentAttendanceModel.dateOfAttendance}',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ), //Extracting from Map element the value
                                    DataCell(Text(
                                        '${studentAttendanceModel.attendance}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black))),
                                    DataCell(
                                      IconButton(
                                        onPressed: () {
                                          print(
                                              '${studentAttendanceModel.dateOfAttendance} has pressed!');
                                          Navigator.of(context)
                                              .pushNamed(
                                                  StudentAttendanceDayScreen
                                                      .routeName,
                                                  arguments:
                                                      studentAttendanceModel
                                                          .toJson())
                                              .then((value) {
                                            if (value == true) {
                                              didUpdateWidget(this.widget);
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                          .toList(),
                    ),
                  );
                }
            }
            // return ListViewCustom(
            //   studentAttendanceModels: [],
            // );
            return Center(
              child: Text("No record Found"),
            );
          },
        ),
      ),
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

class AutocompleteBasicBatchExample extends StatelessWidget {
  const AutocompleteBasicBatchExample({Key? key}) : super(key: key);

  static List<BatchModel> _batchOptions = <BatchModel>[
    BatchModel(name: "1st Section", course: CourseModel(name: "Course 1")),
    BatchModel(name: "2nd Section", course: CourseModel(name: "Course 1")),
    BatchModel(name: "1st Section", course: CourseModel(name: "Course 2")),
    BatchModel(name: "2nd Section", course: CourseModel(name: "Course 2")),
  ];

  static String _displayStringForOption(BatchModel option) => option.name!;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<BatchModel>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<BatchModel>.empty();
        }
        return _batchOptions.where((BatchModel option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (BatchModel selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}

class AutocompleteBasicMonthExample extends StatelessWidget {
  const AutocompleteBasicMonthExample({Key? key}) : super(key: key);

  static List<String> _batchOptions = <String>[
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
  ];

  static String _displayStringForOption(String option) => option;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _batchOptions.where((String option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
      },
    );
  }
}
