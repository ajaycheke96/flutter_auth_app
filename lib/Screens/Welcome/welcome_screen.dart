import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Screens/Dashboard/admin_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/parent_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/login_screen.dart';
import 'package:flutter_auth_app/Screens/Welcome/componentss/body.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Body(),);
    return FutureBuilder(
        future: AuthService().checkService(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return StudentDashboard();
              // FutureBuilder(
              //   future: AuthService().getUserData(),
              //   builder: (context, snapshot) {
              //     print(snapshot);
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.data as UserStore != null) {
              //         UserStore userStore = snapshot.data as UserStore;
              //         switch (userStore.roleName.toString()) {
              //           case 'ROLE_STUDENT':
              //             return StudentDashboard();
              //             break;

              //           case 'ROLE_ADMIN':
              //             return AdminDashboard();
              //             break;

              //           case 'ROLE_PARENT':
              //             return ParentDashboard();
              //             break;
              //           default:
              //         }
              //         // if(userStore.roleName.toString() == "ROLE_STUDENT"){

              //         // }
              //       }
              //     }
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   },
              // );
            } else {
              return LoginScreen();
            }
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
