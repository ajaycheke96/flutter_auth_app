import 'package:flutter/material.dart';
import 'package:flutter_auth_app/Models/login_model.dart';
import 'package:flutter_auth_app/Screens/Dashboard/admin_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/employee_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/parent_dashboard.dart';
import 'package:flutter_auth_app/Screens/Dashboard/student_dashboard.dart';
import 'package:flutter_auth_app/Screens/Login/components/background.dart';
import 'package:flutter_auth_app/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth_app/Services/auth_service.dart';
import 'package:flutter_auth_app/components/already_have_an_account_check.dart';
import 'package:flutter_auth_app/components/progress_indicator.dart';
import 'package:flutter_auth_app/components/rounded_button.dart';
import 'package:flutter_auth_app/components/rounded_input_field.dart';
import 'package:flutter_auth_app/components/rounded_password_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final Future<SharedPreferences> _prfrc = SharedPreferences.getInstance();
  bool isApiCallProcess = false;

  String email = '', password = '', message = '';
  // late LoginRequestModel requestModel;

  late UserStore user;

  @override
  void initState() {
    // requestModel=LoginRequestModel('', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomProgressIndicator(
        child: _uiSetup(context), inAsyncCall: isApiCallProcess);
  }

  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                setState(() {
                  isApiCallProcess = true;
                });
                loginSubmitted(email, password);
              },
            ),
            SizedBox(height: size.height * 0.03),
            Text(message != '' ? message : ''),
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignupScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  bool verifyUser(String requestedRole, String currentRole) {
    return requestedRole == currentRole;
  }

  loginSubmitted(String email, String password) {
    print("" + email + "" + password);
    AuthService().login(email, password).then(
          (value) => {
            email = password = '',
            user = value,
            isApiCallProcess = false,
            // user = UserStore(value.userId, value.username,
            //     value.roleId, value.roleName, value.token),
            print(user.roleId),
            if (user.roleName.toString() == "ROLE_STUDENT")
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentDashboard(),
                  ),
                ),
              }
            else if (user.roleName.toString() == "ROLE_ADMIN")
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdminDashboard(),
                  ),
                ),
              }
            else if (user.roleName.toString() == "ROLE_PARENT")
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ParentDashboard(),
                  ),
                ),
              }
            else if (user.roleName.toString() == "ROLE_TEACHER")
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmployeeDashboard(),
                  ),
                ),
              }
          },
        );
  }
}
