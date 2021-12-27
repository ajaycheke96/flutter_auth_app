import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Dashboard/admin_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/employee_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/parent_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Screens/Welcome/componentss/body.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';

class WelcomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Body(),);
    return FutureBuilder(
        future: _authService.checkService(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.data == true) {
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
                    break;
                }
              },
            );
          } else {
            return LoginScreen();
          }
          return Center(
            child: CircularProgressIndicator(),
          );

          // return MaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   home: Scaffold(body: Center(child: CupertinoActivityIndicator())),
          // );
        });
  }
}
