import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/profile_image_helper.dart';
import 'package:flutter_auth_app/Screens/UserProfile/services/user_utils.dart';
import 'package:flutter_auth_app/Services/student_service.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final StudentService _studentService = StudentService();

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
    return FutureBuilder<StudentProfile>(
      future: _studentService
          .getStudentProfileRecord(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        late List<Widget> children;
        if (snapshot.hasData) {
          print(snapshot.data);
          StudentProfile studentProfile = snapshot.data;
          children = _buildStudentProfilePage(studentProfile);
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

  _buildStudentProfilePage(StudentProfile studentProfile) {
    var record = {
      "Personal Details": {
        "Date of Birth": studentProfile.dateOfBirth,
        "Contact Number": studentProfile.contactNumber,
        "Email-Id": studentProfile.emailId,
        "Gender": studentProfile.gender,
      },
      "Educational Details": {
        "Batch": studentProfile.batchName,
        "Course": studentProfile.courseName,
      },
      "Guardian Details": {
        "First Guardian Name": studentProfile.firstGuardianName != null
            ? studentProfile.firstGuardianName
            : '-',
        "First Guardian Contact Number":
            studentProfile.firstGuardianContact != null
                ? studentProfile.firstGuardianContact
                : '-',
        "First Guardian Email-Id": studentProfile.firstGuardianEmail != null
            ? studentProfile.firstGuardianEmail
            : '-',
        "First Guardian Relation": studentProfile.firstGuardianRelation != null
            ? studentProfile.firstGuardianRelation
            : '-',
        "Second Guardian Name": studentProfile.secondGuardianName != null
            ? studentProfile.secondGuardianName
            : '-',
        "Second Guardian Contact Number":
            studentProfile.secondGuardianContact != null
                ? studentProfile.secondGuardianContact
                : '-',
        "Second Guardian Email-Id": studentProfile.secondGuardianEmail != null
            ? studentProfile.secondGuardianEmail
            : '-',
        "Second Guardian Relation":
            studentProfile.secondGuardianRelation != null
                ? studentProfile.secondGuardianRelation
                : '-',
      },
      "Address Details": {
        "Present Address": studentProfile.presentAddress,
        "Permanant Address": studentProfile.permanentAddress,
      },
    };

    Map<String, dynamic> personalDetalisRecord = {};
    personalDetalisRecord.addEntries(
      [
        record.entries.elementAt(0),
        record.entries.elementAt(3),
      ],
    );

    Map<String, dynamic> guardianDetailsRecord = {};
    guardianDetailsRecord.addEntries([
      record.entries.elementAt(1),
    ]);

    Map<String, dynamic> educationalDetailsRecord = {};
    educationalDetailsRecord.addEntries([
      record.entries.elementAt(2),
    ]);

    UserUtils userUtils = UserUtils();
    List<Widget> children = [
      ProfileImageHelper(imageName: studentProfile.studentPhoto),
      SizedBox(
        height: 24,
      ),
      userUtils.buildName(
        name: studentProfile.studentName,
        uniqueIdentificationNumber: studentProfile.uniqueIdentificationNumber,
      ),
      SizedBox(
        height: 24,
      ),
      // userUtils.createRecord(record),
      // SizedBox(
      //   height: 24,
      // ),
      userUtils.tabSection(context, personalDetalisRecord, educationalDetailsRecord,
          guardianDetailsRecord),
    ];

    return children;
  }
}

// buildButton(BuildContext context, String value, String name) => MaterialButton(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       onPressed: () {},
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             "",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           SizedBox(
//             height: 2,
//           ),
//           Text(
//             "",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//         ],
//       ),
//     );



// class ImageSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image slider demo')),
//       body: Container(
//           child: CarouselSlider(
//         options: CarouselOptions(),
//         items: imgList
//             .map((item) => Container(
//                   child: Center(
//                       child:
//                           Image.network(item, fit: BoxFit.cover, width: 1000)),
//                 ))
//             .toList(),
//       )),
//     );
//   }
// }