import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_list_screen.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/Utils/http_utils.dart';
import 'package:flutter_auth_app/constants.dart';

class StudentAttendanceDayScreen extends StatelessWidget {
  static const routeName = "/student-attendance-by-day";
  List<Widget> widgets = [];
  StudentAttendanceModel studentAttendanceModel = StudentAttendanceModel();

  StudentAttendanceDayScreen({Key? key}) : super(key: key);

  // _build(BuildContext context) {
  //   studentAttendanceModel = StudentAttendanceModel.fromJson(
  //       ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
  // }

  @override
  Widget build(BuildContext context) {
    // // if (studentAttendanceModel.id == null) {
    // _build(context);
    // // }
    studentAttendanceModel = StudentAttendanceModel.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);

    widgets = [
      _buildInfoRow(
          'Course Name: ${studentAttendanceModel.batch!.course!.name}'),
      _buildInfoRow('Batch Name: ${studentAttendanceModel.batch!.name}'),
      _buildInfoRow(
          'Date of Attendance: ${studentAttendanceModel.dateOfAttendance}'),
      StudentAttendanceEditRecord(
        studentAttendanceModel: studentAttendanceModel,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: _buildTitle("Edit Student Attendance Reocrds"),
      ),
      // AppBar(
      //   title: Text("Edit Student Attendance Reocrds"),
      // ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: widgets,
          ),
        ),
      ),
    );
  }

  Text _buildTitle(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: studentAttendanceModel.studentAttendanceDetails!
                .map((element) => Card(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${element.studentRecord!.student!.firstName ?? ''} ${element.studentRecord!.student!.middleName ?? ''} ${element.studentRecord!.student!.lastName ?? ''}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            element.studentRecord!.rollNumber != null
                                ? element.studentRecord!.rollNumber.toString()
                                : '--',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
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
                        ],
                      ),
                    ))
                .toList(),
          ),

          // Container(
          //     child: Column(
          //   children: studentAttendanceModel.studentAttendanceDetails!
          //       .map((element) => Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: <Widget>[
          //               Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>[
          //                     Text(
          //                       '${element.studentRecord!.student!.firstName ?? ''} ${element.studentRecord!.student!.middleName ?? ''} ${element.studentRecord!.student!.lastName ?? ''}',
          //                       maxLines: 2,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: const TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     const Padding(
          //                         padding: EdgeInsets.only(bottom: 2.0)),
          //                     Text(
          //                       element.studentRecord!.rollNumber != null
          //                           ? element.studentRecord!.rollNumber
          //                               .toString()
          //                           : '--',
          //                       maxLines: 2,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: const TextStyle(
          //                         fontSize: 12.0,
          //                         color: Colors.black54,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: <Widget>[
          //                     Text(
          //                       'Status',
          //                       style: const TextStyle(
          //                         fontSize: 12.0,
          //                         color: Colors.black87,
          //                       ),
          //                     ),
          //                     IconButton(
          //                       color: element.status != 'ABSENT'
          //                           ? Colors.greenAccent
          //                           : Colors.redAccent,
          //                       onPressed: () {
          //                         print(element.status);
          //                         setState(
          //                           () {
          //                             element.status =
          //                                 element.status != 'ABSENT'
          //                                     ? 'ABSENT'
          //                                     : 'PRESENT';
          //                           },
          //                         );
          //                       },
          //                       icon: Icon(element.status != 'ABSENT'
          //                           ? Icons.check
          //                           : Icons.close),
          //                     )
          //                     // Text(
          //                     //   '$publishDate - $readDuration',
          //                     //   style: const TextStyle(
          //                     //     fontSize: 12.0,
          //                     //     color: Colors.black54,
          //                     //   ),
          //                     // ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ))
          //       .toList(),
          // )),
          // Container(
          //   child: ListView.builder(
          //     itemCount:
          //         studentAttendanceModel.studentAttendanceDetails!.length,
          //     itemBuilder: (context, index) {
          //       StudentAttendanceDetailModel element = studentAttendanceModel
          //           .studentAttendanceDetails!
          //           .elementAt(index);
          //       return Card(
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Text(
          //                   '${element.studentRecord!.student!.firstName ?? ''} ${element.studentRecord!.student!.middleName ?? ''} ${element.studentRecord!.student!.lastName ?? ''}',
          //                   style: TextStyle(fontSize: 16, color: Colors.black),
          //                 ),
          //                 Text(
          //                   element.studentRecord!.rollNumber != null
          //                       ? element.studentRecord!.rollNumber.toString()
          //                       : '--',
          //                   style: TextStyle(fontSize: 16, color: Colors.black),
          //                 ),
          //                 IconButton(
          //                   color: element.status != 'ABSENT'
          //                       ? Colors.greenAccent
          //                       : Colors.redAccent,
          //                   onPressed: () {
          //                     print(element.status);
          //                     setState(
          //                       () {
          //                         element.status = element.status != 'ABSENT'
          //                             ? 'ABSENT'
          //                             : 'PRESENT';
          //                       },
          //                     );
          //                   },
          //                   icon: Icon(element.status != 'ABSENT'
          //                       ? Icons.check
          //                       : Icons.close),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // DataTable(
          //   columns: [
          //     DataColumn(label: Text('Student Name')),
          //     DataColumn(label: Text('Roll Number')),
          //     DataColumn(label: Text('Option')),
          //   ],
          //   rows: studentAttendanceModel
          //       .studentAttendanceDetails! // Loops through dataColumnText, each iteration assigning the value to element
          //       .map(
          //         ((element) => DataRow(
          //               cells: <DataCell>[
          //                 DataCell(
          //                   Text(
          //                     '${element.studentRecord!.student!.firstName} ${element.studentRecord!.student!.middleName} ${element.studentRecord!.student!.lastName}',
          //                     style:
          //                         TextStyle(fontSize: 16, color: Colors.black),
          //                   ),
          //                 ), //Extracting from Map element the value
          //                 DataCell(Text(
          //                     element.studentRecord!.rollNumber != null
          //                         ? element.studentRecord!.rollNumber.toString()
          //                         : '--',
          //                     style: TextStyle(
          //                         fontSize: 16, color: Colors.black))),
          //                 DataCell(
          //                   IconButton(
          //                     color: element.status != 'ABSENT'
          //                         ? Colors.greenAccent
          //                         : Colors.redAccent,
          //                     onPressed: () {
          //                       print(element.status);
          //                       setState(
          //                         () {
          //                           element.status = element.status != 'ABSENT'
          //                               ? 'ABSENT'
          //                               : 'PRESENT';
          //                         },
          //                       );
          //                     },
          //                     icon: Icon(element.status != 'ABSENT'
          //                         ? Icons.check
          //                         : Icons.close),
          //                   ),
          //                 ),
          //               ],
          //             )),
          //       )
          //       .toList(),
          // ),
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
                    .then(
                  (value) {
                    Navigator.pop(context);
                    return HttpUtils.showSuccess(context, value);
                  },
                ).onError((error, stackTrace) =>
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
