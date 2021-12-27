import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_day_screen.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({Key? key, this.studentAttendanceModels})
      : super(key: key);
  final List<StudentAttendanceModel>? studentAttendanceModels;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Attendance')),
        DataColumn(label: Text('Option')),
      ],
      rows:
          studentAttendanceModels! // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((studentAttendanceModel) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            '${studentAttendanceModel.dateOfAttendance}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ), //Extracting from Map element the value
                        DataCell(Text('${studentAttendanceModel.attendance}',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black))),
                        DataCell(
                          IconButton(
                            onPressed: () {
                              print(
                                  '${studentAttendanceModel.dateOfAttendance} has pressed!');
                              Navigator.of(context).pushNamed(
                                  StudentAttendanceDayScreen.routeName,
                                  arguments: studentAttendanceModel.toJson());
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ],
                    )),
              )
              .toList(),
    );
  }
}