import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/profile_image_helper.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/user_utils.dart';
import 'package:flutter_auth_app/Services/student_service.dart';

class ParentUserProfile extends StatefulWidget {
  const ParentUserProfile({Key? key}) : super(key: key);

  @override
  _ParentUserProfileState createState() => _ParentUserProfileState();
}

class _ParentUserProfileState extends State<ParentUserProfile> {
  final StudentService _studentService = StudentService();
  final UserUtils userUtils = UserUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [_checkAndbuildProfile()],
      ),
    );
  }

  Widget _checkAndbuildProfile() {
    return FutureBuilder<ParentProfileModel>(
      future: _studentService
          .getStudentParentProfileRecord(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        late List<Widget> children;
        if (snapshot.hasData) {
          print(snapshot.data);
          ParentProfileModel parentProfileModel = snapshot.data;
          children = _buildProfilePage(parentProfileModel);
        } else if (snapshot.hasError) {
          print(snapshot.hasError);
          children = <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }

  _buildProfilePage(ParentProfileModel parentProfileModel) {
    Map<String, Map<String, dynamic>> studentList =
        new Map<String, Map<String, dynamic>>();

    if (parentProfileModel.students is List &&
        parentProfileModel.students != null) {
      if (parentProfileModel.students!.length > 0) {
        for (int j = 0; j < parentProfileModel.students!.length; j++) {
          StudentProfile studentProfile =
              parentProfileModel.students!.elementAt(j);

          Map<String, dynamic> map = {
            "Name": '${studentProfile.studentName}',
            "Date of Birth": '${studentProfile.dateOfBirth}',
            "Contact Number": '${studentProfile.contactNumber}',
            "Email-Id": '${studentProfile.emailId}',
            "Gender": '${studentProfile.gender}',
            "Batch": '${studentProfile.batchName}',
            "Course": '${studentProfile.courseName}',
          };

          studentList.putIfAbsent(j.toString(), () => map);
        }
      }
    }

    var record = {
      "Personal Details": {
        "Date of Birth":
            '${parentProfileModel.studentParent!.firstGuardianDateOfBirth}',
        "Contact Number":
            '${parentProfileModel.studentParent!.firstGuardianContactNumber1}',
        "Email-Id": '${parentProfileModel.studentParent!.firstGuardianEmail}',
        "Gender": '${parentProfileModel.studentParent!.firstGuardianRelation}',
      },
      "Educational Details": {
        "Qualification":
            '${parentProfileModel.studentParent!.firstGuardianQualification}',
        "Occupation":
            '${parentProfileModel.studentParent!.firstGuardianOccupation}',
      },
      "Student Details": studentList
    };

    List<Widget> children = [
      ProfileImageHelper(
          imageName: parentProfileModel.studentParent!.firstGuardianPhoto),
      SizedBox(
        height: 24,
      ),
      userUtils.buildName(
        name: '${parentProfileModel.studentParent!.firstGuardianName}',
        uniqueIdentificationNumber:
            '${parentProfileModel.studentParent!.firstGuardianUniqueIdentificationNumber}',
      ),
      SizedBox(
        height: 24,
      ),
      userUtils.tabSection(
          context,
          // Personal Details
          Map.fromEntries([
            record.entries.elementAt(0),
          ]),
          // Educational Details
          Map.fromEntries([
            record.entries.elementAt(1),
          ]),
          // Student Details
          Map.fromEntries([
            record.entries.elementAt(2),
          ])),
    ];

    return children;
  }
}
