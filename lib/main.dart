import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Dashboard/admin_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/parent_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Screens/ResizablePage/resizable_page.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_day_screen.dart';
import 'package:flutter_auth_app/Screens/Students/StudentAttendance/student_attendance_list_screen.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/constants.dart';

void main() {
  runApp(const MyApp());
  // runApp(ResizableApp());
}

// class ResizableApp extends StatelessWidget {
//   const ResizableApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Academy Assist',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: ResizeablePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                FutureBuilder(
                  future: AuthService().getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data as UserStore != null) {
                        UserStore userStore = snapshot.data as UserStore;
                        switch (userStore.roleName.toString()) {
                          case 'ROLE_STUDENT':
                            return StudentDashboard();

                          case 'ROLE_ADMIN':
                            return AdminDashboard();

                          case 'ROLE_PARENT':
                            return ParentDashboard();

                          default:
                            return LoginScreen();
                        }
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              } else {
                return LoginScreen();
              }
            }
            // return LoginScreen();
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
