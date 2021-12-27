import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Models/employee_model.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/profile_image_helper.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/user_utils.dart';
import 'package:flutter_auth_app/Services/employee_service.dart';

class EmployeeUserProfile extends StatefulWidget {
  const EmployeeUserProfile({Key? key}) : super(key: key);

  @override
  _EmployeeUserProfileState createState() => _EmployeeUserProfileState();
}

class _EmployeeUserProfileState extends State<EmployeeUserProfile> {
  final EmployeeService _employeeService = EmployeeService();

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
    return FutureBuilder<EmployeeProfileModel>(
      future: _employeeService
          .getEmployeeProfileRecord(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        late List<Widget> children;
        if (snapshot.hasData) {
          print(snapshot.data);
          EmployeeProfileModel employeeProfileModel = snapshot.data;
          children = _buildEmployeeProfilePage(employeeProfileModel);
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

  _buildEmployeeProfilePage(EmployeeProfileModel employeeProfileModel) {
    Map<String, Map<String, dynamic>> employeeDesignationMap =
        new Map<String, Map<String, dynamic>>();
    if (employeeProfileModel.employeeDesignations!.isNotEmpty) {
      for (int i = 0;
          i < employeeProfileModel.employeeDesignations!.length;
          i++) {
        EmployeeDesignationModel designationModel =
            employeeProfileModel.employeeDesignations!.elementAt(i);

        Map<String, dynamic> map = {
          "Date Effective": '${designationModel.dateEffective}',
          'Date End': '${designationModel.dateEnd}',
          'Department': '${designationModel.department!.name}',
          'Designation': '${designationModel.designation!.name}',
          'Is Teaching Employee':
              '${designationModel.designation!.isTeachingEmployee == 1 ? "YES" : "NO"}',
        };

        employeeDesignationMap.putIfAbsent(i.toString(), () => map);
      }
    }

    Map<String, Map<String, dynamic>> subjectTeachers =
        new Map<String, Map<String, dynamic>>();

    if (employeeProfileModel.subjectTeachers is List &&
        employeeProfileModel.subjectTeachers != null) {
      if (employeeProfileModel.subjectTeachers!.length > 0) {
        for (int j = 0; j < employeeProfileModel.subjectTeachers!.length; j++) {
          SubjectTeacherModel subjectTeacherModel =
              employeeProfileModel.subjectTeachers!.elementAt(j);

          Map<String, dynamic> map = {
            "Date Effective": '${subjectTeacherModel.dateEffective}',
            'Subject': '${subjectTeacherModel.subject!.name}',
            'Batch': '${subjectTeacherModel.subject!.batch!.name}',
          };

          subjectTeachers.putIfAbsent(j.toString(), () => map);
        }
      }
    }

    Map<String, Map<String, dynamic>> record = {
      "Personal Details": {
        "Date of Birth": employeeProfileModel.dateOfBirth,
        "Contact Number": employeeProfileModel.contactNumber,
        "Email-Id": employeeProfileModel.email,
        "Gender": employeeProfileModel.gender,
      },
      "Family Details": {
        "Father Name": '${employeeProfileModel.fatherName}',
        "Mother Name": '${employeeProfileModel.motherName}',
        "Marital Status": '${employeeProfileModel.maritalStatus}',
        "Spouse Name": '${employeeProfileModel.spouseName}',
        "Date of Anniversary": '${employeeProfileModel.dateOfAnniversary}'
      },
      "Address Details": {
        "Present Address": employeeProfileModel.presentAddress,
        "Permanant Address": employeeProfileModel.permanentAddress,
      },
      "Designation Details": employeeDesignationMap,
      "Teaching Subject": subjectTeachers,
    };
    UserUtils userUtils = UserUtils();
    List<Widget> children = [
      ProfileImageHelper(imageName: employeeProfileModel.photo),
      SizedBox(
        height: 24,
      ),
      userUtils.buildName(
        name: employeeProfileModel.name,
        uniqueIdentificationNumber:
            employeeProfileModel.uniqueIdentificationNumber,
      ),
      SizedBox(
        height: 24,
      ),
      // userUtils.createRecord(record),
      userUtils.tabSection(
        context,
        Map.fromEntries(
          [
            record.entries.elementAt(0),
            record.entries.elementAt(2),
          ],
        ),
        Map.fromEntries(
          [
            record.entries.elementAt(1),
          ],
        ),
        Map.fromEntries(
          [
            record.entries.elementAt(3),
            record.entries.elementAt(4),
          ],
        ),
      ),
    ];

    return children;
  }
}
