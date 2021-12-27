import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Dashboard/admin_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/employee_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/parent_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_day_screen.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_list_screen.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/constants.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academy Assist',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        StudentAttendanceListScreen.routeName: (ctx) =>
            StudentAttendanceListScreen(),
        StudentAttendanceDayScreen.routeName: (ctx) =>
            StudentAttendanceDayScreen(),
      },
      home: FutureBuilder(
          future: AuthService().checkService(),
          builder: (context, snapshot) {
            print("From Main " + snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                // return StudentDashboard();
                _authService.getUserData().then(
                  (value) {
                    UserStore userStore = value;
                    switch (userStore.roleName.toString()) {
                      case 'ROLE_STUDENT':
                        return StudentDashboard();
                        break;

                      case 'ROLE_EMP':
                        return EmployeeDashboard();
                        break;

                      case 'ROLE_TEACHER':
                        return EmployeeDashboard();
                        break;

                      case 'ROLE_ADMIN':
                        return AdminDashboard();
                        break;

                      case 'ROLE_PARENT':
                        return ParentDashboard();
                        break;

                      default:
                        _authService.removeAllLoginRecords();
                        return LoginScreen();
                        break;
                    }
                  },
                );
              } else {
                return LoginScreen();
              }
            }
            return LoginScreen();
            // return Center(
            //   child: CircularProgressIndicator(),
            // );
          }),
    );
  }
}
