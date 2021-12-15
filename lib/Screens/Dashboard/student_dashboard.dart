import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {

  final String routeName='/student-dashboard'; 

  const StudentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Student user page"),
      ),
    );
  }
}
