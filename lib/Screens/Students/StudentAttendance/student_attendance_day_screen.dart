import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/Utils/http_utils.dart';

class StudentAttendanceDayScreen extends StatefulWidget {
  static const String routeName = "/student-attendance-day";
  const StudentAttendanceDayScreen({Key? key}) : super(key: key);

  @override
  _StudentAttendanceDayScreenState createState() =>
      _StudentAttendanceDayScreenState();
}

class _StudentAttendanceDayScreenState
    extends State<StudentAttendanceDayScreen> {
  List<Widget> widgets = [];
  StudentAttendanceModel studentAttendanceModel = StudentAttendanceModel();

  _build(BuildContext context) {
    studentAttendanceModel = StudentAttendanceModel.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    // if (studentAttendanceModel.id == null) {
    _build(context);
    // }

    widgets = [
      _buildTitle("Edit Student Attendance Reocrds"),
      _buildInfoRow(
          'Course Name: ${studentAttendanceModel.batch!.course!.name}'),
      _buildInfoRow('Batch Name: ${studentAttendanceModel.batch!.name}'),
      _buildInfoRow(
          'Date of Attendance: ${studentAttendanceModel.dateOfAttendance}'),
      StudentAttendanceEditRecord(
        studentAttendanceModel: studentAttendanceModel,
      )
    ];

    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: widgets,
        ),
      ),
    );
  }

  Row _buildTitle(title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  _buildInfoRow(content) {
    return Row(
      children: [
        Text(
          content,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class StudentAttendanceEditRecord extends StatefulWidget {
  const StudentAttendanceEditRecord({Key? key, this.studentAttendanceModel})
      : super(key: key);
  final StudentAttendanceModel? studentAttendanceModel;

  @override
  _StudentAttendanceEditRecordState createState() =>
      _StudentAttendanceEditRecordState(studentAttendanceModel!);
}

class _StudentAttendanceEditRecordState
    extends State<StudentAttendanceEditRecord> {
  final StudentService _studentService = StudentService();
  bool isAllPresent = false;
  StudentAttendanceModel studentAttendanceModel;

  _StudentAttendanceEditRecordState(this.studentAttendanceModel);

  @override
  Widget build(BuildContext context) {
    _verifyPreRequirements();

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAllPresent = !isAllPresent;
                    for (int i = 0;
                        i <
                            studentAttendanceModel
                                .studentAttendanceDetails!.length;
                        i++) {
                      setState(() {
                        studentAttendanceModel.studentAttendanceDetails!
                            .elementAt(i)
                            .status = isAllPresent ? "PRESENT" : "ABSENT";
                      });
                      print(studentAttendanceModel.studentAttendanceDetails!
                          .elementAt(i)
                          .status);
                    }
                  });
                },
                child: Text(
                  isAllPresent ? "Mark All as Absent" : "Mark All as Present",
                  style: TextStyle(
                      color:
                          isAllPresent ? Colors.redAccent : Colors.greenAccent),
                ),
              )
            ],
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Student Name')),
              DataColumn(label: Text('Roll Number')),
              DataColumn(label: Text('Option')),
            ],
            rows: studentAttendanceModel
                .studentAttendanceDetails! // Loops through dataColumnText, each iteration assigning the value to element
                .map(
                  ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              '${element.studentRecord!.student!.firstName} ${element.studentRecord!.student!.middleName} ${element.studentRecord!.student!.lastName}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ), //Extracting from Map element the value
                          DataCell(Text(
                              element.studentRecord!.rollNumber != null
                                  ? element.studentRecord!.rollNumber.toString()
                                  : '--',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                          DataCell(
                            IconButton(
                              color: element.status != 'ABSENT'
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              onPressed: () {
                                print(element.status);
                                setState(
                                  () {
                                    element.status = element.status != 'ABSENT'
                                        ? 'ABSENT'
                                        : 'PRESENT';
                                  },
                                );
                              },
                              icon: Icon(element.status != 'ABSENT'
                                  ? Icons.check
                                  : Icons.close),
                            ),
                          ),
                        ],
                      )),
                )
                .toList(),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                studentAttendanceModel.studentAttendanceDetails!.forEach((e) =>
                    print(
                        '${e.studentRecord!.student!.firstName} ${e.status}'));
                _studentService
                    .saveStudentAttendance(studentAttendanceModel)
                    .then((value) => HttpUtils.showSuccess(context, value))
                    .onError((error, stackTrace) =>
                        HttpUtils.showError(context, error.toString()));
              },
              child: Text("Update Attendance"))
        ],
      ),
    );
  }

  _verifyPreRequirements() {
    setState(() {
      for (int i = 0;
          i < studentAttendanceModel.studentAttendanceDetails!.length;
          i++) {
        print("e.status");

        var status = studentAttendanceModel.studentAttendanceDetails!
            .elementAt(i)
            .status;
        print(status);
        studentAttendanceModel.studentAttendanceDetails!.elementAt(i).status =
            status != null
                ? (status != "ABSENT" ? "PRESENT" : "ABSENT")
                : "PRESENT";
        print(studentAttendanceModel.studentAttendanceDetails!
            .elementAt(i)
            .status);
      }
    });
  }
}
