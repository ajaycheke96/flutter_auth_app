import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/academic_model.dart';
import 'package:flutter_auth_app/Services/academic_service.dart';
import 'package:flutter_auth_app/Services/student_service.dart';
import 'package:flutter_auth_app/constants.dart';

class DuesScreen extends StatefulWidget {
  DuesScreen({Key? key}) : super(key: key);

  @override
  State<DuesScreen> createState() => _DuesScreenState();
}

class _DuesScreenState extends State<DuesScreen> {
  final StudentService _studentService = StudentService();
  final AcademicService _academicService = AcademicService();

  AcademicSessionModel selectedAcademicSession = AcademicSessionModel();

  @override
  void initState() {
    _fetchAllAcademicSessions();
    super.initState();
  }

  _fetchAllAcademicSessions() {
    _academicService.getDefaultAcademicSession().then((value) {
      // setState(() {
      //   selectedAcademicSession = value;
      // });
      // if (selectedAcademicSession.id != null) {

      _fetchInitRecords(value);
      // }
    });
  }

  _fetchInitRecords(AcademicSessionModel academicSessionModel) {
    print(academicSessionModel.id);
    _studentService
        .getInvoiceReceiptsByUser(academicSessionModel)
        .then((value) => print(value.studentRecord!.id));
  }

  final List<Map<String, String>> _data = [
    {
      "name": "Reciept 1",
      "amount": "100",
      "date": "2021-12-01",
      "status": "PAID",
      "type": "Online"
    },
    {
      "name": "Reciept 2",
      "amount": "300",
      "date": "2021-11-01",
      "status": "PAID",
      "type": "Online"
    },
    {
      "name": "Reciept 3",
      "amount": "200",
      "date": "2021-10-01",
      "status": "PAID",
      "type": "Online"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              buildDuesCard("Pending", "600"),
              buildDuesCard("Paid", "2000"),
              buildDuesCard("Total", "2600"),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              child: Text("Reciept Details"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDuesCard(String title, String value) => Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5), fontSize: 14),
            ),
            Text(
              value,
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
